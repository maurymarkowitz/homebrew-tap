class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.2.2.1.b2.tar.gz"
  sha256 "7283d50e6ef6c88c9c3b30375dbd25f8da69ff97894a1a0dde062cd56e36d6c4"
  license "MIT"

  def install
    system "make"

    bin.install "onec"
    lib.install "libonec.a"
    man1.install "docs/onec.1"

    # Full documentation tree
    doc.install Dir["docs/*"]

    # Examples bundled with documentation
    doc.install "examples"
  end

  test do
    system "#{bin}/onec", "--version"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
