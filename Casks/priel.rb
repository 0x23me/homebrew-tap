cask "priel" do
  version "0.2.0"
  sha256 "b5797df53448bfe9a34b08b4ce8c0e530e89d79c6cba25d76893642b8e006aec"

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
          # juist's own LaunchDaemon, which Priel disabled, runs this Mac's keys again.
          p=/Library/LaunchDaemons/io.nning.juist.juistd.plist
          if [ -f "$p" ]; then
            launchctl enable system/io.nning.juist.juistd
            launchctl bootstrap system "$p" 2>/dev/null || true
          fi
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
    it. Neither removes /var/db/juist, this Mac's keys in the network, or the _juist user who
    owns them.
  EOS
end
