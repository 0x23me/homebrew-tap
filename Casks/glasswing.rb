cask "glasswing" do
  version "0.3.0"
  sha256 "237179d8ae25ada43d5dd42a049942e5f4c89f9ad7e34a04df732ebddb143cdf"

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
