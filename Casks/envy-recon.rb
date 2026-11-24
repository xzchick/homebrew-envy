cask "envy-recon" do
  version "0.1.0"
  sha256 "79fc2877aa4128e3689c6414440df935e493aaaaff28f8e8bbd46d13b10cc78a"

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
