cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.2"
  sha256 arm: "f539c0a6d65b38c74752c765b0662c06f4189826d54634f41d774720f1874b84", intel: "8a1d989463d59ce495408359ccbea1254c13f61f9bdf27fefd5bf79d06a72c9d"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
