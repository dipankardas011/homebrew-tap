class Infaiw < Formula
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_amd64.tar.gz"
      sha256 "d1430d0ceab44ebb77d963e8f1870413f8c885516b36130e7c8283d0bb4a222e"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_arm64.tar.gz"
      sha256 "1eec66196fc26a2d0416dbda6c352f38367095cab5add5557f64850c348fb6d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_amd64.tar.gz"
      sha256 "ac419879731253099da8148f65a5e36411b22583357f431a859dcc6bedd79070"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_arm64.tar.gz"
      sha256 "5c1f8b42e7b9b0b8989eaae16454d6d8f43641a44b2d8f8fddeb0450f7c4ae66"
    end
  end

  def install
    bin.install "infaiw"
  end

  post_install_steps do
    terminate_process "infaiw server", match: :full
  end

  service do
    run [opt_bin/"infaiw", "server"]
    keep_alive true
    working_dir Dir.home
    environment_variables PATH: "#{Dir.home}/.local/bin:#{std_service_path_env}"
    log_path var/"log/infaiw.log"
    error_log_path var/"log/infaiw.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infaiw --version")
  end
end
