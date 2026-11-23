# Technical overview

How Task Manager for Mac works: where its numbers come from, how often they refresh, what runs in the background
and how the app is packaged. This describes behaviour, not source code, which isn't published. To see each page,
take the [screenshot tour](screenshots.md).

- [Architecture](#architecture)
- [Where the numbers come from](#where-the-numbers-come-from)
- [Actions and what they do](#actions-and-what-they-do)
- [Administrator rights](#administrator-rights)
- [Background pieces](#background-pieces)
- [Data stored on your Mac](#data-stored-on-your-mac)
- [Performance cost](#performance-cost)
- [Packaging, signing and versions](#packaging-signing-and-versions)
- [Mapping to Windows Task Manager](#mapping-to-windows-task-manager)

## Architecture

| Layer | What it is |
|---|---|
| Language and UI | Swift and SwiftUI, with AppKit for windows, the menu bar icon and dialogs |
| Dependencies | None outside macOS: only Apple's system frameworks (IOKit, Security, SystemConfiguration, ServiceManagement, CoreWLAN, CoreLocation, Carbon for the global hotkey) |
| Requirements | macOS 14 Sonoma or later; one universal binary for Apple silicon and Intel |
| Process model | One app process, a small background-only hotkey helper (optional), and short-lived system tools it starts for specific readings |
| Sandbox | Not sandboxed, by necessity: a task manager has to see and signal other processes, which the App Sandbox forbids |

### Sampling loop

A timer takes a **sample** of the whole system at the chosen **update speed**: High (twice a second), Normal (every
second, the default), Low (every 4 seconds) or Paused. Each sample reads processes, CPU, memory, disks, network and
GPU, works out rates from the difference to the previous sample, and appends to **60-second histories** that the
graphs draw. Readings that are expensive or slow to change run on their own, slower schedules in the background
(see [Performance cost](#performance-cost)), so a slow reading never holds up the window.

## Where the numbers come from

All readings use interfaces that ship with macOS. Most are public and documented; the ones marked
**undocumented** are used only for **Show advanced readings** and the **Advanced** pages, and are switched off
by default.

### Processes, Details, Users

| Reading | Source |
|---|---|
| Process list, names, parents, users, start times, arguments | The kernel process table (`sysctl`) and the process information library (`libproc`) |
| CPU % and CPU time | Per-process CPU time from `libproc`: the change since the last sample, divided by the elapsed time and the number of logical cores, so 100% means the whole CPU, as on Windows |
| Memory | Each process's physical footprint, the number Activity Monitor calls "Memory" |
| Disk | Per-process bytes read and written (resource usage counters), shown as a rate |
| Network | Per-process traffic from macOS's `nettop` tool (there's no public per-process network API), read as one snapshot every ~5 seconds |
| GPU | Per-process GPU time from the graphics driver's registry entries (IOKit `IOAccelerator`), which works for every process without root |
| Power usage and trend | Each process's energy counter (CPU energy, in nanojoules), turned into watts and mapped to Windows' words: under 0.1 W Very low, up to 5 W and more Very high; the trend is a 2-minute moving average |
| Apps vs background processes | Whether a process is a running app with a Dock presence (AppKit's list of running apps); helpers are nested under their app |
| Publisher, sandbox ("isolation") | The code signature of the executable (Security framework) |
| Architecture | Whether a process runs natively or under Rosetta 2 |
| Handles, Files, Sockets, Pipes | Each process's open file descriptors from `libproc`, counted by kind every sample; the hover breakdown asks for each handle's details (file, folder, device, TCP, UDP, local socket, pipe, event queue) |
| Properties › Network and Files | The full handle list, refreshed every 2 seconds: sockets with state and endpoints (byte counts from the `nettop` snapshots), files with their path and access mode, and the process at the other end of each pipe |
| Find open file or port | Walks the handles of every process you can read and matches a path (a file, a folder and what's inside it, or a whole volume) or a port number |
| Signed-in users and sessions | The login records (`utmpx`), including remote sessions |
| Not responding | **Undocumented**: the window server's own "app is unresponsive" check, the same one that turns the cursor into a spinner |

macOS gives CPU, memory, disk and energy numbers for a process only to its owner or to root. Without administrator
rights, other users' and system processes show "—" in those columns.

### Performance page

| Tile | Source |
|---|---|
| CPU, per-core graphs | Mach host processor statistics (per-core user, system and idle ticks). Each core's kind (efficiency or performance) comes from the CPU cluster layout in the device tree |
| Threads, processes, handles, uptime, load average | Kernel counters (`sysctl`); the Handles hover adds up every readable process's handles by kind |
| CPU speed (Apple silicon) | **Undocumented**: the IOReport performance-state residencies per cluster, weighted by each state's frequency. Without Show advanced readings, "Load average" stands in |
| Memory | Mach virtual memory statistics (app, wired, compressed, cached, free) and swap usage; memory type and maker from the hardware registry. "In use" is app + wired + compressed; the Composition graph keeps 60 seconds of each type |
| Disks | One tile per physical drive from IOKit block storage drivers (bytes and operations read/written, busy time), with the volumes on each drive and their capacity |
| Wi-Fi and Ethernet | Interface byte counters and addresses (`getifaddrs`), adapter names and types from System Configuration, and Wi-Fi details (signal, noise, channel, security, PHY mode) from CoreWLAN. The network name needs Location access because macOS requires it |
| GPU | Utilization (overall, renderer/3D, tiler) and memory in use from the GPU driver's performance statistics in the IOKit registry |
| NPU | **Undocumented**: Neural Engine energy from IOReport, shown as power. On some chips and macOS versions this reads 0 without root; the tile then says so |
| Battery | The smart battery's registry entry (charge, capacity and health, cycle count, voltage, current, power adapter), and the charge history that macOS keeps in its power management log (`pmset`) |
| Temperatures | **Undocumented**: the HID temperature sensors that macOS itself reads |

### Startup apps and Services

| Reading | Source |
|---|---|
| Startup apps | The launch agent and daemon property lists in the standard `LaunchAgents` and `LaunchDaemons` folders, plus launchd's own record of what's disabled |
| Services | launchd's live service lists for your session and for the system (`launchctl print`), with state and PID |
| "Disabled time" | Recorded by Task Manager when you disable an item, because macOS doesn't keep it |

### Advanced pages

| Page | Source |
|---|---|
| Drivers | Loaded kernel extensions from the kernel extension manager, installed kernel and driver extensions from the extension folders, and system extensions (`systemextensionsctl`) |
| Connections | The open sockets per process from the same `nettop` snapshots, with local and remote endpoints, state and traffic; remote names by reverse DNS (cached), well-known port names, and each endpoint's scope (local, private, public) |
| Disk space | A parallel scan of the volume's folders, keeping the largest files of each folder and summing the rest so very large disks stay responsive; drawn as a squarified treemap and grouped into file categories |
| Power and frequency | **Undocumented**: the System Management Controller (SMC) for fans and system power, HID sensors for temperatures, and IOReport for energy, arranged as a tree with each reading's minimum and maximum since launch |
| Apple silicon | The CPU cluster layout from the device tree, GPU performance states with their frequencies and voltages, energy per chip block from the Energy Model, and media engine (scaler, JPEG) activity counters |
| System info | `system_profiler`'s plain-text report for each System Information category (read when you open it, kept until Reload; Wi-Fi, Applications, Frameworks and Fonts take a few seconds). The text report is used rather than JSON because it carries macOS's own labels |
| Installed apps | App bundles in `/Applications`, `~/Applications` and `/System/Applications` (two folder levels deep), each one's `Info.plist`, last-opened date from Spotlight and size on disk (measured in the background). Related files are entries in `~/Library` and `/Library` folders named by the app's bundle ID, or by its exact name in Application Support, Caches and Logs (never for Apple's apps); read only for the selected app, with its code signature |

Undocumented interfaces are looked up at run time. If one is missing or changes in a macOS update, the reading that
depends on it shows "—" or is hidden; the rest of the app keeps working.

## Actions and what they do

| Action | What happens |
|---|---|
| End task | Asks an app to quit the normal way, as quitting from the Dock does; for other processes, sends the terminate signal (`SIGTERM`). Every process action first checks the process's start time, so a process ID that macOS has since reused is left alone. Critical system processes (WindowServer, loginwindow, launchd and similar, or any root system process while elevated) ask first |
| Force quit / End process tree | Sends the kill signal (`SIGKILL`) to the process, or to it and all its descendants. End process tree refuses launchd, whose tree is every process |
| Restart (Finder, Dock and similar) | Ends the process; macOS starts it again on its own |
| Efficiency mode | Puts the process into macOS's background policy, the same as `taskpolicy -b`: efficiency cores only and throttled disk and network. Your own processes only |
| Set priority | Changes the process's scheduling priority (nice value); raising it needs root |
| Create process sample | macOS's `sample` tool records the process's call stacks for a few seconds, the Mac equivalent of Windows' "Create dump file" |
| Enable / disable startup item | Changes launchd's enabled state for that agent or daemon; takes effect at the next sign-in or restart |
| Start / stop / restart service | Asks launchd to start, stop or restart the service |
| Run new task | Opens an app, file, folder or web address; anything else runs as a shell command in the background. Ticking "Create this task with administrative privileges" runs program files and commands as root, with their output in `~/Library/Logs/Task Manager/Run as administrator.log`; in the administrator copy everything else opens as you |
| Search online | Opens a web search for the process name in your browser |
| Uninstall (Installed apps) | Quits the app if it's running (waiting up to 10 seconds), then moves the app to the Trash on its own and, only once that worked, the related files you ticked. macOS doesn't ask for a password here: an app owned by an administrator or another user is refused, and Task Manager says to drag it to the Trash in Finder. macOS's own apps and Task Manager itself can't be uninstalled |

## Administrator rights

Task Manager runs as you. Two things need more:

- **Single admin actions** (disabling a system daemon, controlling a system service) run that one command as root.
  If Touch ID for `sudo` is set up on your Mac, you approve it with Touch ID; otherwise macOS shows its standard
  administrator password dialog. Task Manager never sees or stores your password.
- **Restart as administrator** (File menu) starts a second copy as root, after you authenticate, and closes the
  first. Before that it checks that the app's program file is still the code that's running, and the root shell
  checks its code signature hash again just before starting it (for the architecture that's running; in 1.6 and 1.7
  this check failed on the universal app, so Restart as administrator didn't work). Your current settings are handed over to it (they
  replace any root saved earlier), so it looks the same, but changes you make while elevated aren't saved, because
  root has its own preferences. Disk space's Move to Trash and Installed apps' Uninstall are off in the administrator copy.

## Background pieces

| Piece | When it exists | What it does |
|---|---|---|
| Open at login | Only if you switch it on | Registers the app as a login item with macOS (Service Management) |
| Hotkey helper | Only if you switch on "Control-Shift-Escape when Task Manager is closed" | A tiny background-only app inside the Task Manager bundle, started at login as a launch agent. It waits for Control-Shift-Escape and opens Task Manager. It has its own bundle identifier so macOS doesn't confuse it with the app |
| `nettop` snapshots | While Task Manager runs | One short snapshot at a time, about every 5 seconds, at low priority; the tool exits after each one |
| One-copy rule | Always | A second launch hands over to the running copy and exits |

Both login items appear in System Settings › General › Login Items and switch off from Settings or there.
`brew uninstall` quits the app and the helper.

## Data stored on your Mac

| What | Where | Kept for |
|---|---|---|
| Settings, license acceptance, startup-item disable dates, disk scan history | `~/Library/Preferences/local.alexd-gh.wintaskmanager.plist` (`local.alexander.wintaskmanager.plist` before 1.2) | Until you change or delete them |
| App history (daily totals per app) | `~/Library/Application Support/Task Manager/` | 30 days, saved every minute and on quit |
| Process samples, output of commands run as administrator | `~/Library/Logs/Task Manager/` | Until you delete them |

Nothing is sent anywhere. The only network traffic Task Manager causes itself is reverse DNS lookups for remote
hosts on the Connections page, which you can switch off there (Look up host names).

## Performance cost

Task Manager is meant to stay out of the way of what it measures:

- One sample per update interval reads the whole process table at once rather than process by process.
- Open handles are counted with one call per process each sample; the per-handle details are read only for a
  hover, an open Properties tab or a search.
- Per-process network uses one `nettop` snapshot every ~5 seconds. A continuous `nettop` stream was measured at
  about 1.5 CPU cores and is deliberately not used; the trade-off is that very short-lived processes can be missed.
- Code-signature checks run on a background queue and are cached per program file (read again when the file
  changes); reverse DNS lookups run at most four at a time and the latest 4,096 hosts are cached.
- Every helper command (`nettop`, `launchctl`, `pmset`, …) has a time limit, so a hung one can't stall a page.
- Graph motion in Extended graphs is done by Core Animation between samples, so the app does no work between
  samples for it.
- Paused update speed stops the sampling loop.

## Packaging, signing and versions

| Item | Details |
|---|---|
| Download | A ZIP of `Task Manager.app` on this repository's releases; the cask installs it to `/Applications` |
| Binary | Universal: Apple silicon (arm64) and Intel (x86_64) |
| Signing | Ad-hoc signed with the hardened runtime (since 1.6), not notarized, so the first launch needs **Open Anyway**. The only entitlement is Location, for the Wi-Fi name |
| Bundle identifiers | `local.alexd-gh.wintaskmanager` (app), `local.alexd-gh.wintaskmanager.hotkey` (hotkey helper); before 1.2 they began with `local.alexander`, and 1.2 copies the old settings over on first launch |
| Version and build | Version is the release (1.8); the build number goes up by one with every change, so a higher build is always newer. About shows both, the build date and the changes since the previous release |
| App icon | A light and a dark icon; on macOS 26 and later the Dock and Finder pick the one that matches dark mode |
| License | Shown in About › License… and accepted on first launch; see [LICENSE](../LICENSE) |

Checksums for each download are in the cask (`sha256`), and Homebrew checks them before installing.

## Mapping to Windows Task Manager

| Windows 11 | Task Manager for Mac | Notes |
|---|---|---|
| Processes, Performance, App history, Startup apps, Users, Details, Services | Same pages, same order, ⌘1–⌘8 | — |
| Ctrl+Shift+Esc | Control-Shift-Escape | Also when closed, with the hotkey helper |
| End task / End process tree | Same | Quit request or terminate signal; kill for force quit |
| Efficiency mode | Same | macOS background policy instead of EcoQoS |
| Create dump file | Create process sample | A call-stack sample rather than a memory dump |
| Startup impact | — | macOS doesn't measure it |
| Services (Windows services) | launchd agents and daemons | — |
| Run as administrator | Restart as administrator | — |
| GPU engines | Overall, 3D and tiler | macOS doesn't report Copy or Video engines |
| — | Advanced pages | Drivers, Connections, Disk space, Power and frequency, Apple silicon, Installed apps, System info |
