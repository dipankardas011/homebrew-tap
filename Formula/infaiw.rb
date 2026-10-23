class Infaiw < Formula
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"
  version "0.27.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_amd64.tar.gz"
      sha256 "6bda843502eac98b60f6f25acc2db608ee22995f5f796d49ff5b7a0630dfbab9"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_arm64.tar.gz"
      sha256 "db97fe4bb4515dc1fea241ce6da7268c1e86bf72c9a14f9f01ac9d24ec0c09c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_amd64.tar.gz"
      sha256 "c43893b49aad4dc1272d0ff2a6647caa44aba32b6f8d4210332fb24f7169f515"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_arm64.tar.gz"
      sha256 "23bed0d78660ee88459821c467c196c5b5e1366deb355af6db59e932c99054e9"
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
