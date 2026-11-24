cask "envy-tools" do
  version "0.1.1"
  sha256 "7aed9ec82566da7131a2222a893b9a150822fbd9da24106c3e0f225b282e31de"

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
