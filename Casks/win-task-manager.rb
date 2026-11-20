cask "win-task-manager" do
  version "1.0"
  sha256 "1b4d0fd101678dc734785283375769062f95702d7c251741b2b652af3c2fab81"

  url "https://github.com/alexd-gh/homebrew-tap/releases/download/v#{version}/TaskManager-#{version}.zip"
  name "Task Manager"
  desc "Windows 11-style task manager"
  homepage "https://github.com/alexd-gh/homebrew-tap"

  depends_on macos: ">= :sonoma"

  app "Task Manager.app"

  uninstall quit: [
    "local.alexander.wintaskmanager",
    "local.alexander.wintaskmanager.hotkey",
  ]

  zap trash: [
    "~/Library/Application Support/Task Manager",
    "~/Library/Logs/Task Manager",
    "~/Library/Preferences/local.alexander.wintaskmanager.plist",
  ]
end
