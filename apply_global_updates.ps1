Get-ChildItem -Path "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Include *.html,*.js -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace 'Gauravcctvpatna@gmail.com', 'gauravcctv.in@gmail.com'
    $newContent = $newContent -replace '8046059607', '7070905318'
    
    # Also handle the generated popup HTML if it was hardcoded differently or missed
    # (Though I already handled it in custom_features.js, this is a safety net for any other occurrences)

    if ($content -ne $newContent) {
        Set-Content $_.FullName $newContent -Encoding UTF8
        Write-Host "Updated $($_.Name)"
    }
}
