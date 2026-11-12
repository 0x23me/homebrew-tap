cask "pbs-mackup" do
  version "0.1.0"
  sha256 "6e87be37560b026422529ad5ff020013e8c054c9360ea67a0856e8ecd722c021"

  url "https://github.com/0x23me/pbs-mackup/releases/download/v#{version}/PBSMackup-#{version}.zip"
  name "PBS Mackup"
  desc "Home folder backups to a Proxmox Backup Server"
  homepage "https://github.com/0x23me/pbs-mackup"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "PBSMackup.app"

  uninstall launchctl: "me.0x23.pbs-mackup.run",
            quit:      "me.0x23.pbs-mackup"

  zap trash: [
    "~/Library/Application Support/pbs-mackup",
    "~/Library/Caches/pbs-mackup",
  ]

  caveats <<~EOS
    Switch on Full Disk Access for PBS Mackup in System Settings.
    Open in Finder needs FUSE-T: brew install --cask fuse-t
  EOS
end
