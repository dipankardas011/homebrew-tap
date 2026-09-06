cask "infaiw" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.0"
  sha256 arm: "9bee4e05c8e0c382437f8f3bb0e6d260588ed37aed613733f08dd433df9043aa", intel: "9f853adad90074b71cc0c63f288031e054c9a46987dbcdb6a06814e29e087ab5"

  url "https://github.com/dipankardas011/infai/releases/download/infaiw-v#{version}/infaiw_#{version}_darwin_#{arch}.tar.gz"
  name "infaiw"
  desc "Agent and workflow engine for infai"
  homepage "https://github.com/dipankardas011/infai"

  binary "infaiw"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/infaiw"]
  end
end
