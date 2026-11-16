cask "pbs-mackup" do
  version "0.4.0"
  sha256 "d2987f567d4cc40bc45e7838193d6e74e7ce4aaae80da07960517ef0f5e99753"

  url "https://github.com/0x23me/pbs-mackup/releases/download/v#{version}/PBSMackup-#{version}.zip"
  name "PBS Mackup"
  desc "Home folder backups to a Proxmox Backup Server"
  homepage "https://github.com/0x23me/pbs-mackup"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "PBSMackup.app"

  uninstall launchctl: ["me.0x23.pbs-mackup.scheduled", "me.0x23.pbs-mackup.manual", "me.0x23.pbs-mackup.helper", "me.0x23.pbs-mackup.run"],
            quit:      "me.0x23.pbs-mackup"

  zap trash: [
    "~/Library/Application Support/pbs-mackup",
    "~/Library/Caches/pbs-mackup",
    "~/Library/Group Containers/33C888LZ98.me.0x23.pbs-mackup",
  ]

  caveats <<~EOS
    Switch on Full Disk Access for PBS Mackup in System Settings.
    Open in Finder needs FUSE-T: brew install --cask fuse-t
  EOS
end
