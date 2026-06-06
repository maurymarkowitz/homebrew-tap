class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.2.1.0.tar.gz"
  sha256 "9f3a677c8c0f0468b94fb9008bd76f57cfda73b0bd3e69ad5bd5a9f785d7bad4"
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
