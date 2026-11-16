cask "pbs-mackup" do
  version "0.6.0"
  sha256 "bd53bc456d6f9568a847e37073b0cc3f84e791a796e16e249c5b3b075caba6ea"

  url "https://github.com/0x23me/pbs-mackup/releases/download/v#{version}/PBSMackup-#{version}.zip"
  name "PBS Mackup"
  desc "Home folder backups to a Proxmox Backup Server"
  homepage "https://github.com/0x23me/pbs-mackup"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "PBSMackup.app"

  uninstall launchctl: [
              "me.0x23.pbs-mackup.helper",
              "me.0x23.pbs-mackup.manual",
              "me.0x23.pbs-mackup.restore",
              "me.0x23.pbs-mackup.scheduled",
            ],
            quit:      "me.0x23.pbs-mackup"

  # The restore daemon removes its right, its state and the folder it restores in when a
  # restore is finished; script and delete are for an app that is removed in the middle of
  # one. The folder in /Users holds only what came from a backup. A home folder that a
  # restore set aside (<home>.before-restore) is its owner's files and stays, and so does
  # the Keychain, where the encryption key is.
  zap script: {
        executable:   "/usr/bin/security",
        args:         ["authorizationdb", "remove", "me.0x23.pbs-mackup.restore-home"],
        must_succeed: false,
        sudo:         true,
      },
      delete: [
        "/Library/Application Support/me.0x23.pbs-mackup",
        "/Users/.pbs-mackup-restore-*",
      ],
      trash:  [
        "~/Library/Application Support/pbs-mackup",
        "~/Library/Caches/pbs-mackup",
        "~/Library/Group Containers/33C888LZ98.me.0x23.pbs-mackup",
        "~/Library/Preferences/me.0x23.pbs-mackup.plist",
      ]

  caveats <<~EOS
    Switch on Full Disk Access for PBS Mackup in System Settings.
  EOS
end
