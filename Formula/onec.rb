class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.2.3.0.tar.gz"
  sha256 "b9b921bb53001e73da99badcfd8dad047981f9dcdf75bf84ec0913a5237825d9"
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
