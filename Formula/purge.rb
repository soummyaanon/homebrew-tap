class Purge < Formula
  desc "Reclaim the regenerable junk on your Mac: build output, caches, Xcode, agents"
  homepage "https://purge.bixai.dev/"
  url "https://registry.npmjs.org/purge-cli/-/purge-cli-0.8.0.tgz"
  sha256 "11b196fed3c25f5001d620f003804b4f8f696267f4b5d42f5b3de9862d009daf"
  license "MIT"

  depends_on :macos
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/purge-cli --version")
  end
end
