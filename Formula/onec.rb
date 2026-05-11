class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.1.4.0.tar.gz"
  sha256 "e6f4c96031dcd3e066f12a5975510085b99fc33e70e1f639aa40f3290b63b19a"
  license "MIT"

  def install
    system "make"

    bin.install "onec"
    lib.install "libonec.a"
    man1.install "doc/onec.1"

    # Full documentation tree
    doc.install Dir["doc/*"]

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
