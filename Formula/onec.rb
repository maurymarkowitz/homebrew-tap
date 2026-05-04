class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.1.3.8.tar.gz"
  sha256 "41a6c3b6e349da50eededd0c2688b7fe0123bcc192d4f1f30e5339c8f26b8fac"
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
