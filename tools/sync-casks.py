#!/usr/bin/env python3
"""Sync every cask in Casks/ to its repo's latest GitHub release: bump `version` and
`sha256` (taken from that release's signed SHA256SUMS). Pure stdlib. Prints a summary;
leaves unchanged casks alone. Run by .github/workflows/sync-casks.yml."""
import glob
import os
import re
import urllib.request

HERE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CASKS = os.path.join(HERE, "Casks")
UA = {"User-Agent": "envy-tap-sync"}


def get(url):
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=30) as r:
        return r.read().decode()


def latest_tag(repo):
    import json
    data = json.loads(get(f"https://api.github.com/repos/xzchick/{repo}/releases/latest"))
    return data["tag_name"]  # e.g. v0.2.2


def sha_for(repo, tag, prefix):
    asset = f"{prefix}-{tag}-macos-arm64.tar.gz"
    for line in get(f"https://github.com/xzchick/{repo}/releases/download/{tag}/SHA256SUMS.txt").splitlines():
        parts = line.split()
        if len(parts) == 2 and parts[1] == asset:
            return parts[0], asset
    raise RuntimeError(f"no checksum for {asset}")


def main():
    changed = []
    for cp in sorted(glob.glob(os.path.join(CASKS, "*.rb"))):
        s = open(cp).read()
        m = re.search(r"github\.com/xzchick/([a-z0-9-]+)/releases", s)
        pm = re.search(r"/v#\{version\}/([a-z0-9-]+)-v#\{version\}-macos-arm64", s)
        if not (m and pm):
            print(f"{os.path.basename(cp)}: cannot parse repo/prefix, skip")
            continue
        repo, prefix = m.group(1), pm.group(1)
        cur = re.search(r'version "([^"]+)"', s).group(1)
        try:
            tag = latest_tag(repo)
        except Exception as e:
            print(f"{os.path.basename(cp)}: latest release lookup failed ({e}), skip")
            continue
        newver = tag.lstrip("v")
        if newver == cur:
            print(f"{os.path.basename(cp)}: up to date ({cur})")
            continue
        try:
            sha, _ = sha_for(repo, tag, prefix)
        except Exception as e:
            print(f"{os.path.basename(cp)}: {e}, skip")
            continue
        s = re.sub(r'version "[^"]+"', f'version "{newver}"', s, count=1)
        s = re.sub(r'sha256 "[0-9a-f]{64}"', f'sha256 "{sha}"', s, count=1)
        open(cp, "w").write(s)
        print(f"{os.path.basename(cp)}: {cur} -> {newver}")
        changed.append(os.path.basename(cp))
    print(f"\n{len(changed)} cask(s) updated: {', '.join(changed) if changed else 'none'}")


if __name__ == "__main__":
    main()
