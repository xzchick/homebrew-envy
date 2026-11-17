cask "envy-hypothesis" do
  version "0.2.2"
  sha256 "f2d8d1e1afcaa90214e8341f744d0cf10a114f9c14ce4de72875eceb58d20d73"

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
