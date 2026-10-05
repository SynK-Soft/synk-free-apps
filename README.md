# SynK Free Apps

Free Windows applications from **SynK**. Download the `.exe`, run it, done. No sign-up, no ads, no tracking.

---

## About SynK

**SynK** (SynK-Soft) builds software products and tools.
This repository is where we share selected applications **free for the public**.

| | |
|---|---|
| **Company** | SynK |
| **Website** | *<add website>* |
| **Support email** | *<add company email>* |
| **GitHub** | [github.com/SynK-Soft](https://github.com/SynK-Soft) |

> Source code is kept in private repositories. This repository contains the ready-to-run applications only.

---

## Applications

| App | Description | Platform | Latest | Released | Download |
|-----|-------------|----------|--------|----------|----------|
| [Kanmani](#kanmani) | System-wide Malayalam typing for Windows | Windows 10/11 (64-bit) | **1.0.0** | 2026-10-05 | [**Download**](Kanmani/1.0.0/Kanmani-1.0.0.exe) |

<!-- Add new apps above this line -->

---

## Kanmani

<img src="Kanmani/kanmani-logo.png" alt="Kanmani logo" width="96">

**Malayalam system-wide transliteration for Windows.**
Type Manglish in English letters in **any** application and get Malayalam. Example: type `njaan` and get **ഞാന്‍**.

### Features
- Works in Word, Notepad, browsers and any other Windows application.
- Runs in the background with no taskbar button; lives in the notification area (system tray).
- Turn ON/OFF with **Ctrl+M** or from the tray menu (green dot = ON, grey dot = OFF).
- Optional **Start with Windows**.
- Portable: a single `.exe`, no installation and no Python needed.

### Downloads

| Version | Date | File | Size | SHA-256 |
|---------|------|------|------|---------|
| **1.0.0** (latest) | 2026-10-05 | [Kanmani-1.0.0.exe](Kanmani/1.0.0/Kanmani-1.0.0.exe) | x.x MB | `PASTE_SHA256_HERE` |

<!-- New Kanmani versions: add a row at the top of this table -->

### How to use
1. Download `Kanmani-1.0.0.exe` and double-click it. A splash screen appears and an icon is added to the system tray.
2. Type Manglish anywhere:

   | Type | Get |
   |------|-----|
   | `njaan` | ഞാന്‍ |
   | `kaNmaNi` | കണ്മണി |
   | `sakha` | സഖ |

3. Press **Space, Enter, Tab** or punctuation (`. , ? !`) to finish a word. Use **Backspace** to correct inside the current word.
4. Right-click the tray icon for Pause/Resume, Start with Windows, About and Exit.

### Notes
- If the app you type in runs **as Administrator**, run Kanmani as Administrator too, otherwise Windows blocks the keyboard hook.
- Keep your keyboard layout on **English (US)** while typing Manglish.
- To stop autostart, untick *Start with Windows* in the tray menu.

### Version history

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-10-05 | First public release. Manglish to Malayalam transliteration, tray icon, Ctrl+M toggle, Start with Windows, splash/About window, portable single EXE. |

### Credits
Software: Kanmani · Company: SynK · Developer: Rakhesh Thayyur

---

## Verify your download

Compare the file's SHA-256 with the value in the table above (PowerShell):

```powershell
Get-FileHash .\Kanmani-1.0.0.exe -Algorithm SHA256
```

### Windows SmartScreen / antivirus warning
New apps can show "Windows protected your PC". Click **More info → Run anyway**.
Apps that watch the keyboard (like Kanmani, to convert what you type) are sometimes flagged by antivirus as a false positive. The checksum above lets you confirm the file is exactly what we published.

---

## Repository layout

```
synk-free-apps/
├── README.md                     ← this file
└── Kanmani/
    ├── kanmani-logo.png
    └── 1.0.0/
        └── Kanmani-1.0.0.exe     ← one folder per version, never delete old ones
```

## Support

Found a bug or have an idea? [Open an issue](../../issues) and mention the app name and version.

## License

Freeware: free to use and to share **unmodified**, for personal and commercial use.
Modification, reverse engineering and resale are not permitted.
The software is provided "as is", without warranty of any kind.

© 2026 SynK. All rights reserved.
