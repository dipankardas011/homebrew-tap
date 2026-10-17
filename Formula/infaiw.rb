class Infaiw < Formula
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"
  version "0.20.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_amd64.tar.gz"
      sha256 "66b6185111e7793f88dd2a2dac626ace7df7c1794af875f5db9e821a9add8a93"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_arm64.tar.gz"
      sha256 "0fffce623a3bed1068e684cc706bceb5f14bb31f136cbfc98172b2fa8d32589c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_amd64.tar.gz"
      sha256 "3c401faacccdce30f9e7d9b638fa1373a8549be5bb660056babb339930085fa1"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_arm64.tar.gz"
      sha256 "f1a3e9e0b3b7907694359421ecd8a30d972a60dced2cf4ce1e1606542a8375b1"
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
    environment_variables PATH: std_service_path_env
    log_path var/"log/infaiw.log"
    error_log_path var/"log/infaiw.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/infaiw --version")
  end
end
