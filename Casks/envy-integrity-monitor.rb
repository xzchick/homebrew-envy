cask "envy-integrity-monitor" do
  version "0.2.3"
  sha256 "6c94a3394767720a5a8036349d25a3b6a8450bce9d5f1f1883070b9c78ce4f60"

  url "https://github.com/xzchick/envy-integrity-monitor/releases/download/v#{version}/envy-integrity-monitor-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-integrity-monitor/"
  name "ENVY Integrity Monitor"
  desc "Encrypted file-integrity baselines with change detection"
  homepage "https://github.com/xzchick/envy-integrity-monitor"

  depends_on arch: :arm64

  binary "envy-integrity-monitor-v#{version}-macos-arm64/envy-integrity-monitor"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-integrity-monitor
  EOS
end
