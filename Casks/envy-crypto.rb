cask "envy-crypto" do
  version "0.1.0"
  sha256 "88a4a53f72f24fb390c2b0ed3e72f382bd595187b2022bcc8d9aa8898835289b"

  url "https://github.com/xzchick/envy-crypto-workbench/releases/download/v#{version}/envy-crypto-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-crypto-workbench/"
  name "ENVY Cryptography Workbench"
  desc "Offline encoding, classical ciphers and text analysis"
  homepage "https://github.com/xzchick/envy-crypto-workbench"

  depends_on arch: :arm64

  binary "envy-crypto-v#{version}-macos-arm64/envy-crypto"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-crypto
  EOS
end
