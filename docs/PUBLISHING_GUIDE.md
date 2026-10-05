# Publishing Guide (internal)

Step by step: create this public repo, publish the first app (Kanmani), and add future apps and versions.

## Design decisions

| Topic | Decision | Why |
|-------|----------|-----|
| Where binaries live | **GitHub Releases**, not git history | Git rejects files over 100 MB, and every EXE version would bloat the repo forever |
| Repo count | **One public repo** for all free apps | One place for users, one catalog, one issue tracker |
| Per-app tags | `<app>-v<version>`, e.g. `kanmani-v1.0.0` | Several apps share one repo, so plain `v1.0.0` would clash |
| File names | `<Name>-<version>-win-x64.exe` | Version in the file name; stable, predictable download URL |
| Source code | Stays in private repos | Public repo holds binaries, docs and support only |
| Integrity | SHA-256 on release page and README | Users can verify; helps with antivirus false positives |
| Auto-update (future) | `apps/<app>/latest.json` read via raw.githubusercontent.com | Kanmani's planned auto-update can read version, url, sha256 |

---

## Part A. One-time setup (about 20 minutes)

### 1. Create the repository
1. GitHub, organisation **SynK-Soft** → **New repository**.
2. Name: `synk-free-apps`.
3. Description: *Free software from SynK. Downloads, release notes and support.*
4. Visibility: **Public**.
5. Do not add README, .gitignore or license (this scaffold has them).
6. Create.

If public repos are blocked: Organisation → **Settings → Member privileges → Repository creation** → allow public (owner only).

### 2. Push the scaffold
```bash
cd synk-free-apps                 # the unzipped folder
git init -b main
git add .
git commit -m "Initial public repo with Kanmani 1.0.0 page"
git remote add origin https://github.com/SynK-Soft/synk-free-apps.git
git push -u origin main
```

### 3. Add logo and screenshots
- Copy `assets/kanmani-logo.png` from the private Kanmani repo to `apps/kanmani/assets/kanmani-logo.png`.
- Add 2 or 3 screenshots (tray menu, splash, typing example) to `apps/kanmani/assets/screenshots/` and link them in `apps/kanmani/README.md`.
- Delete `PUT_LOGO_HERE.txt`.

### 4. Repository settings
- **General → Features**: enable Issues; disable Wikis and Projects; enable Discussions if you want Q&A.
- **General → Social preview**: upload a 1280x640 SynK banner.
- **Code security**: enable **Private vulnerability reporting** (SECURITY.md relies on it).
- **Branches / Rulesets** on `main`: require pull request, block force pushes.
- **About** (gear on repo home): description, website, topics such as `freeware`, `malayalam`, `windows`, `transliteration`.

### 5. Replace placeholders
Search for `PASTE_SHA256_HERE`, `<add company support email>`, `<add company security email>` and `x.x MB`.

### 6. Privacy tip
Use a company address (for example support@yourdomain) in public files. The private README contains a personal email and phone number; do not copy them here.

---

## Part B. Publish Kanmani 1.0.0

### 1. Get the exact EXE
Use `Versions/1_0_0/Kanmani.exe` from the private repo (or rebuild with `build_exe.bat`). Publish the same binary you tested.

### 2. Create release files (PowerShell, from repo root)
```powershell
.\scripts\release.ps1 -App kanmani -Name Kanmani -Version 1.0.0 -Exe "C:\path\to\Versions\1_0_0\Kanmani.exe"
```
Creates `dist-release\Kanmani-1.0.0-win-x64.exe`, prints the SHA-256, and updates `apps\kanmani\latest.json`.

### 3. Update docs and push
- Paste SHA-256 and size into `apps/kanmani/README.md`.
- Confirm date in root `README.md` and `CHANGELOG.md`.
```bash
git add .
git commit -m "Kanmani 1.0.0"
git push
```

### 4. Create the GitHub Release
1. Repo → **Releases → Draft a new release**.
2. **Choose a tag** → type `kanmani-v1.0.0` → *Create new tag on publish* (target `main`).
3. **Title**: `Kanmani 1.0.0`.
4. **Description**:
   ```
   ## Kanmani 1.0.0 (2026-10-05)
   First public release. System-wide Malayalam transliteration for Windows.

   Download: Kanmani-1.0.0-win-x64.exe
   SHA-256: <paste>
   Requires: Windows 10/11 64-bit

   See the changelog and app page in apps/kanmani/.
   ```
5. Drag `dist-release\Kanmani-1.0.0-win-x64.exe` into **Attach binaries**.
6. Tick **Set as the latest release** → **Publish release**.

### 5. Test the public link
In an incognito window (logged out), open:
`https://github.com/SynK-Soft/synk-free-apps/releases/download/kanmani-v1.0.0/Kanmani-1.0.0-win-x64.exe`
It must download directly. Run `Get-FileHash` and compare with the published SHA-256.

### 6. Recommended extras
- Upload the EXE to **virustotal.com** and link the report in the release notes. Keyboard-hook apps often trigger false positives.
- Consider an OV/EV **code-signing certificate** later to reduce SmartScreen warnings.

---

## Part C. Releasing a new version

1. Build in the private repo; test the final EXE.
2. Run `scripts\release.ps1` with the new version (e.g. `-Version 1.1.0`).
3. Add a new section at the top of `apps/<app>/CHANGELOG.md`.
4. Update the app's row in the root `README.md` and the download table in `apps/<app>/README.md`.
5. Commit, push, create release `<app>-v<version>`, attach the EXE, publish.
6. Never delete or replace old releases or assets.

Versioning: MAJOR.MINOR.PATCH. Bug fix = patch, new feature = minor, breaking change = major.

## Part D. Adding a new app

1. Copy `apps/kanmani/` to `apps/<new-app>/`; edit README, CHANGELOG, latest.json, logo.
2. Add a row to the root README table and add the app name to the **App** dropdown in both issue templates.
3. Follow Part C with `-App <new-app> -Name <NewApp>`.

### Optional automation later
A workflow in each private repo can build the EXE and publish a release in the public repo using a fine-grained token (Contents read/write on the public repo only) stored as a secret in the private repo. Do this once the manual process feels stable.

## Checklist

- [ ] Public repo created, scaffold pushed
- [ ] Logo and screenshots added
- [ ] Placeholders replaced; personal contact details removed
- [ ] Settings applied (issues, private vulnerability reporting, branch protection)
- [ ] Release `kanmani-v1.0.0` published with EXE
- [ ] Download link tested logged out; SHA-256 matches
- [ ] Private repo README links to the public download page
