$content = Get-Content -Path "index.html" -Raw
$baseUrl = "https://www.maxmilesolutions.com"

# Regular expression to find href and src attributes
$regex = '(href|src)=["'']([^"'']+)["'']'
$matches = [regex]::Matches($content, $regex)

$pages = @()
$assets = @()

foreach ($match in $matches) {
    $url = $match.Groups[2].Value
    
    # Skip empty links, anchors, and javascript:void
    if ([string]::IsNullOrWhiteSpace($url) -or $url.StartsWith("#") -or $url.StartsWith("javascript") -or $url.StartsWith("mailto") -or $url.StartsWith("tel")) {
        continue
    }

    # Normalize URL (handle relative paths)
    if ($url -notmatch "^http") {
       # It's a relative path, keep it as is for now essentially, but we classify it
       $fullUrl = $url # Placeholder logic
    } elseif ($url -match "maxmilesolutions.com") {
        # Internal absolute link
         $fullUrl = $url
    } else {
        # External link - skip
        continue
    }

    # Classification
    if ($url -match "\.php$") {
        if ($pages -notcontains $url) { $pages += $url }
    } elseif ($url -match "\.(css|js|jpg|jpeg|png|gif|ico|svg|woff|woff2|ttf|eot)$") {
        if ($assets -notcontains $url) { $assets += $url }
    } else {
         # Maybe a page without extension or directory, assume page if not obviously an asset
         if ($pages -notcontains $url) { $pages += $url }
    }
}

Write-Host "--- Found Pages ---"
$pages | Sort-Object | Get-Unique | ForEach-Object { Write-Host $_ }

Write-Host "`n--- Found Assets ---"
$assets | Sort-Object | Get-Unique | ForEach-Object { Write-Host $_ }
