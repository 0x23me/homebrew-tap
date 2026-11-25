cask "glasswing" do
  version "0.6.2"
  sha256 "45b0145e55e81dc6c40a56f0a4b486e5500efcb793712c9086f8b36d2c4c9f11"

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
