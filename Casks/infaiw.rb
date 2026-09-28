cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.10.0"
  sha256 arm: "c61791372de7f5b6caba06388aabed5f5aacfc866044c9456432e2f8d47ec2cf", intel: "addff43fef04255aaeb272a383c46c299f4e997390d5a826189cd499d4101e29"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
