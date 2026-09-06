cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.5"
  sha256 arm: "592bc0b18368de03d6969516ed93c0b1873ad37983381b9ecd99c8ba86c9c6b5", intel: "4c341a6e02865fb0bbab0a1c1b8dffbb365e52117f6644586b44c7c5b4dbb7ac"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
