cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm: "98a89392924e8d57e96d07f39d8691bc08511a35aaa22cb3d7d491a3ab0a3624", intel: "f61a50f8d66a3da50d08ff05ec6c8119ca09c7c56651263f2773ba42b1548f9e"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
