class Retrojoss < Formula
  desc "RetroJOSS interpreter for old JOSS programs"
  homepage "https://github.com/maurymarkowitz/RetroJOSS"
  url "https://github.com/maurymarkowitz/RetroJOSS/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0-only"

  depends_on "flex" => :build
  depends_on "bison" => :build

  def install
    system "make", "clean"
    system "make"
    bin.install "retrojoss"

    # install docs and test corpus with formula package
    pkgshare.install "README.md"
    pkgshare.install "tests"
  end

  test do
    assert_match "Usage: retrojoss", shell_output("#{bin}/retrojoss --help")
    (testpath/"hello.joss").write("1.00 Type \\\"Hello\\\".\n1.10 Stop.\n")
    output = shell_output("#{bin}/retrojoss #{testpath}/hello.joss")
    assert_match "Hello", output
  end
end