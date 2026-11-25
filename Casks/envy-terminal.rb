cask "envy-terminal" do
  version "0.1.0"
  sha256 "ee600133a1b9f67b25589cc7cb68353b86689f503b7f0a63bbe310890f9c9e43"

  url "https://github.com/xzchick/envy-terminal/releases/download/v#{version}/envy-terminal-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/envy-terminal/"
  name "ENVY Terminal"
  desc "Local AI in your Terminal: fast and deep models, PDF search, cited research"
  homepage "https://github.com/xzchick/envy-terminal"

  depends_on arch: :arm64
  depends_on formula: "ollama"

  # The launchers find the app relative to their own folder, so the commands are
  # small wrappers that call them in place instead of bare symlinks.
  start_shim = "#{staged_path}/envy.wrapper.sh"
  setup_shim = "#{staged_path}/envy-setup.wrapper.sh"
  binary start_shim, target: "envy"
  binary setup_shim, target: "envy-setup"

  preflight do
    bundle = "#{staged_path}/envy-terminal-v#{version}-macos-arm64"
    File.write start_shim, "#!/bin/sh\nexec '#{bundle}/start-envy.sh' \"$@\"\n"
    File.write setup_shim, "#!/bin/sh\nexec '#{bundle}/setup-envy.sh' \"$@\"\n"
    FileUtils.chmod 0755, [start_shim, setup_shim]
  end

  caveats <<~EOS
    Run once to download the local model (about 5 GB):

      envy-setup

    Then start ENVY Terminal any time with:

      envy

    It runs its own Ollama on 127.0.0.1:11435 with cloud models off.
    These builds are not notarized, so macOS may block them the first time:

      xattr -dr com.apple.quarantine "#{staged_path}"
  EOS
end
