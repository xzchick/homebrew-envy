cask "hash-audit" do
  version "0.1.0"
  sha256 "ca4828d42ec832c21aacce6d49fa21b2af4b7b68f685e0c0b5b05aa766b11154"

  url "https://github.com/xzchick/hash-audit/releases/download/v#{version}/hash-audit-v#{version}-macos-arm64.tar.gz",
      verified: "github.com/xzchick/hash-audit/"
  name "Hash Audit"
  desc "Local hash auditing and authorized password recovery with Hashcat or John"
  homepage "https://github.com/xzchick/hash-audit"

  depends_on arch: :arm64

  binary "hash-audit-v#{version}-macos-arm64/hash-audit"

  caveats <<~EOS
    Hash Audit drives a recovery engine you install yourself:

      brew install hashcat        # and/or: brew install john-jumbo
      hash-audit doctor

    For hashes you own or are authorized to test.
    These builds are not notarized, so macOS may block them the first time:

      xattr -dr com.apple.quarantine "#{staged_path}"
  EOS
end
