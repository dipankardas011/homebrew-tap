cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.5.0"
  sha256 arm: "021693851cbfc4efc3de86e896e29604bd004e2983ab431cf892db2c7c778c75", intel: "2c149129b9fb688429aa9dcc5fe62f42929e8ce633b9f96fddd07be8c09a38ac"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
