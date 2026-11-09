cask "envy-veil" do
  version "0.1.0"
  sha256 "1acc6c1e377c845d6f04ebdee8738d8bb1c9ff529108c5292a48abe7a8bbf617"

  url "https://github.com/xzchick/envy-veil/releases/download/v#{version}/envy-veil-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-veil/"
  name "ENVY Veil"
  desc "Hide an encrypted file inside a lossless image or audio carrier"
  homepage "https://github.com/xzchick/envy-veil"

  depends_on arch: :arm64

  binary "envy-veil-v#{version}-macos-arm64/envy-veil"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-veil
  EOS
end
