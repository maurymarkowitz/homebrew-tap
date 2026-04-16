class Opt65 < Formula
  desc "6502/65C02 assembly analyzer and optimizer"
  homepage "https://github.com/maurymarkowitz/opt65"
  url "https://github.com/maurymarkowitz/opt65/archive/refs/tags/v.1.2.0.tar.gz"
  sha256 "59d5ea9259b35314c4f961ccac6034a4621478e9625d89964b451a4446de0f18"
  license "GPL-2.0-or-later"

  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "opt65"

    pkgshare.install "README.md"
    pkgshare.install "docs"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/opt65 --help")
  end
end
