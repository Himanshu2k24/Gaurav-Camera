$baseUrl = "https://www.maxmilesolutions.com/css"
$outputDir = "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone\css"

$cssFiles = @(
    "bootstrap.min.css",
    "animate.min.css",
    "icofont.min.css",
    "owl.carousel.min.css",
    "cubeportfolio.min.css",
    "bootstrap-dropdownhover.min.css",
    "shortcodes.css",
    "style.css",
    "responsive.css"
)

function Download-File {
    param ($fileName)
    $url = "$baseUrl/$fileName"
    $localPath = Join-Path $outputDir $fileName
    
    Write-Host "Downloading $fileName..."
    try {
        $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
        curl.exe -A $userAgent -L $url -o $localPath --fail
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Failed to download $fileName" -ForegroundColor Red
        } else {
             Write-Host "Success." -ForegroundColor Green
        }
    } catch {
        Write-Host "Error: $_" -ForegroundColor Red
    }
}

foreach ($file in $cssFiles) {
    Download-File -fileName $file
}
