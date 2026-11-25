cask "envy-ops-desk" do
  version "0.2.3"
  sha256 "795409feec272a9dc13f492d30fbd8af049ced779a8dcef68d575747e31d1789"

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
