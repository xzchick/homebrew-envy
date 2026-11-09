cask "envy-orbit" do
  version "0.1.0"
  sha256 "e6746b760703af9e35737ca51989d6784b97968bf746e35c9acaa1e85a375bf3"

  url "https://github.com/xzchick/envy-orbit/releases/download/v#{version}/envy-orbit-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-orbit/"
  name "ENVY Orbit"
  desc "Encrypted recurring-cadence tracking"
  homepage "https://github.com/xzchick/envy-orbit"

  depends_on arch: :arm64

  binary "envy-orbit-v#{version}-macos-arm64/envy-orbit"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-orbit
  EOS
end
