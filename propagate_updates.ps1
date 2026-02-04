$sourceFile = "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone\index.html"
$targetFiles = Get-ChildItem "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter "*.html" | Where-Object { $_.Name -ne "index.html" }

# Read Source Content
$indexContent = Get-Content $sourceFile -Raw

# Extract Full Header Section (<header>...</header>)
if ($indexContent -match '(?s)<header>.*?</header>') {
    $headerSection = $matches[0]
} else {
    Write-Error "Could not find header section in index.html"
    exit
}

foreach ($file in $targetFiles) {
    Write-Host "Updating $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    # Replace Full Header
    if ($content -match '(?s)<header>.*?</header>') {
        $content = $content -replace '(?s)<header>.*?</header>', $headerSection
        Set-Content -Path $file.FullName -Value $content
    } else {
        Write-Warning "Could not find <header> block in $($file.Name)"
    }
}

Write-Host "Header Propagation Complete!"
