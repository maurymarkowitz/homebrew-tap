class Retrobasic < Formula
  desc "RetroBASIC interpreter for classic BASIC programs"
  homepage "https://github.com/maurymarkowitz/RetroBASIC"
  url "https://github.com/maurymarkowitz/RetroBASIC/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
