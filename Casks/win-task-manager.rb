cask "win-task-manager" do
  version "1.17"
  sha256 "87acdb73e9f76a315332aa0c37ba73234ada43e0a6ef5b7c8f0fa52b24439277"

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
