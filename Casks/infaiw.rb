cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.0"
  sha256 arm: "e3d7c4818a309d81e5c20f3153b71ad3ad9a6efcfa8152423ad1579af2eb9e3d", intel: "d2391d5be00a0d1b3e578c2d562080bb0dcf609395560de6fe4cc668dcee6981"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
