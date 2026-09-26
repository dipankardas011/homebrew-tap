cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm: "4870d71c1f2e64d548495429cdbfc2a3b96b34a14a8c1b742272a1a4ef34cb56", intel: "b4e02f100cb0bbfec8f2484526e6f6510aecdc596e26b00a0ede81179ddc5b94"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
