class Retrobasic < Formula
  desc "RetroBASIC interpreter for classic BASIC programs"
  homepage "https://github.com/maurymarkowitz/RetroBASIC"
  url "https://github.com/maurymarkowitz/RetroBASIC/archive/refs/tags/v.3.0.6.tar.gz"
  sha256 "d9ff43ba03e3571e96c86dd927d9192ed37a1c51ef479afd8adcec57b634c4e5"
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
