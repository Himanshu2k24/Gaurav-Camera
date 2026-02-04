$files = Get-ChildItem -Path "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter *.html

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    
    # Remove the specific preloader block
    if ($content -match '(?s)<div id="pageloader">.*?</div>') {
        Write-Host "Removing preloader from $($file.Name)..."
        $content = $content -replace '(?s)<div id="pageloader">.*?</div>', '<!-- Page loader Removed -->'
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Done."
    }
}
