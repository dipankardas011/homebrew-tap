cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.0"
  sha256 arm: "0b47d3649237bfce0ec2c99fef971ae9d17edd1d51b317343e378a469f58bd94", intel: "3c69aba014503fe90c79e9e537ba31de253c75f02e4c281099d4e2a53a89cd64"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
