$files = Get-ChildItem ./sql/
Remove-Item -Recurse -Force md 2> $null
mkdir md | Out-Null
foreach ($file in $files) {
    $dest = Join-Path ./md "$($file.Name).md"
    Set-Content -Path $dest -Value "``````plsql`
"
    Add-Content -Path $dest -Value (Get-Content $file)
    Add-Content -Path $dest -Value "/`
``````"
}