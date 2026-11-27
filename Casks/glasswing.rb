cask "glasswing" do
  version "0.7.2"
  sha256 "462fcfa4aeaee9cf8d5a46ee3b55fff23ef1a016085549527488c6ab32be4a80"

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
