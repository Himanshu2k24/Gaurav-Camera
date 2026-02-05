$rootPath = "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone"
$indexFile = "$rootPath\index.html"

# 1. Read the source Reviews Section from index.html
$indexContent = Get-Content $indexFile -Raw

# Extract Modern Reviews Section using Regex
# Looking for <!-- Modern Reviews Section Start --> ... <!-- Modern Reviews Section End -->
$reviewsPattern = "(?ms)<!-- Modern Reviews Section Start -->.*?<!-- Modern Reviews Section End -->"
if ($indexContent -match $reviewsPattern) {
    $reviewsSection = $matches[0]
    Write-Host "Successfully extracted Reviews Section from index.html" -ForegroundColor Green
} else {
    Write-Error "Could not find 'Modern Reviews Section' in index.html"
    Exit
}

# 2. Iterate through all HTML files
$files = Get-ChildItem -Path $rootPath -Filter *.html -Recurse

foreach ($file in $files) {
    if ($file.Name -eq "index.html") { continue } # Skip index.html itself

    Write-Host "Processing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    $modified = $false

    # --- A. Inject Modern Reviews Section ---
    # Check if we already have it to avoid duplicates
    if ($content -notmatch "<!-- Modern Reviews Section Start -->") {
        # Insert before </main>
        if ($content -match "</main>") {
            $content = $content -replace "</main>", "$reviewsSection`n    </main>"
            $modified = $true
            Write-Host "  - Added Reviews Section" -ForegroundColor Cyan
        } else {
            Write-Warning "  - No </main> tag found in $($file.Name)"
        }
    }

    # --- B. Inject Scripts ---
    # Check for the actual script tag to avoid matching comments
    if ($content -notmatch "<script[^>]+src=[`"']js/load_reviews.js[`"']") {
        # Insert before </body> or at end
        $scriptsBlock = "`n    <!-- Scripts -->`n    <script src=`"js/reviews_data.js`"></script>`n    <script src=`"js/load_reviews.js`"></script>`n"
        
        if ($content -match "</body>") {
            $content = $content -replace "</body>", "$scriptsBlock`n</body>"
            $modified = $true
            Write-Host "  - Added JS Scripts" -ForegroundColor Cyan
        }
    }

    # --- C. Ensure CSS Modern Overrides ---
    if ($content -notmatch "css/modern_overrides.css") {
        # Insert before </head>
        $cssLink = "`n    <!-- Modern Overrides -->`n    <link href=`"css/modern_overrides.css`" rel=`"stylesheet`">"
        if ($content -match "</head>") {
            $content = $content -replace "</head>", "$cssLink`n</head>"
            $modified = $true
            Write-Host "  - Added CSS Link" -ForegroundColor Cyan
        }
    }

    # --- D. Remove Old Contact Widgets ---
    # Pattern to find the specific "Contact Address Start" block
    # We'll use a fairly broad match for the widget-wrap within the top section
    # Based on the user's files, it looks like: <!-- Contact Address Start --> ... <!-- Contact Call End -->
    
    # We can try to match the specific container. 
    # Example snippet: <div class="widget-wrap mb-0"> ... </div>
    # But simply removing the whole <section class="wide-tb-100"> that contains it might be safer if that section ONLY contains contacts.
    # Looking at file view: Main Body Content Start -> <section class="wide-tb-100"> -> container -> row -> col-md-4 (Address) ... col-md-4 (Email) ... col-md-4 (Call)
    
    # Let's try to remove: <div class="widget-wrap mb-0">...</div>
    # Or better yet, check if the section matches the "old styled" contact bar.
    
    # Regex for the old top contact bar container
    $oldContactBarPattern = "(?ms)<section class=`"wide-tb-100`">\s*<div class=`"container`">\s*<div class=`"row`">\s*<div class=`"col-md-4`">\s*<!-- Contact Address Start -->.*?<!-- Contact Call End -->\s*</div>\s*</div>\s*</div>\s*</section>"
    
    if ($content -match $oldContactBarPattern) {
        $content = $content -replace $oldContactBarPattern, "<!-- Old Contact Bar Removed -->"
        $modified = $true
        Write-Host "  - Removed Old Contact Bar" -ForegroundColor Magenta
    } elseif ($content -match "<!-- Contact Address Start -->") {
         # Fallback: simpler regex if the exact structure differs slightly
         # Just comment out the specific widgets if the structure is complex
         # But usually better to leave it than break HTML structure.
         Write-Warning "  - Found old contact markers but couldn't safely remove entire section with exact match."
    }

    if ($modified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  => Saved changes to $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "  => No changes needed for $($file.Name)" -ForegroundColor DarkGray
    }
}

Write-Host "Done!"
