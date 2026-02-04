$sourceFile = "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone\index.html"
$targetFiles = Get-ChildItem "c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter "*.html" | Where-Object { $_.Name -ne "index.html" }

# 1. Define the NEW Footer Content (Hardcoded from index.html analysis)
# We use a Here-String for the multi-line HTML block.
$newFooter = @"
    <!-- Floating Action Buttons -->
    <a href="https://wa.me/917070905318" class="floating-contact-btn btn-whatsapp" target="_blank">
        <i class="icofont-brand-whatsapp"></i>
    </a>
    <a href="tel:07070905318" class="floating-contact-btn btn-phone">
        <i class="icofont-phone"></i>
    </a>
    <section class="contact-section-dark" id="contact-us">
        <div class="container">
            <div class="row align-items-center">
                <!-- Left Column: Contact Details -->
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <h2>Get in Touch</h2>
                    <p class="lead-text">Secure your property with Gaurav Vision. Contact us for installation,
                        repair, or a free consultation.</p>

                    <div class="row">
                        <div class="col-6 mb-3">
                            <div class="contact-item contact-navy-blue">
                                <div class="contact-icon-circle">
                                    <i class="fa-solid fa-phone"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Call Us</h5>
                                    <a href="tel:07070905318">070709 05318</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-6 mb-3">
                            <div class="contact-item contact-pink">
                                <div class="contact-icon-circle">
                                    <i class="fa-solid fa-envelope"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Email Us</h5>
                                    <a href="mailto:zplussmartvisio@gmail.com">zplussmartvisio@gmail.com</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 mb-3">
                            <div class="contact-item contact-navy-blue">
                                <div class="contact-icon-circle">
                                    <i class="fa-solid fa-location-dot"></i>
                                </div>
                                <div class="contact-details">
                                    <h5>Visit Us</h5>
                                    <p>18, Fraser Rd, Patna University Campus,<br>Patna, Bihar 800001</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="https://wa.me/917070905318" target="_blank" class="whatsapp-btn-green">
                        <i class="fa-brands fa-whatsapp"></i> Chat on WhatsApp
                    </a>
                </div>

                <!-- Right Column: Google Map -->
                <div class="col-lg-6">
                    <div class="map-container-dark">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3597.555776079986!2d85.03366031501799!3d25.61967298369963!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed59aca57d770f%3A0xc3b59363574d6c25!2sZ%20Plus%20Smart%20Vision%20CCTV!5e0!3m2!1sen!2sin!4v1652345678901!5m2!1sen!2sin"
                            allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
                        </iframe>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-12 text-center text-white-50 small">
                    <div class="border-top border-secondary pt-4">
                        &copy; Copyright 2026 Gaurav Vision. All Rights Reserved.
                    </div>
                </div>
            </div>
        </div>
    </section>
"@

foreach ($file in $targetFiles) {
    Write-Host "Processing $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    # Define Pattern: Everything from Floating Buttons to End of Footer
    # Use pattern dependent on what the OLD files look like.
    # Looking at Step 354 log:
    # <!-- Floating Action Buttons --> ... </footer>
    
    $pattern = '(?s)<!-- Floating Action Buttons -->.*?</footer>'

    if ($content -match $pattern) {
        Write-Host "  Found old footer block. Replacing..."
        $content = $content -replace $pattern, $newFooter
        Set-Content -Path $file.FullName -Value $content
    } else {
        Write-Warning "  Could not find old footer block in $($file.Name). Checking for just footer..."
         # Fallback: Try just replacing <footer>...</footer> if floating buttons missing
         $patternFoo = '(?s)<footer.*?</footer>'
         if ($content -match $patternFoo) {
             Write-Host "  Found generic footer. Replacing and appending buttons..."
             $content = $content -replace $patternFoo, $newFooter
             Set-Content -Path $file.FullName -Value $content
         } else {
             Write-Error "  NO FOOTER FOUND in $($file.Name)"
         }
    }
}

Write-Host "Footer Update Complete!"
