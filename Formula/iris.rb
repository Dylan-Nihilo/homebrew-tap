class Iris < Formula
  desc "Screen recorder that zooms on what matters, for people and for AI agents"
  homepage "https://github.com/Dylan-Nihilo/iris"
  url "https://github.com/Dylan-Nihilo/iris/releases/download/v0.1.0/iris-macos-universal.tar.gz"
  sha256 "313b58141b52592970745a848edb55bb691e6f3acf1669c605f7628cbcb909b9"
  license "MIT"

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
