cask "glasswing" do
  version "0.4.1"
  sha256 "e6ca3777066d3b2ec61df764405d6b8f8d9fe2dbe8dbad2b2eed7502c3dd95aa"

  url "https://github.com/0x23me/homebrew-tap/releases/download/v#{version}/Glasswing-#{version}-macos-arm64.zip"
  name "Glasswing"
  desc "Terminal workspace for coding agents"
  homepage "https://github.com/0x23me/homebrew-tap"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Glasswing.app"
  binary "#{appdir}/Glasswing.app/Contents/MacOS/gw"
end
