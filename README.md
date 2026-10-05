<p align="center">
  <img src="assets/kanmani-logo.png" alt="Kanmani logo" width="700">
</p>

# Kanmani

<p align="center">
  <a href="https://github.com/SynK-Soft/Kanmani/raw/refs/heads/main/Versions/1_0_0/Kanmani.exe"><b>Download Kanmani v1.0.0 (Windows EXE)</b></a>
</p>

Malayalam system-wide transliteration for Windows.
Type Manglish in English letters in ANY application and get Malayalam.
Example: type `njaan` and get `ഞാന്‍`.

- Runs in background, no taskbar icon, lives only in the notification area (system tray).
- Works in Word, Notepad, browsers, and any other application.
- Temporary ON/OFF toggle via tray menu or `Ctrl+M`.
- Kanmani scheme ported from `kanmani_offline.htm`.

Software: Kanmani
Company: SynK
Developer: Rakhesh Thayyur <rakheshthayyur@gmail.com> | +919846546124

## Files

- `KanmaniApp.py` – main background application (global hook + tray + splash).
- `kanmani.py` – Kanmani transliteration engine (converted rules, greedy longest match).
- `kanmani_logo.py` – Kanmani logo embedded as base64 PNG (no external file at runtime).
- `kanmani_offline.htm` – original offline reference page for the scheme.
- `assets/kanmani-logo.svg` – original vector logo (design source).
- `assets/kanmani-logo.png` / `assets/kanmani-logo.ico` – rendered logo, used for the EXE icon at build time.
- `requirements.txt` – Python dependencies.
- `build_exe.bat` – one-click EXE build script.
- `.gitignore` – keeps Python/PyInstaller output (`build/`, `dist/`, `*.spec`, caches) out of git.
- `dist\Kanmani.exe` – built portable executable (after build, git-ignored – rebuild with `build_exe.bat`).
- `Versions\1_0_0\Kanmani.exe` – released v1.0.0 binary (committed, direct download link at the top).

## Use

1. Run the app (see Run below). A splash screen shows the Kanmani logo,
   name, version, company (SynK) and developer credits for ~2.6 seconds
   (click or press any key to dismiss, `--no-splash` to skip).
   Reopen it anytime: right-click tray icon → `About Kanmani`.
   The About window stays open until you click on it.
2. The shield logo icon appears in the notification area.
3. Green dot = ON, grey dot = OFF.
3. Type Manglish anywhere, for example:
   - `njaan` → `ഞാന്‍`
   - `kaNmaNi` → `കണ്മണി`
   - `sakha` → `സഖ`
4. Use Space, Enter, Tab, or punctuation (`. , ? !`) to finish a word.
5. Use Backspace to correct inside the current word.
6. Toggle temporarily:
   - Right-click tray icon → Pause / Resume Malayalam, or
   - Press `Ctrl+M` anywhere.
7. Right-click tray icon → `Start with Windows` for autostart, `About Kanmani` for the info window, `Exit` to quit.

Notes:
- If the target app is run as Administrator, run Kanmani as Administrator too, otherwise Windows blocks the keyboard hook.
- Keep your keyboard layout to English (US) while typing Manglish.

## How to run (source)

Requirements: Python 3.10+ on Windows.

```bat
pip install -r requirements.txt
pythonw KanmaniApp.py
```

- Use `pythonw` to hide the console (background + tray only).
- Use `python KanmaniApp.py` if you want to see console logs.
- Single instance is enforced – if Kanmani is already running, a second start exits.

Dependencies:
- `keyboard` – global low-level keyboard hook and Unicode output.
- `mouse` – reset current word on mouse click.
- `pystray` + `Pillow` – notification-area icon.

## How to build (EXE)

One click:

```bat
build_exe.bat
```

This runs:

```bat
pip install -r requirements.txt
PyInstaller --noconfirm --onefile --noconsole --name Kanmani --icon "assets\kanmani-logo.ico" KanmaniApp.py
```

Output: `dist\Kanmani.exe`

- `--noconsole` = no console window, no taskbar button, tray only.
- `--onefile` = single portable EXE.
- `--icon` = Kanmani logo as the EXE/taskbar icon.
- The logo PNG is embedded in the code (`kanmani_logo.py`), so the EXE needs no external image files.

## How to use as portable

1. Build once (above) or copy `dist\Kanmani.exe` to any folder or USB stick.
2. No installation needed. No admin needed except for elevated target apps (see above).
3. Double-click `Kanmani.exe`:
   - First run shows the tray icon immediately.
   - No files are written except optional autostart registry entry (only if you enable `Start with Windows`).
4. Carry the single `Kanmani.exe` file between PCs. Python is not required on the portable machine.
5. To stop: tray icon → `Exit`.
6. To remove autostart: tray icon → uncheck `Start with Windows`, or delete `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\Kanmani`.

Portable layout example:

```
KanmaniPortable\
  Kanmani.exe
```

Optional: keep `kanmani_offline.htm` alongside for scheme reference – not required at runtime (rules are embedded in the EXE via `kanmani.py`).

## Planned features (Todo)

### Typing & scheme
- [ ] More schemes – InScript, Google-style Manglish variants, scheme switcher in tray menu
- [ ] Smart word predictions / autocomplete dropdown while typing
- [ ] Auto-correct common Manglish slips with an editable correction list
- [ ] Numbers & date in Malayalam – convert digits and expand date-style input
- [ ] Chillu output style toggle – traditional `ന്‍` (with ZWJ) vs modern `ൻ`

### Control & UX
- [ ] Per-app enable/disable – auto-pause in selected apps with an app list
- [ ] Temporary English passthrough key – type one English word without toggling
- [ ] On-screen language indicator – small floating `മ` badge near cursor showing ON/OFF
- [ ] Custom hotkey setting – change `Ctrl+M` from a settings dialog
- [ ] Typing sound feedback – subtle click on toggle or word commit (optional)

### Productivity
- [ ] Clipboard transliterate – hotkey to convert selected/clipboard Manglish to Malayalam in place
- [ ] Typing statistics – words typed today, most-used words, stats window
- [ ] Custom dictionary / shortcuts – user-defined expansions
- [ ] Export typed text log – optional daily log file of transliterated output

### System & distribution
- [ ] Settings window – GUI for scheme, hotkey, autostart, theme, dictionary
- [ ] Auto-update – check GitHub Releases for new versions with one-click update
- [ ] Portable settings – keep config/dictionary next to EXE for USB carry
- [ ] Malayalam font check – verify a Malayalam font exists on first run

## Credits

Software: Kanmani
Company: SynK
Developer: Rakhesh Thayyur
Email: rakheshthayyur@gmail.com
Phone: +919846546124
