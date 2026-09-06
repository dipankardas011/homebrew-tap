cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1"
  sha256 arm: "0b34b38a91ffd47ef5c82099838efdc06127cbced0315010f587d63a52e25b3e", intel: "190ea438e45177591ab0f4b0662b4f78b99222e6ce1a0b53da3c030d43c5fec9"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
