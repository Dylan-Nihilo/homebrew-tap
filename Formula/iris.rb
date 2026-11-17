class Iris < Formula
  desc "Screen recorder that zooms on what matters, for people and for AI agents"
  homepage "https://github.com/Dylan-Nihilo/iris"
  url "https://github.com/Dylan-Nihilo/iris/releases/download/v0.1.0/iris-macos-universal.tar.gz"
  sha256 "313b58141b52592970745a848edb55bb691e6f3acf1669c605f7628cbcb909b9"
  license "MIT"

  # Without a bottle Homebrew counts the install as a build from source and refuses it on a
  # machine whose Command Line Tools are out of date, although nothing is compiled.
  bottle do
    root_url "https://github.com/Dylan-Nihilo/homebrew-tap/releases/download/iris-0.1.0"
    sha256 cellar: :any_skip_relocation, all: "c98bd96df597eed01e2bfa6397d8d6598cfab39faed0a15fa98f31b484df3271"
  end

  depends_on macos: :sonoma

  def install
    bin.install "iris"
  end

  def caveats
    <<~EOS
      The application that launches iris (your terminal, or an agent's desktop app) needs
      the Screen & System Audio Recording permission in System Settings. To check:
        iris doctor
      GIF output needs ffmpeg:
        brew install ffmpeg
      To teach a coding agent to record:
        iris skill --claude
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/iris version")
  end
end
