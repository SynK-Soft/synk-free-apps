# SynK Free Apps

Free software from **SynK** (SynK-Soft), released as ready-to-run downloads for everyone.
No sign-up, no ads, no tracking.

> Source code for these apps is maintained in private repositories.
> This repository only hosts **binaries, release notes, checksums and support**.

## Apps

| App | What it does | Platform | Latest | Released | Download |
|-----|--------------|----------|--------|----------|----------|
| [**Kanmani**](apps/kanmani/README.md) | System-wide Malayalam transliteration (type Manglish, get Malayalam) in any Windows app | Windows 10/11 (64-bit) | **1.0.0** | 2026-10-05 | [Kanmani-1.0.0-win-x64.exe](https://github.com/SynK-Soft/synk-free-apps/releases/download/kanmani-v1.0.0/Kanmani-1.0.0-win-x64.exe) |

<!-- ADD NEW APPS ABOVE THIS LINE. Keep one row per app, latest version only. -->

Full version history for every app: see [Releases](../../releases) and each app's `CHANGELOG.md`.

## How to download and run

1. Open the **Download** link for the app (or go to [Releases](../../releases)).
2. Save the `.exe` anywhere (a folder or USB stick). Apps are portable; no installer needed unless stated.
3. (Recommended) Verify the download. See [Verify your download](#verify-your-download).
4. Double-click to run.

### Windows SmartScreen warning
New, unsigned apps can show "Windows protected your PC". Click **More info → Run anyway**.
Some antivirus tools may flag apps that use a global keyboard hook (such as Kanmani) as a false positive.
Each release lists its SHA-256 checksum so you can confirm the file is exactly what we published.

## Verify your download

PowerShell:

```powershell
Get-FileHash .\Kanmani-1.0.0-win-x64.exe -Algorithm SHA256
```

Compare the result with the checksum shown on the release page and in
[`apps/kanmani/README.md`](apps/kanmani/README.md).

## Repository layout

```
apps/<app-name>/        One folder per app: README, CHANGELOG, logo, screenshots, latest.json
scripts/                Helper scripts for publishing releases
docs/                   Internal publishing guide
.github/                Issue templates
```

Binaries are **not** committed to the repository. They are attached to
[GitHub Releases](../../releases) with tags like `kanmani-v1.0.0`.

## Support and feedback

- Bug or question: [open an issue](../../issues/new/choose) and pick the app's template.
- Security problem: see [SECURITY.md](SECURITY.md).
- Contact: *<add company support email>*

## License and terms

All applications are **freeware**: free to use, copy and share unmodified, for personal and commercial use.
Reverse engineering, resale and modification are not permitted. See [LICENSE](LICENSE).

© 2026 SynK. All rights reserved.
