cask "envy-tunnel" do
  version "0.1.0"
  sha256 "b67f114ee7a2f1878fea7c774595325a59154ef2a31bc146f610e989d8eec998"

  url "https://github.com/xzchick/envy-tunnel/releases/download/v#{version}/envy-tunnel-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-tunnel/"
  name "ENVY Tunnel"
  desc "Self-hosted WireGuard VPN: set up your own server and devices"
  homepage "https://github.com/xzchick/envy-tunnel"

  depends_on arch: :arm64

  binary "envy-tunnel-v#{version}-macos-arm64/envy-tunnel"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-tunnel
  EOS
end
