cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.7"
  sha256 arm: "a7463d1cc9d90773be87c12cc14ea8503ba2bbdf6bc330c5ecdba172206ff182", intel: "c6c056320836dee7c97fc735c29e25fd2e811a5443a744abaaf9e3a3f2fcaf20"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
