class Infaiw < Formula
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"
  version "0.13.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_amd64.tar.gz"
      sha256 "0e0ac202e16952064eb504ad96424504e96497580e067d8acdfc48b1de03c622"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_arm64.tar.gz"
      sha256 "dc6a69bd9e72b102af4b6317a8fbccc3bddffc63b2ec5ecefa576338a342b837"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_amd64.tar.gz"
      sha256 "d8f12e10a27613410702604bb683ab9e091dc717c83d99b5902f318175e9afd2"
    end
    on_arm do
      url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_linux_arm64.tar.gz"
      sha256 "433ccd10ab1bfcd311b2dd33b7620c2fab7a3edab9f5599a38a4f79b7b95a751"
    end
  end

  def install
    bin.install "infaiw"
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
