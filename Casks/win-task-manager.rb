cask "win-task-manager" do
  version "1.7"
  sha256 "6ee1600de77f328c60c463546b1a4306487d95f988714407cc462461f2269b0d"

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
