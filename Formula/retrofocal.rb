class Retrofocal < Formula
  desc "RetroFOCAL interpreter for classic FOCAL programs"
  homepage "https://github.com/maurymarkowitz/RetroFOCAL"
  url "https://github.com/maurymarkowitz/RetroFOCAL/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "GPL-2.0-or-later"

  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "retrofocal"

    pkgshare.install "README.md"
    pkgshare.install "examples"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/retrofocal --help")
    (testpath/"hello.fc").write("1.00 TYPE \"Hello\"\n1.10 STOP\n")
    output = shell_output("#{bin}/retrofocal #{testpath}/hello.fc")
    assert_match "Hello", output
  end
end
