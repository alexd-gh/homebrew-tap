cask "win-task-manager" do
  version "1.14"
  sha256 "88f8aec199c126e44fcc8a1daca1c70a255f1a428b13d0c0ffe76e4d458cdd15"

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
