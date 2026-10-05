cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.12.0"
  sha256 arm: "e79311305a892c382467d3275094ca4ab5bdc43a229a85693656f9ffcaca49c5", intel: "35dd93df8db361ad5e750eb1666d652781cad74a083362c1155729a9134de80c"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
