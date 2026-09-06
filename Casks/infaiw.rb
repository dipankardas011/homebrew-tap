cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.6"
  sha256 arm: "e7b08aa9ba6c6fdeebcc45417b90a6f3c5eaf5a1b3c2fde2c6ff212a2d4da18d", intel: "6c1721766f0b8254bdea54f8b592c84177598159c2f3d7f878df71bb9ba611b6"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
