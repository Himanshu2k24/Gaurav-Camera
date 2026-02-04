$baseUrl = "https://www.maxmilesolutions.com"
$outputDir = "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone"

# List of pages to download
$pages = @(
    "cctv-camera-dealer-in-patna-bihar.php",
    "cctv-camera-dealers-in-patna.php",
    "cctv-camera-dealers-near-me.php",
    "cctv-camera-installation-in-patna.php",
    "cctv-camera-installation-near-me.php",
    "cctv-camera-shop-in-patna.php",
    "cctv-camera-shop-near-me.php",
    "index.php"
)

# List of assets to download
$assets = @(
    "css/base.css",
    "images/best-cctv-dealer-in-patna.jpg",
    "images/blog/cctv-camera-installation-in-patna.jpg",
    "images/blog/cctv-camera-maintenance-in-patna.jpg",
    "images/blog/cctv-camera-sales-service-patna.jpg",
    "images/cctv-camera-clients.jpg",
    "images/cctv-camera-dealer-near-me.jpg",
    "images/cctv-camera-in-patna.jpg",
    "images/cctv-camera-installation-patna.jpg",
    "images/cctv-camera-shop-near-me.jpg",
    "images/cctv-dealers-in-patna.jpg",
    "images/cctv-distrubutor-in-patna.jpg",
    "images/cctv-installation.jpg",
    "images/client-camera-cctv.jpg",
    "images/clients-cctv-camera.jpg",
    "images/clients-cctv-camera-dealer.jpg",
    "images/client-shop-cctv-patna.jpg",
    "images/clients-maxmile-patna.jpg",
    "images/LOGGO1.png",
    "images/logo1.png",
    "images/partners/ashok.png",
    "images/partners/bal.png",
    "images/partners/hi-tech.png",
    "images/partners/nero.png",
    "images/partners/sarla.png",
    "images/partners/speed.png",
    "images/partners/uber.png",
    "images/shop/bullet-cctv.jpg",
    "images/shop/c-mount-cctv.jpg",
    "images/shop/day-night-cctv.jpg",
    "images/shop/demo-cctv.jpg",
    "images/shop/hd-cctv.jpg",
    "images/shop/network-ip-cctv.jpg",
    "images/shop/ptz-cctv.jpg",
    "images/shop/wireless-cctv.jpg",
    "images/team/favicon.ico",
    "js/bootstrap.min.js",
    "js/bootstrap-dropdownhover.min.js",
    "js/jquery.appear.js",
    "js/jquery.counterup.min.js",
    "js/jquery.easing.min.js",
    "js/jquery.easypiechart.min.js",
    "js/jquery.validate.min.js",
    "js/jquery.waypoints.min.js",
    "js/jquery-min.js",
    "js/library-script.js",
    "js/owl.carousel.min.js",
    "js/popper.min.js",
    "js/site-custom.js",
    "rev-slider/revolution/css/layers.css",
    "rev-slider/revolution/css/navigation.css",
    "rev-slider/revolution/css/settings.css",
    "rev-slider/revolution/fonts/font-awesome/css/font-awesome.css",
    "rev-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css",
    "rev-slider/revolution/js/extensions/revolution.extension.actions.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.carousel.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.kenburn.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.layeranimation.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.navigation.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.parallax.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.slideanims.min.js",
    "rev-slider/revolution/js/extensions/revolution.extension.video.min.js",
    "rev-slider/revolution/js/jquery.themepunch.revolution.min.js",
    "rev-slider/revolution/js/jquery.themepunch.tools.min.js"
)

$downloadError = 0

function Download-File {
    param ($urlPath, $isPage)
    
    $fullUrl = "$baseUrl/$urlPath"
    if ($isPage) {
        # For pages, we change extension to .html
        $localPath = Join-Path $outputDir ($urlPath -replace "\.php$", ".html")
    } else {
        $localPath = Join-Path $outputDir $urlPath
    }

    $dir = Split-Path $localPath
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }

    Write-Host "Downloading $urlPath..."
    try {
        # Use curl because Invoke-WebRequest can be slow/problematic with some configs
        # mimicking browser user agent
        $userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
        curl.exe -A $userAgent -L $fullUrl -o $localPath --create-dirs --fail
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Error downloading $fullUrl (Exit Code: $LASTEXITCODE)" -ForegroundColor Red
            return $false
        }
        return $true
    } catch {
        Write-Host "Exception downloading $fullUrl : $_" -ForegroundColor Red
        return $false
    }
}

# Download Assets
foreach ($asset in $assets) {
    Download-File -urlPath $asset -isPage $false
}

# Download Pages
foreach ($page in $pages) {
    if ($page -eq "index.php") {
        # saving as index.html
        Download-File -urlPath "index.php" -isPage $true
    } else {
        Download-File -urlPath $page -isPage $true
    }
}

# Post-processing: specific replacements for local viewing
Write-Host "Updating links in HTML files..."
$htmlFiles = Get-ChildItem -Path $outputDir -Filter *.html

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Replace .php links with .html
    $content = $content -replace 'href="([^"]+)\.php"', 'href="$1.html"'
    
    # Ensure index.php becomes index.html specifically if missed by generalized regex or absolute paths
    $content = $content -replace 'index.php', 'index.html'

    Set-Content -Path $file.FullName -Value $content
}

Write-Host "Clone process completed."
