class Retrobasic < Formula
  desc "RetroBASIC interpreter for classic BASIC programs"
  homepage "https://github.com/maurymarkowitz/RetroBASIC"
  url "https://github.com/maurymarkowitz/RetroBASIC/archive/refs/tags/v.3.0.2.tar.gz"
  sha256 "b0123d84d2c2db67ee3be0397e2d1011bfe88a42de3d8115de48dcd37258d846"
  license "GPL-2.0-or-later"

  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "retrobasic"

    pkgshare.install "README.md"
    pkgshare.install "bas"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/retrobasic --help")
    (testpath/"hello.bas").write("10 PRINT \"Hello\"\n20 END\n")
    output = shell_output("#{bin}/retrobasic #{testpath}/hello.bas")
    assert_match "Hello", output
  end
end
