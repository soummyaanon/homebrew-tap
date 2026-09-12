class Purge < Formula
  desc "Reclaim the regenerable junk on your Mac: build output, caches, Xcode, agents"
  homepage "https://purge.bixai.dev/"
  url "https://registry.npmjs.org/purge-cli/-/purge-cli-0.7.1.tgz"
  sha256 "ef46e9196b50571587463b0299d7cb125d4f3254e2c896a19d32064a71d08f15"
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
