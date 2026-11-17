cask "envy-veil" do
  version "0.2.2"
  sha256 "9e6e164faf270920b28ca213c6f846de134995e28a4596d4084d42c47dd3c3a4"

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
