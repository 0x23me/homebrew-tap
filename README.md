# Glasswing Homebrew tap

Glasswing is a macOS workspace for coding agents, terminals, and Git worktrees.
Requires an Apple Silicon Mac running macOS 27 (Golden Gate) or newer.

After the first public release and cask have been published:

```sh
brew tap 0x23me/tap
brew trust --cask 0x23me/tap/glasswing
brew install --cask 0x23me/tap/glasswing
```

Homebrew 7 requires explicit trust for third-party casks. This trusts only the
Glasswing cask, not every formula or command in the tap.

The app is installed at `/Applications/Glasswing.app` by default. The bundled `gw`
command is linked into Homebrew's `bin` directory. No separate daemon service is
installed by the cask; the app and CLI manage their normal daemon connections.

The app's **Check for Updates…** uses the same signed/notarized ZIP as this cask
when its in-app updater is enabled. For such releases Homebrew marks the cask as
self-updating; to explicitly upgrade through Homebrew instead:

```sh
brew upgrade --cask --greedy glasswing
```

Quit the app before a Homebrew upgrade. The cask has no daemon-stop or user-data
deletion hooks. It leaves your configuration, app state, and Keychain data alone.

Versioned downloads and checksums are available under this repository's Releases.
The signed Sparkle feed is the latest release's `appcast.xml` asset. There is no
separate build or repackaging for Homebrew.

## pbs-mackup

Backs up a Mac's home folder to a Proxmox Backup Server. Apple silicon, macOS 26 or later.
More at [0x23me/pbs-mackup](https://github.com/0x23me/pbs-mackup).

```sh
brew tap 0x23me/tap
brew trust --cask 0x23me/tap/pbs-mackup
brew install --cask 0x23me/tap/pbs-mackup
```
