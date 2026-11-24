cask "envy-vault" do
  version "0.2.3"
  sha256 "a236f9cb721e0a889cbe4280a8c97b6df32f489601d0f7a7cebfa2810ed33177"

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
