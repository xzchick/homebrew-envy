cask "envy-ops-desk" do
  version "0.1.0"
  sha256 "e8f33fa2a060b16ddbf568142849c9958e17457bec5f827eeee4028d7a2805d3"

  url "https://github.com/xzchick/envy-ops-desk/releases/download/v#{version}/envy-ops-desk-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-ops-desk/"
  name "ENVY Ops Desk"
  desc "Encrypted operations plans with authenticated handoffs"
  homepage "https://github.com/xzchick/envy-ops-desk"

  depends_on arch: :arm64

  binary "envy-ops-desk-v#{version}-macos-arm64/envy-ops-desk"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-ops-desk
  EOS
end
