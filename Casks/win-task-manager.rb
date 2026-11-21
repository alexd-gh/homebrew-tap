cask "win-task-manager" do
  version "1.3"
  sha256 "a5db47d1e31792c244b971fa294c22daf71aed766c39571650bdd3ca5b784413"

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
