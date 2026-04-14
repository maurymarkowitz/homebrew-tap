class Opt65 < Formula
  desc "6502/65C02 assembly analyzer and optimizer"
  homepage "https://github.com/maurymarkowitz/opt65"
  url "https://github.com/maurymarkowitz/opt65/archive/refs/tags/v.1.1.0.tar.gz"
  sha256 "1fd1a9a4124274e7f0b0cf73a388e534e863322ad1021d70f0d38eaeb3e20b7c"
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
