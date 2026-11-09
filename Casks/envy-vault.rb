cask "envy-vault" do
  version "0.1.0"
  sha256 "de0007a15e50d95b6c441165d4bb42eba675645b5ff62483e92806f244b21f6a"

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
