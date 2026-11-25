cask "envy-evidence-vault" do
  version "0.2.3"
  sha256 "fe6288253a6f999a03546d73dce90ce5712699da9a08b8c54f174432648e3a2a"

  url "https://github.com/xzchick/envy-evidence-vault/releases/download/v#{version}/envy-evidence-vault-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-evidence-vault/"
  name "ENVY Evidence Vault"
  desc "Encrypted file intake with a hash-verified custody journal"
  homepage "https://github.com/xzchick/envy-evidence-vault"

  depends_on arch: :arm64

  binary "envy-evidence-vault-v#{version}-macos-arm64/envy-evidence-vault"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-evidence-vault
  EOS
end
