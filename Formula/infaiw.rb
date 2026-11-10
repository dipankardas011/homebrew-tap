class Infaiw < Formula
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"
  version "0.31.2"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_amd64.tar.gz"
      sha256 "59aca71c450635e5778edc31cd9246b632471fd932fbf0ddfad9ff1f8a69af71"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_arm64.tar.gz"
      sha256 "fec79757d94b58a3ba18ff1a115294b18f61b3a14abdb11bdbfb57d715734be1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_amd64.tar.gz"
      sha256 "3450357157f38fa0d3f324c9a99d2eb8fcf121973f71016ac48204d67b18b251"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_arm64.tar.gz"
      sha256 "4f52753b189b1eb265d8a48e87a2a23735d2954d5bceba5dbafd101b4daa445a"
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
