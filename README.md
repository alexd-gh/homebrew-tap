# Task Manager for Mac

**A Windows 11-style Task Manager for macOS.** Processes, Performance, App history, Startup apps, Users, Details and
Services, laid out and behaving like the Task Manager in Windows 11, built natively for macOS with live graphs,
per-process GPU, network and power use, and optional advanced pages for drivers, connections, disk space, power
sensors, Apple silicon internals and installed apps.

This repository is the [Homebrew](https://brew.sh) tap that distributes it. It holds the cask, the release
downloads and the documentation; the app's source code is not published.

![Task Manager for Mac: the Processes page](docs/images/processes.jpg)

| | |
|---|---|
| Latest version | **1.11** (build 69), 24 November 2026 ([what's new](#whats-new-in-111)) |
| Requires | macOS 14 Sonoma or later |
| Runs on | Apple silicon and Intel (universal app) |
| Price | Free, also for commercial use ([license](#license)) |
| Signing | Ad-hoc signed, not notarized ([first launch](#first-launch)) |
| Author | [alexd-gh](https://github.com/alexd-gh) |

[Install](#install) · [First launch](#first-launch) · [What's new](#whats-new-in-111) · [Features](#features) · [Screenshots](#screenshots) ·
[Permissions and privacy](#permissions-and-privacy) · [Known limits](#known-limits) · [License](#license) ·
[Technical overview](docs/technical-overview.md) · [Release history](CHANGELOG.md)

## Install

```bash
brew install --cask alexd-gh/tap/win-task-manager
```

If Homebrew refuses to load a cask from an untrusted tap (Homebrew 7 and later), trust this tap first:

```bash
brew trust alexd-gh/tap
```

Without Homebrew, download `TaskManager-<version>.zip` from [Releases](https://github.com/alexd-gh/homebrew-tap/releases),
unzip it and drag **Task Manager** to Applications.

| Task | Command |
|---|---|
| Update | `brew upgrade --cask win-task-manager` |
| Uninstall | `brew uninstall --cask win-task-manager` |
| Uninstall and delete settings, app history and process samples | `brew uninstall --zap --cask win-task-manager` |

## First launch

1. **Open Anyway.** The app is ad-hoc signed and not notarized by Apple, so macOS blocks the first launch. Open it
   once, then go to System Settings › Privacy & Security and click **Open Anyway** next to Task Manager. You do this
   once per version.
2. **License.** Task Manager shows its license and asks you to accept it before any window opens. Scroll to the end
   of the text to turn on **Accept**, which continues and is remembered; **Quit** (or Escape) closes the app. You're
   asked again only if the license terms change. The text is always available under Task Manager › About Task
   Manager › License….

<table>
  <tr>
    <td><img src="docs/images/license-prompt.jpg" alt="License prompt with Accept off"><br><sub>Accept is off until you reach the end</sub></td>
    <td><img src="docs/images/license-prompt-end.jpg" alt="License prompt at the end, Accept on"><br><sub>At the end, Accept turns on</sub></td>
  </tr>
</table>

## What's new in 1.11

- **Check for updates.** Task Manager › Check for Updates… asks GitHub for the latest release and shows what's new.
  Installed with Homebrew? **Update in Terminal** runs `brew upgrade --cask` for you. Downloaded? **Download** opens
  the release. Skip a version or be reminded later. Also in Settings › Updates (Check now) and in About.
- **Automatic checks are opt-in.** Once a day, with a bar at the top of the window when a new version is out. New
  installs get an unticked box on the first-run license prompt; if you already have Task Manager, turn it on in
  **Settings › Updates**, where it starts off. A check sends nothing about you or your Mac.

![Task Manager 1.11 is available](docs/images/update-window.jpg)

### 1.10


- **No Apple silicon page on Intel Macs.** The Advanced section leaves out the Apple silicon page on an Intel Mac,
  where it has nothing to show. The other Advanced pages keep their shortcuts (Installed apps stays ⌥⌘6, System info
  ⌥⌘7).

### 1.9


- **License version 2.** Liability is now capped at US $1 in direct damages instead of excluded outright, and
  liability for fraud or wilful misconduct is never limited. New clauses cover sensitive information in what you
  save or copy, no data collection, no support, California law and your consumer rights. It's still free to use,
  also commercially ([summary](#license)). Everyone is asked once to accept the new text, and **Accept turns on
  after you scroll to the end of the license**.
- **A smaller download.** The Control-Shift-Escape helper is now its own 177 KB program instead of a second copy of
  the app: the installed app drops from 37 MB to 20 MB and the ZIP from 12 MB to 7.7 MB.
- **Installed apps** finds folders named after an app's vendor (such as `Application Support/BraveSoftware`), marked
  "vendor" and unticked in Uninstall, and the Opened column shows "Now" or "Unknown" with the reason instead of "—".

1.8 added the **System info** page (⌥⌘7), the full report of Apple's System Information app; see the
[screenshot tour](docs/screenshots.md#system-info-18) and the [release history](CHANGELOG.md).

1.7 added the Installed apps page with Uninstall; 1.6 made End task and publishers safer; 1.5 added core kinds on
the CPU page and a memory graph split by type; earlier releases added open handles per process, Find open file or
port and background Disk space scans. Every change is in the [release history](CHANGELOG.md), with pictures in the
[screenshot tour](docs/screenshots.md#new-in-12-to-111).

## Features

### Pages

| Page | What it shows | What you can do |
|---|---|---|
| **Processes** | Apps (with their helpers nested), background processes and macOS processes; CPU, memory, disk, network and GPU as a heat map with totals in the header; power usage and its trend (Very low … Very high) | End task, force quit, efficiency mode, switch to, create a process sample, open file location, search online, properties; choose columns by right-clicking the header |
| **Performance** | CPU (overall or per core, each core tagged efficiency or performance), memory (in use, or split by type), one tile per disk, each Wi-Fi and Ethernet adapter, GPU (3D and tiler), and battery on Macs that have one; 60 seconds of history each | Copy a summary, graph summary view, network details |
| **App history** | CPU time, network and energy per app over the last 30 days, recorded while Task Manager runs | Delete usage history |
| **Startup apps** | Launch agents and daemons with publisher, status, whether running now, when disabled, type and command | Enable or disable, properties, open file location |
| **Users** | Each signed-in user, including remote sessions, plus grouped system accounts | Process actions, sign out |
| **Details** | Every process, with open handles split into files, sockets and pipes (hover for the breakdown), and optional columns such as architecture, CPU time, peak memory, disk read/written, GPU, elevated, parent PID and start time | End task or process tree, set priority, efficiency mode, process sample, properties with Network and Files tabs |
| **Services** | launchd services: your agents (User) and system daemons (System), with PID, description and state | Start, stop, restart |
| **Settings** | Theme, start page, update speed, open at login, always on top, menu bar icon, hide when minimized, Control-Shift-Escape, graph style, advanced readings and pages | — |

### Advanced pages

Switched on in Settings, an **Advanced** section adds pages that Windows Task Manager doesn't have:

| Page | What it shows |
|---|---|
| **Drivers** | Loaded kernel extensions, installed kernel and driver extensions, and system extensions |
| **Connections** | Every open network connection by process, with remote host names, service names and traffic, plus a Firewall settings shortcut |
| **Disk space** | A scan of a volume as a treemap and folder list, with file categories and a history of earlier scans; a scan keeps running while you use other pages |
| **Power and frequency** | Power, voltage, current, temperature and fan sensors as a tree, with live values and their minimum and maximum |
| **Apple silicon** | The CPU cluster layout, GPU performance states with their frequencies and voltages, energy per chip block, and media engine activity (Apple silicon Macs only) |
| **Installed apps** | Every installed app with its size, version, last-opened date, publisher and the files it keeps in Library; Uninstall moves the app and the files you choose to the Trash |
| **System info** | The full hardware, network and software report of Apple's System Information app, searchable, with Copy and Save as text |

### Also

- **Find open file or port** (Edit menu, ⇧⌘O): which processes hold a file, folder, volume or network port open.
- **Open handles** per process: Properties › Network shows live sockets with state and traffic, Properties › Files
  every open file, folder, device and pipe.
- **Double-click the title row** to fill the screen, leaving the menu bar and Dock visible, as maximizing does on
  Windows.
- **Menu bar icon** with live CPU use, a floating **graph summary** window and a compact **Fewer details** window.
- **Extended graphs**: an optional graph style with smooth glowing curves coloured by level and LED meters.
- **Show advanced readings**: CPU clock speed, Neural Engine (NPU) power, temperatures and "Not responding" status.
- **Restart as administrator** (File menu) to see CPU, memory and disk for other users' and root's processes.
  Ending a critical system process asks first.
- **Control-Shift-Escape** brings Task Manager forward and, if you switch it on, also opens it when it isn't running.
- **Check for updates** (Task Manager menu): shows what's new and updates a Homebrew install in Terminal; daily
  checks are opt-in.
- **One copy only**, as on Windows: launching it again brings the running window forward.
- **Light and dark app icon**; on macOS 26 and later the Dock and Finder switch with dark mode.

### Keyboard shortcuts

| Shortcut | Action | Shortcut | Action |
|---|---|---|---|
| ⌘F | Search | ⌘N | Run new task |
| ⌘1 – ⌘8 | Switch page | ⌥⌘1 – ⌥⌘7 | Advanced pages (when on) |
| ⌘R | Refresh now | ⌘⌫ | End task |
| ⌘E | Efficiency mode | ⌘I | Properties (Details) |
| ⇧⌘C | Copy summary | ⌥⌘D | Fewer details |
| ⌥⌘G | Graph summary view | ⌥⌘T | Always on top |
| ⇧⌘O | Find open file or port | ⌃⇧⎋ | Show Task Manager |

## Screenshots

Every page, with a caption, is in the [screenshot tour](docs/screenshots.md). Personal details are covered with
grey bars.

<table>
  <tr>
    <td width="33%"><a href="docs/screenshots.md#cpu"><img src="docs/images/performance-cpu.jpg" alt="Performance: CPU"></a><br><sub>Performance: CPU</sub></td>
    <td width="33%"><a href="docs/screenshots.md#memory"><img src="docs/images/performance-memory.jpg" alt="Performance: Memory"></a><br><sub>Performance: Memory</sub></td>
    <td width="33%"><a href="docs/screenshots.md#gpu"><img src="docs/images/performance-gpu.jpg" alt="Performance: GPU"></a><br><sub>Performance: GPU</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#disk"><img src="docs/images/performance-disk.jpg" alt="Performance: Disk"></a><br><sub>Performance: Disk</sub></td>
    <td><a href="docs/screenshots.md#wi-fi"><img src="docs/images/performance-wifi.jpg" alt="Performance: Wi-Fi"></a><br><sub>Performance: Wi-Fi</sub></td>
    <td><a href="docs/screenshots.md#battery"><img src="docs/images/performance-battery.jpg" alt="Performance: Battery"></a><br><sub>Performance: Battery</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#app-history"><img src="docs/images/app-history.jpg" alt="App history"></a><br><sub>App history</sub></td>
    <td><a href="docs/screenshots.md#startup-apps"><img src="docs/images/startup-apps.jpg" alt="Startup apps"></a><br><sub>Startup apps</sub></td>
    <td><a href="docs/screenshots.md#users"><img src="docs/images/users.jpg" alt="Users"></a><br><sub>Users</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#details"><img src="docs/images/details.jpg" alt="Details"></a><br><sub>Details</sub></td>
    <td><a href="docs/screenshots.md#services"><img src="docs/images/services.jpg" alt="Services"></a><br><sub>Services</sub></td>
    <td><a href="docs/screenshots.md#settings"><img src="docs/images/settings.jpg" alt="Settings"></a><br><sub>Settings</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#about-and-license"><img src="docs/images/about.jpg" alt="About Task Manager"></a><br><sub>About</sub></td>
    <td><a href="docs/screenshots.md#settings"><img src="docs/images/settings-other.jpg" alt="Settings: other options"></a><br><sub>Settings: other options</sub></td>
    <td><a href="docs/screenshots.md#about-and-license"><img src="docs/images/about-license.jpg" alt="License"></a><br><sub>License</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#drivers"><img src="docs/images/advanced-drivers.jpg" alt="Advanced: Drivers"></a><br><sub>Advanced: Drivers</sub></td>
    <td><a href="docs/screenshots.md#connections"><img src="docs/images/advanced-connections.jpg" alt="Advanced: Connections"></a><br><sub>Advanced: Connections</sub></td>
    <td><a href="docs/screenshots.md#disk-space"><img src="docs/images/advanced-disk-space.jpg" alt="Advanced: Disk space"></a><br><sub>Advanced: Disk space</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#power-and-frequency"><img src="docs/images/advanced-power.jpg" alt="Advanced: Power and frequency"></a><br><sub>Advanced: Power and frequency</sub></td>
    <td><a href="docs/screenshots.md#apple-silicon"><img src="docs/images/advanced-apple-silicon.jpg" alt="Advanced: Apple silicon"></a><br><sub>Advanced: Apple silicon</sub></td>
    <td><a href="docs/screenshots.md#installed-apps"><img src="docs/images/advanced-installed-apps.jpg" alt="Advanced: Installed apps"></a><br><sub>Advanced: Installed apps</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#system-info"><img src="docs/images/advanced-system-info.jpg" alt="Advanced: System info"></a><br><sub>Advanced: System info</sub></td>
    <td><a href="docs/screenshots.md#system-info"><img src="docs/images/system-info-graphics.jpg" alt="System info: Graphics/Displays"></a><br><sub>System info: Graphics/Displays</sub></td>
    <td></td>
  </tr>
</table>

### With Extended graphs

The same app with Settings › Extended graphs on: glowing curves coloured by level, LED meters, status lights and
level bars on every page. All of them are in the [tour](docs/screenshots.md#extended-graphs).

<table>
  <tr>
    <td width="33%"><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-cpu.jpg" alt="Extended graphs: CPU"></a><br><sub>CPU</sub></td>
    <td width="33%"><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-memory.jpg" alt="Extended graphs: Memory"></a><br><sub>Memory</sub></td>
    <td width="33%"><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-gpu.jpg" alt="Extended graphs: GPU"></a><br><sub>GPU</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-disk.jpg" alt="Extended graphs: Disk"></a><br><sub>Disk</sub></td>
    <td><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-wifi.jpg" alt="Extended graphs: Wi-Fi"></a><br><sub>Wi-Fi</sub></td>
    <td><a href="docs/screenshots.md#extended-performance"><img src="docs/images/extended-performance-battery.jpg" alt="Extended graphs: Battery"></a><br><sub>Battery</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#extended-processes"><img src="docs/images/extended-processes.jpg" alt="Extended graphs: Processes"></a><br><sub>Processes</sub></td>
    <td><a href="docs/screenshots.md#extended-pages-without-graphs"><img src="docs/images/extended-app-history.jpg" alt="Extended graphs: App history"></a><br><sub>App history</sub></td>
    <td><a href="docs/screenshots.md#extended-pages-without-graphs"><img src="docs/images/extended-startup-apps.jpg" alt="Extended graphs: Startup apps"></a><br><sub>Startup apps</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#extended-advanced-pages"><img src="docs/images/extended-advanced-power.jpg" alt="Extended graphs: Power and frequency"></a><br><sub>Power and frequency</sub></td>
    <td><a href="docs/screenshots.md#extended-advanced-pages"><img src="docs/images/extended-advanced-apple-silicon.jpg" alt="Extended graphs: Apple silicon"></a><br><sub>Apple silicon</sub></td>
    <td><a href="docs/screenshots.md#extended-graphs"><img src="docs/images/extended-settings.jpg" alt="Extended graphs settings"></a><br><sub>Extended graphs settings</sub></td>
  </tr>
  <tr>
    <td><a href="docs/screenshots.md#extended-advanced-pages"><img src="docs/images/extended-advanced-installed-apps.jpg" alt="Extended graphs: Installed apps"></a><br><sub>Installed apps</sub></td>
    <td></td>
    <td></td>
  </tr>
</table>

## Permissions and privacy

Task Manager has **no telemetry, no analytics and no accounts**, and checks for updates only when you ask or switch
it on. It reads the state of your own Mac and keeps what it records on your Mac.

| Access | When | Why |
|---|---|---|
| Administrator password or Touch ID | Only when you disable a system startup item, control a system service or restart as administrator | These change system-wide settings or need root |
| Location | Only if you allow it, for the Performance page's Wi-Fi tile | macOS shows the Wi-Fi network name only to apps with Location access. Your location itself is never read |
| Login items | Only if you switch on Open at login or Control-Shift-Escape when closed | Registers the app, or its small hotkey helper, as a login item; switch it off in Settings |
| Other apps' data | Only if macOS asks, when you select a sandboxed app on Advanced › Installed apps | Sizing an app's container in `~/Library/Containers` reads another app's data; if you don't allow it, the size shows "—" |
| App Management | Only if macOS asks, when you uninstall an app | macOS may require this permission before one app can delete another; Task Manager says so if the move is blocked |
| Network | Only on the Advanced › Connections page | Looks up the names of remote hosts you're already connected to (reverse DNS); switch it off with **Look up host names**. **Search online** opens your web browser |
| Network (updates) | Only when you choose Check for Updates, or once a day if you switch on **Check for updates automatically** (off unless you tick it) | Asks GitHub's public API for the latest release of this tap. No account, identifier or details about your Mac are sent; GitHub sees your IP address, as with any download |

**Files it writes:**

| Location | Contents |
|---|---|
| `~/Library/Preferences/local.alexd-gh.wintaskmanager.plist` | Settings, license acceptance, startup-item disable dates, disk scan history |
| `~/Library/Application Support/Task Manager/` | App history (30 days; older days are deleted) |
| `~/Library/Logs/Task Manager/` | Process samples you create, and the output of commands run as administrator |

`brew uninstall --zap` deletes all three, and the settings file of versions before 1.2
(`local.alexander.wintaskmanager.plist`).

## Known limits

These are macOS rules, not bugs.

- **Other users' and root processes** show "—" for CPU, memory, disk and power until you restart as administrator.
  Efficiency mode works only on your own processes.
- **Per-process network** updates about every 5 seconds and can miss processes that live shorter than that.
- **Open handles** (Handles columns, Network and Files tabs, Find open file or port) are readable only for your own
  processes until you restart as administrator; Find says how many processes it couldn't search.
- **CPU speed** on Apple silicon needs Show advanced readings; otherwise "Load average" stands in for "Speed".
- **GPU** shows overall, 3D and tiler use. macOS has no Copy or Video engine breakdown, GPU temperature or driver version.
- **Startup changes** take effect at the next sign-in or restart.
- **Advanced readings and the Apple silicon and Power pages** use undocumented macOS interfaces, so a macOS update
  can change or break individual readings. Some energy readings need administrator rights on recent macOS.

Where each number comes from is in the [technical overview](docs/technical-overview.md).

## License

Task Manager for Mac is **freeware**. The full text is in [LICENSE](LICENSE).

- **You may** use it free of charge on any number of Macs, for any purpose, **including commercial use**, and share
  unmodified copies free of charge with the license included.
- **You may not** sell, rent or sublicense it, modify or reverse engineer it (except where the law allows), remove
  its copyright notice, or present it as your own.
- **It's provided as is.** There is no warranty of any kind, express or implied. Task Manager can end processes,
  change startup items and services, move apps and files to the Trash and run commands as administrator: you're
  responsible for what you do with it.
- **Liability is capped.** To the maximum extent the law allows, the author's total liability is limited to direct
  damages of US $1, and no other damages (indirect, incidental, special or consequential, including loss of data or
  business interruption) can be claimed. Liability that the law doesn't allow to be limited, such as for fraud or
  wilful misconduct, isn't limited.
- **Your data.** Task Manager collects no data and sends nothing to the author. What you save or copy from it, such
  as process samples, summaries and exported lists, can contain user names, paths and network addresses: sharing
  them is your responsibility.
- **No support** is promised. The license is governed by **California law**; consumers keep the rights their own
  country's law gives them.
- **The source code is not licensed** and is not part of this repository.

The app is written in Swift with Apple's frameworks only and contains **no third-party code or libraries**, so no
other licenses apply to it. Installing through this tap uses Homebrew, a separate project under its
[own license](https://github.com/Homebrew/brew/blob/master/LICENSE.txt).

Windows is a trademark of Microsoft Corporation; macOS and Mac are trademarks of Apple Inc. Task Manager for Mac is
not affiliated with, endorsed or sponsored by Microsoft or Apple.

## Support

Found a problem or have an idea? [Open an issue](https://github.com/alexd-gh/homebrew-tap/issues) with your macOS
version, your Mac model and the Task Manager version shown in About.
