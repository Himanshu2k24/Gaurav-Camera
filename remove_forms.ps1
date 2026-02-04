$files = Get-ChildItem -Path "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter *.html

$phone = "8046059607"
$replacementHtml = @"
<div class="cta-box">
    <h3>Get a Free Quote Instantly!</h3>
    <div class="cta-buttons">
        <a href="tel:+91$phone" class="btn-call-large">
            <i class="fa fa-phone"></i> Call Now
        </a>
        <a href="https://wa.me/91$phone" class="btn-whatsapp-large" target="_blank">
            <i class="fa fa-whatsapp"></i> WhatsApp
        </a>
    </div>
</div>
"@

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    # Regex to match form tags and their content. 
    # This is tricky with simple regex if forms are complex or nested, but for this clone, standard forms should be matchable.
    # We will look for <form ...> </form>. 
    # Note: Powershell -replace uses regex properly. (?s) enables single-line mode (dot matches newline).
    
    # We'll try to target specific form classes seen in the original file view if generic replace is risky.
    # The original file had `.enquiry-form1` etc. Let's try a generic form replace first, assuming specific sections.
    
    if ($content -match "(?s)<form.*?</form>") {
        Write-Host "  Found form in $($file.Name), replacing..."
        $content = $content -replace "(?s)<form.*?</form>", $replacementHtml
    } else {
        Write-Host "  No form found in $($file.Name)."
    }

    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Form removal complete."
