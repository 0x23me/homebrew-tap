cask "glasswing" do
  version "0.5.3"
  sha256 "6a62f94f236efee482e5144c677d095e02d477f4be8b337d847619305c7bd357"

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
