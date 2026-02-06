$rootPath = "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone\"
$htmlFiles = Get-ChildItem -Path $rootPath -Filter *.html -Recurse

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $newContent = $content -replace '(?s)<div class="callout-img d-md-flex align-items-center mt-5">.*?Appointment</a>\s*</div>', ''
    
    if ($content.Length -ne $newContent.Length) {
        Write-Host "Updating $($file.Name)"
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8
    }
}
