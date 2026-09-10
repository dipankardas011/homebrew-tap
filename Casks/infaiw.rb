cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm: "afce2fb0c43e72a5e25c74166885e0b1a69ab1834add83de21464cbde4320240", intel: "65e402bf908d74cb36cbd5d4e26ee37cacfb5ca063590577a99169f7d920bc5e"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
