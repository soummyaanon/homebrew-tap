class Purge < Formula
  desc "Reclaim the regenerable junk on your Mac: build output, caches, Xcode, agents"
  homepage "https://purge.bixai.dev/"
  url "https://registry.npmjs.org/purge-cli/-/purge-cli-0.8.1.tgz"
  sha256 "df9cca6f33783b921532a4c847917eaf49617f98a79ba15b9e139005cde95215"
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
