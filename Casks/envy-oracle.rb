cask "envy-oracle" do
  version "0.1.0"
  sha256 "45a1e7a4862e4bf0f44fdf01b76649bc0755a7a6815124ace71a1b19fb17e402"

  url "https://github.com/xzchick/envy-oracle/releases/download/v#{version}/envy-oracle-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-oracle/"
  name "ENVY Oracle"
  desc "Encrypted forecast tracking with calibration scoring"
  homepage "https://github.com/xzchick/envy-oracle"

  depends_on arch: :arm64

  binary "envy-oracle-v#{version}-macos-arm64/envy-oracle"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-oracle
  EOS
end
