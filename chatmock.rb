class Chatmock < Formula
  include Language::Python::Virtualenv

  desc "OpenAI & Ollama compatible API powered by your ChatGPT plan"
  homepage "https://github.com/RayBytes/ChatMock"
  url "https://github.com/RayBytes/ChatMock/archive/refs/tags/v1.36.tar.gz"
  sha256 "7deda9adb8acf79379039a4cb0f4a13b592804e9b60083d3929cc992e0da0890"
  license "MIT"
  head "https://github.com/RayBytes/ChatMock.git", branch: "main"

  depends_on "python@3.11"

  def install
    virtualenv_create(libexec, "python3.11")
    system libexec/"bin/pip", "install", "."
    bin.install_symlink libexec/"bin/chatmock"
  end

  def caveats
    <<~EOS
      To get started with ChatMock:
        chatmock login
        chatmock serve
    EOS
  end

  test do
    output = shell_output("#{bin}/chatmock --help 2>&1")
    assert_match "ChatMock", output
  end
end
