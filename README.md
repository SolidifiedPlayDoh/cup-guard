# Cup Guard

Overlay app for the Roblox cup/bell mini-game. Watches the red cup rim on screen and can auto-press **E** (don't ring) and **Q** (grab cup) with a human-like delay.

![macOS overlay concept](calibration_debug.png)

## Features

- **Always-on-top overlay** (top-right) with live cup status
- **Live capture preview** with monitor region highlighted
- **Toggles** for monitoring, auto-E, and auto-Q
- **Sensitivity slider** for tuning detection
- **Press `0`** on the cup rim to calibrate + arm instantly
- Cross-platform: **macOS**, **Windows**, Linux (from source)

## Quick start (from source)

Requirements: Python 3.11+, [uv](https://docs.astral.sh/uv/)

```bash
git clone https://github.com/Solidifiedplaydoh/cup-guard.git
cd cup-guard
uv venv
uv pip install -e .
uv run cup-guard          # launches overlay (default)
```

Or CLI mode:

```bash
uv run cup-guard start    # terminal mode, press 0 to arm
```

## Permissions

| Platform | Screen capture | Keyboard automation |
|----------|----------------|---------------------|
| macOS | System Settings → Privacy → **Screen Recording** | **Accessibility** |
| Windows | Settings → Privacy → **Screenshots and apps** | Run as admin may help; allow app in privacy settings |

Grant permissions to **Cup Guard** (or Terminal/Python when running from source), then restart the app.

## Overlay controls

| Control | Action |
|---------|--------|
| **Arm (0)** | Calibrate at cursor + start monitoring |
| **Monitoring** | Pause/resume detection |
| **Auto-press E** | Press E when cup leaves the spot |
| **Auto-press Q** | Random Q press 2.5–4s after each E |
| **Sensitivity** | Lower = triggers sooner |

## GitHub Releases

Tagged releases (`v1.0.0`, etc.) build automatically:

- **macOS**: `CupGuard.app` (zip)
- **Windows**: `CupGuard.exe`

Download from [Releases](https://github.com/Solidifiedplaydoh/cup-guard/releases).

### Build locally

```bash
uv pip install pyinstaller
uv run pyinstaller CupGuard.spec --noconfirm      # macOS .app
uv run pyinstaller CupGuard-win.spec --noconfirm  # Windows .exe
```

Output in `dist/`.

## How calibration works

1. Hover on the **bottom red rim** of the cup
2. Press **`0`** (or click **Arm** in the overlay)
3. The app samples a strip **12px above** your cursor (so the pointer doesn't block the red)
4. Monitoring starts immediately

Config is saved to:

- macOS: `~/Library/Application Support/CupGuard/`
- Windows: `%APPDATA%\CupGuard\`
- Linux: `~/.config/cup-guard/`

## CLI commands

```bash
cup-guard              # overlay (default)
cup-guard gui          # overlay
cup-guard start        # CLI loop
cup-guard calibrate    # manual calibrate with countdown
cup-guard preview      # terminal stats
cup-guard test-capture # verify screen recording works
```

## License

MIT — use at your own risk. Automating gameplay may violate Roblox Terms of Service.
