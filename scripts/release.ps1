<#
 Prepare a release for an app.
 Usage:  .\scripts\release.ps1 -App kanmani -Name Kanmani -Version 1.0.0 -Exe "C:\path\Kanmani.exe"
 Output: dist-release\<Name>-<Version>-win-x64.exe, its SHA256, and an updated apps\<app>\latest.json
 Upload the file from dist-release to GitHub Releases (it is not committed; *.exe is git-ignored).
#>
param(
  [Parameter(Mandatory)] [string]$App,      # folder name, e.g. kanmani
  [Parameter(Mandatory)] [string]$Name,     # file/display name, e.g. Kanmani
  [Parameter(Mandatory)] [string]$Version,  # e.g. 1.0.1
  [Parameter(Mandatory)] [string]$Exe,      # path to built exe
  [string]$Repo = "SynK-Soft/synk-free-apps"
)
$ErrorActionPreference = "Stop"
$out = Join-Path $PSScriptRoot "..\dist-release"
New-Item -ItemType Directory -Force $out | Out-Null
$file = "$Name-$Version-win-x64.exe"
$dest = Join-Path $out $file
Copy-Item $Exe $dest -Force
$hash = (Get-FileHash $dest -Algorithm SHA256).Hash.ToLower()
$size = [math]::Round((Get-Item $dest).Length / 1MB, 1)
$date = Get-Date -Format "yyyy-MM-dd"
$tag  = "$App-v$Version"
$url  = "https://github.com/$Repo/releases/download/$tag/$file"
$json = [ordered]@{ app=$Name; version=$Version; date=$date; platform="windows-x64"; url=$url; sha256=$hash;
  notes="https://github.com/$Repo/blob/main/apps/$App/CHANGELOG.md" } | ConvertTo-Json
Set-Content -Path (Join-Path $PSScriptRoot "..\apps\$App\latest.json") -Value $json -Encoding UTF8
Write-Host "File    : $file ($size MB)"
Write-Host "SHA-256 : $hash"
Write-Host "Tag     : $tag"
Write-Host "URL     : $url"
Write-Host "Next    : update README tables + CHANGELOG, commit, create GitHub Release '$tag' and upload $file"
