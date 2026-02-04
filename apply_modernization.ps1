$files = Get-ChildItem -Path "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter *.html

$legacyStyleStart = '<style>'
$legacyStyleEnd = '</style>'
$legacyStyleContentMatch = 'enquiry-form1' # Unique string in the legacy style block

$legacyButtonsStart = '<div class="enquiry-form2">'
$legacyButtonsEnd = '</div>' # The second div end
$legacyButtonsContentMatch = 'enquiry-form1'

$newCssLink = '    <!-- Modern Overrides -->
    <link href="css/modern_overrides.css" rel="stylesheet">'

$newButtons = '    <!-- Floating Action Buttons -->
    <a href="https://wa.me/918877449958" class="floating-contact-btn btn-whatsapp" target="_blank">
        <i class="icofont-brand-whatsapp"></i>
    </a>
    <a href="tel:+918877449958" class="floating-contact-btn btn-phone">
        <i class="icofont-phone"></i>
    </a>'

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    # 1. Inject CSS Link if not present
    if ($content -notmatch "modern_overrides.css") {
        # Insert before </head>
        if ($content -match "</head>") {
             $content = $content -replace "</head>", "$newCssLink`n</head>"
             Write-Host "  - Injected CSS link."
        }
    }

    # 2. Remove Legacy Inline Style Block
    # We'll use a regex to find the style block containing 'enquiry-form1'
    # Note: Regex parsing HTML is fragile, but sufficient for this consistent structure
    $styleRegex = '(?s)<style>.*?enquiry-form1.*?</style>'
    if ($content -match $styleRegex) {
        $content = $content -replace $styleRegex, ""
        Write-Host "  - Removed legacy inline styles."
    }

    # 3. Replace Legacy Buttons
    # The legacy structure involves two divs. We'll try to match the broad structure.
    # Pattern: <div class="enquiry-form2">...</div>...<div class="enquiry-form1">...</div>
    $buttonRegex = '(?s)<div class="enquiry-form2">.*?<div class="enquiry-form1">.*?</div>\s*</div>'
    
    # Simple check first
    if ($content -match 'class="enquiry-form2"') {
         # Attempt regex replacement
         # Note: The '</div>' in the regex above might catch the first closing div if not careful.
         # Let's be more specific or aggressive with identifying the block.
         
         # Alternative: Removing specific chunks if regex is too risky.
         # But the cloned files are likely identical in structure. 
         # Let's try to match the container of the buttons if possible, or just the specific components.
         
         # Let's use a simpler approach: Remove the known legacy blocks by exact string matching if possible, 
         # or use the regex with non-greedy matching.
         
         $content = $content -replace '(?s)<div class="enquiry-form2">.*?</div>\s*<div class="enquiry-form1">.*?</div>', $newButtons
         Write-Host "  - Replaced legacy buttons."
    } elseif ($content -match 'class="floating-contact-btn"') {
       # Already has new buttons
    } else {
        # If we can't find old buttons but want to ensure new ones are there (e.g. at bottom of body)
        # For now, only replace if old ones exist to avoid duplication.
    }

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "All files processed."
