cask "envy-hypothesis" do
  version "0.1.0"
  sha256 "66204003a3b475e89f3dc3cebf78a45dbd55153ee9c700774d031172fed7a889"

  url "https://github.com/xzchick/envy-hypothesis/releases/download/v#{version}/envy-hypothesis-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-hypothesis/"
  name "ENVY Hypothesis"
  desc "Offline Analysis of Competing Hypotheses, encrypted at rest"
  homepage "https://github.com/xzchick/envy-hypothesis"

  depends_on arch: :arm64

  binary "envy-hypothesis-v#{version}-macos-arm64/envy-hypothesis"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-hypothesis
  EOS
end
