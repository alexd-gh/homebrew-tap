cask "win-task-manager" do
  version "1.9"
  sha256 "7d4a4fc3b0cc1fe32cb8d9cb0537436f9f8930a6fc1bbc5a8c16b536ea295bef"

  url "https://github.com/alexd-gh/homebrew-tap/releases/download/v#{version}/TaskManager-#{version}.zip"
  name "Task Manager"
  desc "Windows 11-style task manager"
  homepage "https://github.com/alexd-gh/homebrew-tap"

  depends_on macos: :sonoma

  app "Task Manager.app"

  uninstall quit: [
    "local.alexd-gh.wintaskmanager",
    "local.alexd-gh.wintaskmanager.hotkey",
  ]

  zap trash: [
    "~/Library/Application Support/Task Manager",
    "~/Library/Logs/Task Manager",
    "~/Library/Preferences/local.alexander.wintaskmanager.plist",
    "~/Library/Preferences/local.alexd-gh.wintaskmanager.plist",
  ]
end
