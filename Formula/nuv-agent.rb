class NuvAgent < Formula
  include Language::Python::Virtualenv

  desc "Nuvion on-device agent"
  homepage "https://github.com/plaid-ai/NUV-agent"
  url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
  sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  version "0.1.1"
  license "Proprietary"

  depends_on "python@3.14"
  depends_on "gstreamer"
  depends_on "gst-plugins-base"
  depends_on "gst-plugins-good"
  depends_on "gst-plugins-bad"
  depends_on "gst-plugins-ugly"
  depends_on "gst-libav"
  depends_on "gobject-introspection"
  depends_on "pygobject3"

  resource "numpy" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "python-dotenv" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "websockets" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "stomper" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "aiohttp" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "aiohappyeyeballs" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "aiosignal" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "attrs" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "frozenlist" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "multidict" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "propcache" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "yarl" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "idna" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "future" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  resource "typing-extensions" do
    url "https://github.com/plaid-ai/NUV-agent/releases/download/v0.1.1/nuv_agent-0.1.1.tar.gz"
    sha256 "611612bb5318867d27c83559b84e1fc65c45410bbc143e47424acd7b31e2e5d3"
  end

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    venv = virtualenv_create(libexec, python, system_site_packages: true)

    resources.each do |r|
      r.stage do
        wheel = Dir["*.whl"].first
        target = wheel ? Pathname.pwd/wheel : Pathname.pwd
        system python, "-m", "pip", "--python=#{venv.root}/bin/python", "install",
               "--no-deps", "--ignore-installed", "--no-compile", "--only-binary=:all:", target
      end
    end

    system python, "-m", "pip", "--python=#{venv.root}/bin/python", "install",
           "--no-deps", "--ignore-installed", "--no-compile", buildpath
    (etc/"nuv-agent").mkpath

    env = {
      "DYLD_LIBRARY_PATH" => "#{HOMEBREW_PREFIX}/lib",
      "GI_TYPELIB_PATH" => "#{HOMEBREW_PREFIX}/lib/girepository-1.0",
      "GST_PLUGIN_PATH" => "#{HOMEBREW_PREFIX}/lib/gstreamer-1.0",
    }
    real_bin = libexec/"bin/nuv-agent"
    (bin/"nuv-agent").unlink if (bin/"nuv-agent").exist?
    (bin/"nuv-agent").write_env_script(real_bin, env)
  end

  service do
    run [opt_bin/"nuv-agent", "run"]
    keep_alive true
    environment_variables NUV_AGENT_CONFIG: etc/"nuv-agent/agent.env",
                          DYLD_LIBRARY_PATH: "#{HOMEBREW_PREFIX}/lib",
                          GI_TYPELIB_PATH: "#{HOMEBREW_PREFIX}/lib/girepository-1.0",
                          GST_PLUGIN_PATH: "#{HOMEBREW_PREFIX}/lib/gstreamer-1.0"
    log_path var/"log/nuv-agent.log"
    error_log_path var/"log/nuv-agent.log"
  end

  test do
    system bin/"nuv-agent", "config-path"
  end
end
