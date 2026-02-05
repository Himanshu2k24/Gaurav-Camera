$rootPath = "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone"
$files = Get-ChildItem -Path $rootPath -Filter *.html -Recurse

$iconLinks = @"
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/icofont/1.0.0/css/icofont.min.css">
"@

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    $modified = $false

    # Check if FontAwesome 6 is missing
    if ($content -notmatch "font-awesome/6.5.1") {
        # Check if IcoFont is also likely missing or just inject both block if we find the anchor point
        
        # Look for css/base.css to inject after
        if ($content -match "css/base.css.*?>") {
            # Replace css/base.css line with itself + icon links
            # We use regex to match the full tag
            $content = $content -replace "(<link href=`"css/base.css`" rel=`"stylesheet`">)", "`$1`n$iconLinks"
            $modified = $true
            Write-Host "Injected icons into $($file.Name)" -ForegroundColor Green
        } else {
            Write-Warning "Could not find css/base.css anchor in $($file.Name)"
        }
    } else {
        Write-Host "Icons already present in $($file.Name)" -ForegroundColor DarkGray
    }

    if ($modified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    }
}
