cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.11.0"
  sha256 arm: "cac42c32faf98e016f4364fc6b8b16baba6bf6a1a8ba71cf2100a3012d11b6c0", intel: "505af343ea0c35595edac0fb45000e7649fcfc9a40a292523528325b6d966685"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
