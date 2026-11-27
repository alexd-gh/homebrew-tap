# Release history

Downloads are on [Releases](https://github.com/alexd-gh/homebrew-tap/releases). Update with
`brew upgrade --cask win-task-manager`.

## 1.17 — 26 November 2026 (build 84)

- **Restart as administrator** acts for your account: Services and Startup apps show your agents, Installed apps'
  Open and Run new task's `~` use your account; settings are handed over only from a file you own.
- **App history** records only your processes, ignores stale network readings, prunes while running, is private and
  sets a damaged file aside.
- **Installed apps:** Apple and App Store status from the signature; shared-ID files not ticked for Uninstall.
- **Disk space:** Move to Trash checks the item before and after moving it.
- **Connections:** a listener on one network address counts as open to the network.

## 1.16 — 25 November 2026 (build 82)

- **Process actions** act only on the process that was chosen, also when its ID is reused while a confirmation is
  open.
- **Run new task as administrator:** the log is written by your account, not the administrator one, and is private.
- **Restart as administrator** runs a checked copy from a folder only the administrator can change.
- **Smaller:** Restart only for the real system apps; kernel_task's priority can't change Task Manager's own; no build
  folder names in the download.

## 1.15 — 24 November 2026 (build 79)

- **Wi-Fi name note:** with Location Services off for the whole Mac, the page says so and links to System Settings;
  it used to say Task Manager's own Location access was off.
- **Not responding** seen working: a hung app shows it in Status once macOS flags the app as unresponsive (Show
  advanced readings).

## 1.14 — 24 November 2026 (build 77)

- **Startup apps' Running now column** sorts by whether the item is running, not by its name.
- **NPU page:** says plainly when macOS reports no Neural Engine energy, administrator rights included, instead of
  suggesting Restart as administrator.

## 1.13 — 24 November 2026 (build 73)

- **View network details fits every column.** 1.12's fix didn't work: Packets out, Errors and MTU were still cut
  off. The sheet is wider and all ten columns show.

## 1.12 — 24 November 2026 (build 71, not pushed to Homebrew)

- **Efficiency mode shows** on macOS 27: the leaf and "Efficiency mode" in Status while it's on, and the button turns
  it off again.
- Startup apps' Disabled time column fits the whole date; no window-tab commands in the View and Window menus.

## 1.11 — 24 November 2026 (build 69)

- **Check for updates** in the Task Manager menu, Settings › Updates and About: shows the new version's notes;
  Homebrew installs update in Terminal (`brew upgrade --cask`), downloaded ones open the release. Skip a version or
  be reminded later.
- **Daily checks are opt-in:** an unticked box on the first-run license prompt for new installs, otherwise
  Settings › Updates, off by default. A bar at the top of the window says when a new version is out.

## 1.10 — 23 November 2026 (build 67)

- **Intel Macs** no longer show the Apple silicon page, which has nothing to show there. The other Advanced pages
  keep their shortcuts.

## 1.9 — 23 November 2026 (build 65)

- **License version 2:** liability capped at US $1 in direct damages instead of excluded outright, plus clauses on
  sensitive information, no data collection, no support, California law and consumer rights. Everyone accepts it
  once; **Accept turns on after scrolling to the end** of the license.
- **Smaller download:** the Control-Shift-Escape helper is its own 177 KB program, so the app drops from 37 MB to
  20 MB and the ZIP from 12 MB to 7.7 MB.
- **Installed apps** finds vendor folders (marked "vendor", unticked in Uninstall); the Opened column shows "Now" or
  "Unknown" with the reason; folders macOS won't let it read show "—" instead of 0 B.

## 1.8 — 23 November 2026 (build 61)

- **System info**, a new Advanced page (⌥⌘7) modelled on TMOG's System Info: the full report of Apple's System
  Information app (Hardware, Network and Software) with macOS's own labels; long lists folded and sorted, search,
  Copy and Save as text….
- **Restart as administrator works again.** Its check that the program file hadn't changed always failed on the
  universal app in 1.6 and 1.7.
- **Safer Uninstall:** the app goes to the Trash first and its Library files only after that; apps owned by an
  administrator or another user say so and point to Finder.

## 1.7 — 23 November 2026 (build 58)

- **Installed apps**, a new Advanced page (⌥⌘6) modelled on TMOG's Installed Apps: every app in Applications,
  `~/Applications` and macOS's own apps, with version, size and when you last opened it; filters for third-party,
  App Store, Apple, running and unused apps; search by name or bundle ID.
- The selected app shows its publisher, source and the files it keeps in Library (containers, caches, preferences,
  saved state, web data, launch agents and more), with sizes.
- **Uninstall…** quits the app and moves it and the files you tick to the Trash. Files found only by name start
  unticked; macOS's own apps can't be removed; off while running as administrator.

## 1.6 — 23 November 2026 (build 56)

A safety and reliability release.

- **Safer End task.** Ending WindowServer, loginwindow or another critical system process now asks first, as Windows
  does. End task, Force quit, priority and Efficiency mode check that the process is still the one you picked, so a
  reused process ID is left alone. End process tree won't touch launchd.
- **Trustworthy publishers.** "Apple Inc." and the Apple driver vendor now come only from Apple's own signature;
  code changed after signing shows "Invalid signature". Signatures are checked in the background, so large apps no
  longer slow a refresh.
- **Safer Restart as administrator.** Task Manager checks that its program file is still the running code before
  starting the administrator copy, and the app is signed with the hardened runtime. In the administrator copy, Run
  new task opens things as you unless the administrator box is ticked; commands run as administrator report a
  failed password prompt and write their output to `~/Library/Logs/Task Manager`. Settings handed over always apply,
  and Move to Trash is off while elevated.
- **Connections:** at most four host-name lookups at a time, and a new **Look up host names** switch.
- **Disk space** scans use far less memory (about 170 MB instead of 1.1 GB for ~/Library), refuse to trash an item
  replaced since the scan, and no longer hide files from a similarly named folder in Largest files.
- **Fixed:** a hung helper command could freeze the Network column or a page; fast network links could under-report;
  the Power and frequency and Apple silicon pages could leak sensor connections on redraws; an odd fan count could
  crash Power and frequency; app history that couldn't be read was overwritten. The battery log is now read only
  while Performance is open, and Services re-reads launchd files only when they change.

## 1.5 — 21 November 2026 (build 54)

- **Core kinds on the CPU page.** Performance › CPU › Logical processors tags each graph with its core kind
  ("E · CPU 0", "P · CPU 4"), frames efficiency cores in teal and explains the letters under the graphs, so you can
  see which cores macOS is using. Intel Macs show plain "CPU n" tags.
- **Memory graph by type.** Right-click the graph on Performance › Memory › Change graph to › Composition to see App
  memory, Wired, Compressed and Cached stacked in the composition bar's colours, with the "in use" line on top. Hover
  it for the split at any moment in the last 60 seconds. Off by default; your choice is remembered. With Extended
  graphs it slides smoothly between samples like the other graphs.

## 1.4 — 21 November 2026 (build 50)

- **Handles by type in Details.** Handles and Sockets columns now show by default, and new Files and Pipes columns
  can be turned on from the column menu. Hover a Handles count to split it into files, folders, devices,
  TCP/UDP/local sockets, pipes and event queues; hovering Handles on Performance › CPU does the same for every
  process you can read.
- **Fixed:** dragging a window onto another screen could still make it jump away from the cursor. Drag the title
  row, the strip above Fewer details, or anywhere on the Summary window.

## 1.3 — 21 November 2026 (build 46)

- **Double-click the title row to fill the screen**, leaving the menu bar and Dock visible, like maximizing on
  Windows; double-click again to restore. It follows System Settings › Desktop & Dock.
- **Disk space scans keep running** while you look at other pages, and their result is there when you come back. The
  sidebar shows a spinner while a scan runs and a dot when it finished unseen.
- **Fixed:** dragging the main or Summary window onto another screen could make it jump away from the cursor.

## 1.2 — 20 November 2026 (build 42)

- **Open handles for each process.** Properties has new Network and Files tabs (live sockets with state and bytes;
  every open file, folder, device, pipe and socket with its access), the right-click menus have Network
  connections… and Open files…, and Edit › Find open file or port… (⇧⌘O) finds which processes hold a file, folder,
  volume or port. Performance › CPU calls open files Handles, as Windows does.
- **Lower CPU use:** the network reader no longer runs `nettop` many times a second on macOS 27, which cost about a
  third of a CPU core and leaked open handles.
- **Menu bar menu** no longer jumps its highlight or changes size while open; its readings still update live.
- **Fixed:** Go to details scrolled the Details table sideways, away from its column headers.
- **Fixed:** Help › Task Manager on GitHub now opens this tap instead of a page you couldn't see.
- **New app identifier** `local.alexd-gh.wintaskmanager`. Settings saved under the old one are copied over on first
  launch.

## 1.1 — 20 November 2026 (build 37)

- **About window** (Task Manager › About Task Manager, also Help › What's New): version, build number, build date,
  author and the list of changes in this build, with a Copy button.
- **New app icon**: a Windows 11-style window showing the Performance page's resources beside a glowing graph, with a
  simplified version for small sizes. It also appears in the title bar and About.
- **Dark app icon**: on macOS 26 and later the Dock and Finder switch to it in dark mode; the title bar and About
  follow Settings › Theme.
- **Freeware license**: free to use, also commercially. The first launch asks you to accept it (Quit closes the app),
  and About › License… shows the full text and when you accepted it. The license is also on the disk image.

## 1.0 — 20 November 2026

First release.

- **Pages**: Processes, Performance, App history, Startup apps, Users, Details and Services, as in Windows 11, plus
  Settings.
- **Processes**: apps with nested helpers, background and macOS processes; CPU, memory, disk, network and GPU heat
  map; power usage and trend; choose columns; efficiency mode; end task, force quit, process samples, properties.
- **Performance**: CPU (overall or per core), memory, one tile per disk, Wi-Fi and Ethernet details, GPU, and a
  battery page on Macs with a battery.
- **App history**: 30 days of CPU time, network and energy per app.
- **Startup apps and Services**: enable or disable launch agents and daemons; start, stop and restart services.
- **Restart as administrator** to see every process's numbers; Touch ID or password for single admin actions.
- **Show advanced readings**: CPU speed, Neural Engine power, temperatures and Not responding.
- **Advanced pages**: Drivers, Connections, Disk space, Power and frequency, and Apple silicon.
- **Extended graphs**: smooth glowing graphs coloured by level, LED meters, and glowing values on the pages without
  graphs.
- **Also**: menu bar icon with live CPU, graph summary window, Fewer details window, Control-Shift-Escape (also when
  closed), open at login, one copy only.
