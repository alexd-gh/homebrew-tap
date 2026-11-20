# alexd-gh/tap

Homebrew tap for [Task Manager](https://github.com/alexd-gh/Win-Task-Manager), a Windows 11-style task manager for macOS.

```bash
brew install --cask alexd-gh/tap/win-task-manager
```

The app is ad-hoc signed (not notarized), so macOS blocks the first launch. Open it once, then go to
System Settings › Privacy & Security and click **Open Anyway**.

Update with `brew upgrade --cask win-task-manager`; remove with `brew uninstall --cask win-task-manager`
(add `--zap` to also delete its settings and app history).
