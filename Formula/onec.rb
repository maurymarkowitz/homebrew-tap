class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://github.com/maurymarkowitz/OpenNEC/archive/refs/tags/v.2.3.2.tar.gz"
  sha256 "aeff7be15752356846bb2eba9e0ddcb1b984cbdc53c65f653039004d7b9f607b"
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
