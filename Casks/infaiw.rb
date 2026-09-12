cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"
  sha256 arm: "b0138b98c9ef0a601aeb4c02d2811a32800fa44703964b6fea4490b904f437ce", intel: "78af74ebae6b4f4e6ff417dc3e6bb30cea8486b3f589f5b826198c76b3eabcc4"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
