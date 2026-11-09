cask "envy-evidence-vault" do
  version "0.1.0"
  sha256 "f3ccbe1a8704d9857ec0020f5dc68565e890e0162d8b1c79cb907d16031b4275"

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
