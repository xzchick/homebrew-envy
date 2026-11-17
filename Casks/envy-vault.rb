cask "envy-vault" do
  version "0.2.2"
  sha256 "447438e1a1f7e6eaf6b581ae116e68f743a4b175f7c842b456619b84255b85be"

  url "https://github.com/xzchick/envy-vault/releases/download/v#{version}/envy-vault-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-vault/"
  name "ENVY Vault"
  desc "Authenticated local AES-256 file encryption with a native window"
  homepage "https://github.com/xzchick/envy-vault"

  depends_on arch: :arm64

  binary "envy-vault-v#{version}-macos-arm64/envy-vault"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-vault
  EOS
end
