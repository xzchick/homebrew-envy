cask "envy-tools" do
  version "0.1.2"
  sha256 "b6556e40215af6de535e496295fa44422f6426100dcf18e25a7521de7934b291"

  url "https://github.com/xzchick/envy-tools/releases/download/v#{version}/envy-tools-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-tools/"
  name "ENVY Tools"
  desc "Find, install and update every ENVY app with verified downloads"
  homepage "https://github.com/xzchick/envy-tools"

  depends_on arch: :arm64

  binary "envy-tools-v#{version}-macos-arm64/envy-tools"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-tools
  EOS
end
