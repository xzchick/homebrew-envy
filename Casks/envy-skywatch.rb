cask "envy-skywatch" do
  version "0.1.0"
  sha256 "9cc454d819bdcc876dc1efd07017b257f7d0e8e8710f8f6a32fd4717376ef989"

  url "https://github.com/xzchick/envy-skywatch/releases/download/v#{version}/envy-skywatch-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-skywatch/"
  name "ENVY SkyWatch"
  desc "Encrypted watchlists with offline content scanning"
  homepage "https://github.com/xzchick/envy-skywatch"

  depends_on arch: :arm64

  binary "envy-skywatch-v#{version}-macos-arm64/envy-skywatch"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-skywatch
  EOS
end
