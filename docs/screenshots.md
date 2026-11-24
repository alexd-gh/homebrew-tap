# Screenshots

A tour of every page in Task Manager for Mac, taken with 1.1 and with 1.2 – 1.7 for what they added, taken on a MacBook Pro with an M4 Max in dark mode.
Personal details (account names, IP addresses, the battery serial number and some installed security software)
are covered with grey bars; everything else is as the app shows it.

[Processes](#processes) · [Performance](#performance) · [App history](#app-history) · [Startup apps](#startup-apps) ·
[Users](#users) · [Details](#details) · [Services](#services) · [Settings](#settings) · [Extended graphs](#extended-graphs) ·
[Advanced pages](#advanced-pages) · [About and license](#about-and-license) · [New in 1.2 to 1.13](#new-in-12-to-113)

Back to the [README](../README.md) · [Technical overview](technical-overview.md)

## Processes

Apps with their helpers nested, then background and macOS processes. CPU, memory, disk, network and GPU form a heat
map: the busier a cell, the darker its colour, with totals in the header. Power usage and its trend use Windows'
words, from Very low to Very high.

![Processes page](images/processes.jpg)

## Performance

One tile per resource on the left, with 60 seconds of history; the selected one fills the right side.

### CPU

Overall use (right-click the graph for one graph per core), processes, threads, open files, uptime, load average and
the chip's core layout.

![Performance: CPU](images/performance-cpu.jpg)

### Memory

Memory in use, the composition bar (app, wired, compressed, cached, free), swap, memory pressure, type and maker.

![Performance: Memory](images/performance-memory.jpg)

### Disk

One tile per physical drive: active time, transfer rate (solid read, dashed write), response time, capacity,
volumes and connection.

![Performance: Disk](images/performance-disk.jpg)

### Wi-Fi

Throughput, connection type, signal, channel, security, transmit rate and addresses. The network name needs Location
access because macOS hides it from apps otherwise.

![Performance: Wi-Fi](images/performance-wifi.jpg)

### GPU

Utilization, the 3D (renderer) and tiler engines, and shared GPU memory.

![Performance: GPU](images/performance-gpu.jpg)

### Battery

On Macs with a battery: the charge over 24 hours or 10 days (shaded while plugged in), battery used per hour,
charging and discharging power, health, cycle count, capacity and the power adapter.

![Performance: Battery](images/performance-battery.jpg)

## App history

CPU time, network and energy per app over the last 30 days, recorded while Task Manager runs.

![App history page](images/app-history.jpg)

## Startup apps

Launch agents and daemons with their publisher, status, whether they're running now and when they were disabled.
Enable and Disable take effect at the next sign-in or restart.

![Startup apps page](images/startup-apps.jpg)

## Users

Each signed-in user with their combined use, plus all system accounts grouped together. Expand a user to see their
processes.

![Users page](images/users.jpg)

## Details

Every process, Windows-style: PID, status, user name, CPU, memory, architecture and more columns from the header's
right-click menu. "—" means macOS only shares that number with administrators.

![Details page](images/details.jpg)

## Services

launchd services: your own agents (User) and system daemons (System), with PID, description and state. Start, Stop
and Restart; system services ask for your password or Touch ID.

![Services page](images/services.jpg)

## Settings

Theme, start page, update speed, open at login, administrator mode and window behaviour…

![Settings: general and window management](images/settings.jpg)

…and the other options: account names, history for all processes, advanced readings, Extended graphs and the
Advanced pages, with the version line at the bottom.

![Settings: other options and About](images/settings-other.jpg)

## Extended graphs

An optional style for the whole app, switched on in Settings › Extended graphs. Graphs become smooth glowing curves
coloured by level (green when quiet, through yellow, to red when busy), with LED meters, a "now" marker at the right
edge and smooth motion between updates. Pages without graphs get glowing values, level bars and status lights.
Saturation, visual bloom, HDR (brighter than white on HDR and XDR displays) and smooth motion are adjustable.

The screenshots in this section also have **Show advanced readings** on, which adds CPU speed per cluster,
temperatures and the NPU tile.

![Settings: Extended graphs options](images/extended-settings.jpg)

### Extended: Processes

LED meters under each column total, and a level bar in every busy cell.

![Processes with Extended graphs](images/extended-processes.jpg)

### Extended: Performance

The LED meter above each graph shows the current value; the curve's colour follows its level.

![Extended graphs: CPU](images/extended-performance-cpu.jpg)

The memory composition bar becomes an LED strip with a colour per type.

![Extended graphs: Memory](images/extended-performance-memory.jpg)

![Extended graphs: Disk](images/extended-performance-disk.jpg)

![Extended graphs: Wi-Fi](images/extended-performance-wifi.jpg)

![Extended graphs: GPU](images/extended-performance-gpu.jpg)

The NPU tile (Show advanced readings) shows Neural Engine power. On this Mac macOS only gives that reading to
administrators, and the page says so.

![Extended graphs: NPU](images/extended-performance-npu.jpg)

The battery's charge history, hourly use and power all glow too.

![Extended graphs: Battery](images/extended-performance-battery.jpg)

The floating graph summary window (double-click a graph, or Summary view) uses the same style.

![Extended graphs: summary view](images/extended-summary-view.jpg)

### Extended: pages without graphs

App history colours each value by how large it is, here with Settings › Show history for all processes on.

![Extended graphs: App history](images/extended-app-history.jpg)

Startup apps and Services get status lights.

![Extended graphs: Startup apps](images/extended-startup-apps.jpg)

![Extended graphs: Services](images/extended-services.jpg)

Users and Details get heat cells, level bars and glowing values.

![Extended graphs: Users](images/extended-users.jpg)

![Extended graphs: Details](images/extended-details.jpg)

### Extended: Advanced pages

The summary cards get LED meters, and the Apple silicon graphs glow like the Performance page.

![Extended graphs: Drivers](images/extended-advanced-drivers.jpg)

![Extended graphs: Connections](images/extended-advanced-connections.jpg)

![Extended graphs: Disk space](images/extended-advanced-disk-space.jpg)

Power and frequency adds a Level column with an LED meter for every sensor.

![Extended graphs: Power and frequency](images/extended-advanced-power.jpg)

![Extended graphs: Apple silicon](images/extended-advanced-apple-silicon.jpg)

Installed apps lights a green LED next to running apps (here ChatGPT, with its caches and logs).

![Extended graphs: Installed apps](images/extended-advanced-installed-apps.jpg)

## Advanced pages

Switched on in Settings › Advanced pages, a new sidebar section adds pages Windows Task Manager doesn't have.

### Drivers

Installed and loaded kernel extensions, driver extensions and system extensions, with state, version, wired memory
and vendor.

![Advanced: Drivers](images/advanced-drivers.jpg)

### Connections

Every open connection by app, with state, local and remote endpoints and traffic, filtered by connected, listening,
open to the network, UDP or this Mac. Remote hosts with a name show it under the address; untick **Look up host
names** to stop the lookups.

![Advanced: Connections](images/advanced-connections.jpg)

### Disk space

Scan your home folder, a volume or any folder (here `/var`) and see it as a treemap, with file types, the largest
folders and the largest files. Nothing is changed unless you choose Move to Trash.

![Advanced: Disk space](images/advanced-disk-space.jpg)

### Power and frequency

System power, the power adapter, CPU cluster clocks and activity, die temperatures, GPU and more, each with its
minimum and maximum since the last reset. Copy or save as CSV.

![Advanced: Power and frequency](images/advanced-power.jpg)

### Apple silicon

The chip's layout: each CPU cluster with its cores, clock and activity, the GPU's clock and power, the media engine
and power per block. Only on Apple silicon Macs; an Intel Mac leaves this page out.

![Advanced: Apple silicon](images/advanced-apple-silicon.jpg)

### Installed apps

Every app on the Mac with its version, when you last opened it and its size, filtered by third-party, App Store,
Apple, running or unused. The selected app (here IINA) shows its publisher, source and the files it keeps in
Library. Uninstall… lists the app and those files with a box each and moves the ticked ones to the Trash.

![Advanced: Installed apps](images/advanced-installed-apps.jpg)

![Uninstall IINA?](images/installed-apps-uninstall.jpg)

### System info

Apple's System Information report in Task Manager, with macOS's own labels: Hardware, Network and Software
categories on the left, the selected one on the right (here Hardware Overview; the serial number and hardware IDs
are hidden in this picture). Search filters the report; Copy and Save as text… export it.

![Advanced: System info](images/advanced-system-info.jpg)

Graphics/Displays, with the chip's GPU and each display:

![System info: Graphics/Displays](images/system-info-graphics.jpg)

## About and license

Task Manager › About Task Manager shows the version, build and the changes in this build.

![About Task Manager](images/about.jpg)

License… shows the full license and when you accepted it.

![License](images/about-license.jpg)

The first launch asks you to accept the same text before any window opens, and again whenever the terms change (as
with license version 2 in 1.9). **Accept** stays off until you scroll to the end of the license; **Quit** or Escape
closes the app.

![License prompt, Accept off at the top](images/license-prompt.jpg)

At the end of the text, the line under it says so and Accept turns on:

![License prompt at the end, Accept on](images/license-prompt-end.jpg)

## New in 1.2 to 1.13

### Network details (1.13)

Performance › Network › View network details lists every adapter with all ten columns, Utilization to MTU:

![View network details with all ten columns](images/network-details.jpg)

### Efficiency mode (1.12)

A process in Efficiency mode shows the green leaf and "Efficiency mode" in the Status column:

![Details page with a process in Efficiency mode](images/details-efficiency-mode.jpg)

### Check for updates (1.11)

Task Manager › Check for Updates… shows what's new in the latest release and how to update. A Homebrew install
updates in Terminal; a downloaded one opens the release page.

![Task Manager 1.11 is available](images/update-window.jpg)

With daily checks on, a bar at the top of the window says when a new version is out:

![Update bar in the main window](images/update-bar.jpg)

Daily checks are opt-in. New installs get an unticked box on the license prompt:

![Check for updates box on the license prompt](images/license-update-box.jpg)

Everyone else switches them on in Settings › Updates, where they start off:

![Settings › Updates](images/settings-updates.jpg)

### System info (1.8)

A new Advanced page, like TMOG's System Info: everything Apple's System Information app shows, searchable and
exportable. See [System info](#system-info) above.

![Advanced: System info](images/advanced-system-info.jpg)

### Installed apps (1.7)

A new Advanced page, like TMOG's Installed Apps: sizes, last-opened dates and related Library files for every app,
and Uninstall to the Trash. See [Installed apps](#installed-apps) above.

![Advanced: Installed apps](images/advanced-installed-apps.jpg)

### Confirm before ending a system process (1.6)

Ending WindowServer, loginwindow, watchdogd or another process macOS can't run without now asks first and says what
will happen. Processes Task Manager couldn't end anyway (another user's, without administrator rights) get the usual
"Access is denied" instead.

![End this system process?](images/end-system-process.jpg)

### Look up host names (1.6)

Advanced › Connections shows remote host names under the address and in the details pane (here a speed-test
download). The new **Look up host names** switch turns the reverse DNS lookups off; at most four run at a time.

![Advanced › Connections with host names](images/advanced-connections.jpg)

![Extended graphs: Connections](images/extended-advanced-connections.jpg)

### Core kinds on the CPU page (1.5)

Right-click the CPU graph › Change graph to › Logical processors. Each graph names its core: "E · CPU 0" is an
efficiency core, framed in teal; "P · CPU 4" is a performance core. The line under the graphs says which CPUs are
which.

![Performance › CPU: logical processors tagged E and P](images/performance-cpu-cores.jpg)

### Memory graph by type (1.5)

Right-click the memory graph › Change graph to › Composition. App memory, Wired, Compressed and Cached are stacked
in the composition bar's colours, with the "in use" line on top; hover the graph for the split at any moment in the
last 60 seconds.

![Performance › Memory split by type](images/performance-memory-composition.jpg)

With Extended graphs the bands are smooth glowing curves that slide between samples, and the "in use" line keeps its
colour-by-level glow.

![Extended graphs: Memory split by type](images/extended-performance-memory-composition.jpg)

### Open handles (1.2, 1.4)

Properties (⌘I on Details, or right-click › Properties) has a **Network** tab: every socket the process has open,
with protocol, local and remote address, state and traffic. With Advanced pages on, Show in
Connections opens Advanced › Connections filtered to this process.

![Properties › Network](images/properties-network.jpg)

The **Files** tab lists every open file, folder, device, pipe and socket with its access and size, filtered by kind.
Here most paths are inside the user's home folder, so they're covered.

![Properties › Files](images/properties-files.jpg)

Details shows how many handles each process has: Handles and Sockets by default, Files and Pipes from the column
menu (right-click any column header). Hovering a count splits it into files, folders, devices, sockets, pipes and
event queues. Here the table is sorted by Handles, with only the handle columns showing.

![Details: handles per process](images/details-handles.jpg)

### Find open file or port (1.2)

Edit › Find open file or port… (⇧⌘O) answers "what's using this?": type or drop a file, a folder or a volume, or
switch to Port and type a port number. Go to process selects the match in Details.

![Find open file or port](images/find-open-file.jpg)
