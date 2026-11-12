cask "priel" do
  version "0.1.0"
  sha256 "dba36096110aa3157a43ee0610c2f703ded1365b36635d4402c66cea7cd79cdd"

  url "https://github.com/0x23me/priel/releases/download/v#{version}/Priel-#{version}.zip"
  name "Priel"
  desc "Menu bar switch and status for the juist mesh VPN"
  homepage "https://0x23me.github.io/priel/"

  depends_on macos: :sonoma

  app "Priel.app"

  uninstall quit: "me.0x23.priel"

  # After launchd stops the daemon: its split DNS files go once it is gone, and a juist command
  # linked to the copy goes with the copy.
  zap launchctl: "me.0x23.priel.juistd",
      script:    {
        executable: "/bin/sh",
        args:       ["-c", <<~SH],
          h=/Library/PrivilegedHelperTools/me.0x23.priel
          i=0
          while pgrep -qf "$h/juistd-launch" && [ $i -lt 50 ]; do sleep 0.2; i=$((i + 1)); done
          [ ! -x "$h/priel-dns" ] || "$h/priel-dns" stop
          case $(readlink /usr/local/bin/juist) in "$h"/*) rm /usr/local/bin/juist ;; esac
        SH
        sudo:       true,
      },
      delete:    [
        "/etc/priel",
        "/Library/Application Support/Priel",
        "/Library/LaunchDaemons/me.0x23.priel.juistd.plist",
        "/Library/PrivilegedHelperTools/me.0x23.priel",
        "/var/log/juistd.log*",
      ]

  caveats <<~EOS
    The first switch-on, and the first after each upgrade, asks for your password to install
    juistd for root in /Library/PrivilegedHelperTools.

    brew uninstall leaves juistd running if it is on. brew uninstall --zap stops it and removes
    it. Neither removes /var/db/juist, this Mac's keys in the network.
  EOS
end
