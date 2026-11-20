cask "win-task-manager" do
  version "1.1"
  sha256 "b61375ce51d8cc6024743ddec6080176246661f6d519289940da1c154ec151b2"

  url "https://github.com/alexd-gh/homebrew-tap/releases/download/v#{version}/TaskManager-#{version}.zip"
  name "Task Manager"
  desc "Windows 11-style task manager"
  homepage "https://github.com/alexd-gh/homebrew-tap"

  depends_on macos: :sonoma

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
