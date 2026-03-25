class Onec < Formula
  desc "OpenNEC antenna simulator"
  homepage "https://github.com/maurymarkowitz/OpenNEC"
  url "https://api.github.com/repos/maurymarkowitz/OpenNEC/tarball/v1.3.0"
  sha256 "cc44f03c3254d06724789c1334e14aea378211ea1564678f2060cf0e06c7281c"
  license "MIT"

  def install
    system "make"
    bin.install "onec"
  end

  test do
    system "#{bin}/onec", "--version"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
