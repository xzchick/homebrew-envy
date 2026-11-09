# homebrew-envy

A [Homebrew](https://brew.sh) tap for the **ENVY BLACK VEIL** suite — a set of
offline, encrypted native desktop tools for OSINT, forensics and analysis work.
Everything is local: no network, no accounts, no telemetry.

> **macOS (Apple Silicon) only.** These casks install the prebuilt arm64 bundles.
> On Linux or Windows, use the bundles on each project's Releases page, or install
> from PyPI with `pip install <name>`.

## Install

```sh
brew tap xzchick/envy
brew install --cask envy-vault
```

Then run it:

```sh
envy-vault --help
```

### Not notarized — first-run note

These are independent, unsigned open-source builds, so macOS Gatekeeper may block the
binary the first time. Either install without quarantine:

```sh
brew install --cask --no-quarantine envy-vault
```

…or clear the flag once after installing (the caveats printed on install show the
exact path).

## Apps in this tap

| Cask | What it is |
|---|---|
| `envy-vault` | Authenticated local AES-256 file encryption |
| `envy-veil` | Hide an encrypted file inside a lossless image or audio carrier (steganography) |
| `envy-hypothesis` | Analysis of Competing Hypotheses, encrypted and offline |
| `envy-oracle` | Encrypted forecast tracking with calibration scoring |
| `envy-skywatch` | Encrypted watchlists with offline content scanning |
| `envy-casebook` | Offline, encrypted, revision-preserving case notes |
| `envy-crypto` | Offline encoding, classical ciphers and text analysis |
| `envy-orbit` | Encrypted recurring-cadence tracking |
| `envy-ops-desk` | Encrypted operations plans with authenticated handoffs |
| `envy-evidence-vault` | Encrypted file intake with a hash-verified custody journal |
| `envy-integrity-monitor` | Encrypted file-integrity baselines with change detection |

Each app lives in its own repository under [github.com/xzchick](https://github.com/xzchick).

## How these are built

Every cask points at the `-macos-arm64.tar.gz` asset from that app's tagged GitHub
Release, pinned to the SHA-256 published in the release's `SHA256SUMS.txt`. The bundles
are produced by each repo's `release.yml` workflow (PyInstaller), on a `v*` tag.

## License

The tap metadata is MIT. Each application is licensed in its own repository (MIT).
