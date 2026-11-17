cask "envy-casebook" do
  version "0.2.2"
  sha256 "155b296550eb381926c0844811a7095a4704af61a757a551872832ce6349cf39"

  url "https://github.com/xzchick/envy-casebook/releases/download/v#{version}/envy-casebook-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-casebook/"
  name "ENVY Casebook"
  desc "Offline, encrypted, revision-preserving case notes"
  homepage "https://github.com/xzchick/envy-casebook"

  depends_on arch: :arm64

  binary "envy-casebook-v#{version}-macos-arm64/envy-casebook"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-casebook
  EOS
end
