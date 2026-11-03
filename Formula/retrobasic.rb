class Retrobasic < Formula
  desc "RetroBASIC interpreter for classic BASIC programs"
  homepage "https://github.com/maurymarkowitz/RetroBASIC"
  url "https://github.com/maurymarkowitz/RetroBASIC/archive/refs/tags/v.3.1.2.tar.gz"
  sha256 "1ee296ce1f21d1f144cf60a4837021311d10bd85fa67e1771dc3c4d0a449ee56"
  license "GPL-2.0-or-later"

  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "retrobasic"

    # Install .desktop file for Linux desktop integration only
    if OS.linux? && File.exist?("src/retrobasic.desktop")
      (share/"applications").mkpath
      cp "src/retrobasic.desktop", share/"applications/retrobasic.desktop"
    end

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
