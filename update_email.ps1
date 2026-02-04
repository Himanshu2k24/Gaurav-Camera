$targetFiles = Get-ChildItem "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Include "*.html", "*.ps1" -Recurse
$oldEmail = "Gauravcctvpatna@gmail.com"
$newEmail = "Gauravcctvpatna@gmail.com"

foreach ($file in $targetFiles) {
    $content = Get-Content $file.FullName -Raw
    if ($content -match $oldEmail) {
        Write-Host "Updating email in $($file.Name)..."
        $content = $content -replace [regex]::Escape($oldEmail), $newEmail
        Set-Content -Path $file.FullName -Value $content
    }
}

Write-Host "Email Update Complete!"

