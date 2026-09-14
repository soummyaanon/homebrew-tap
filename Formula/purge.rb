class Purge < Formula
  desc "Reclaim the regenerable junk on your Mac: build output, caches, Xcode, agents"
  homepage "https://purge.bixai.dev/"
  url "https://registry.npmjs.org/purge-cli/-/purge-cli-0.8.2.tgz"
  sha256 "b6d3156724dd08ca023894c58bfa83f3646a1e7651bcc963f56e7a033bc5ad68"
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
