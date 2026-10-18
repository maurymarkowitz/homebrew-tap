class Retrobasic < Formula
  desc "RetroBASIC interpreter for classic BASIC programs"
  homepage "https://github.com/maurymarkowitz/RetroBASIC"
  url "https://github.com/maurymarkowitz/RetroBASIC/archive/refs/tags/v.3.1.0.tar.gz"
  sha256 "64d46a9ef2972ac5ed48915ea3868452843a42c9f8f9a270570ea52677aada8b"
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
