cask "envy-recon" do
  version "0.1.1"
  sha256 "c0a707bcc54d18ae6e4e4780f2986fa496b5ec8ebb4bc05159af965effde40ea"

  url "https://github.com/xzchick/envy-recon/releases/download/v#{version}/envy-recon-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-recon/"
  name "ENVY Recon"
  desc "OSINT terminal for domains, IPs, certificates, web archives and file metadata"
  homepage "https://github.com/xzchick/envy-recon"

  depends_on arch: :arm64

  binary "envy-recon-v#{version}-macos-arm64/envy-recon"

  caveats <<~EOS
    These builds are not notarized (an independent open-source project), so macOS
    may refuse to run the binary the first time. If that happens, clear the
    quarantine flag once:

      xattr -dr com.apple.quarantine "#{staged_path}"

    Or install without quarantine in the first place:

      brew install --cask --no-quarantine envy-recon
  EOS
end
