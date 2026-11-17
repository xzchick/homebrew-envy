cask "envy-oracle" do
  version "0.2.2"
  sha256 "ec0bc257849fbedf44946575177a84081eb0f8b6de1e5f11953aba710e34c4f6"

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
