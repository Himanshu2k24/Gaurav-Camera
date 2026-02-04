$files = Get-ChildItem -Path "C:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone" -Filter *.html

$oldBrand = "Maxmile Tech Solution Pvt Ltd"
$oldBrand2 = "Maxmile Solutions"
$oldBrand3 = "Maxmile"
$newBrand = "Gaurav CCTV Camera"

$oldPhone = "8877449958"
$newPhone = "8046059607"

$oldEmail = "support@maxmilesolutions.com"
$oldEmail2 = "anupam8700@gmail.com"
$newEmail = "contact@gauravcctv.com"

# Regex for broad address matching logic is hard, so we'll target specific chunks if possible, 
# or just general text replacement.
$newAddress = "Patna Kumar, Patna - 800002"

foreach ($file in $files) {
    Write-Host "Updating content in $($file.Name)..."
    $content = Get-Content $file.FullName -Raw

    # Replace Brand Names
    $content = $content -replace "Maxmile Tech Solution Pvt Ltd", $newBrand
    $content = $content -replace "Maxmile Solutions", $newBrand
    $content = $content -replace "Maxmile", "Gaurav CCTV" # Fallback

    # Replace Phone
    $content = $content -replace $oldPhone, $newPhone
    # Also replace spaces variation if any
    $content = $content -replace "887744 9958", $newPhone

    # Replace Email
    $content = $content -replace $oldEmail, $newEmail
    $content = $content -replace $oldEmail2, $newEmail
    
    # Replace Address (Specific strings found in previous view_file)
    $content = $content -replace "B-19, Behind Lohia Park,", "Patna Kumar,"
    $content = $content -replace "P.C. Colony Kankarbagh, Patna-800 020 \(Bihar\)", "Patna - 800002 (Bihar)"

    # Update Links
    $content = $content -replace "wa.me/$oldPhone", "wa.me/91$newPhone"
    $content = $content -replace "tel:\+91$oldPhone", "tel:+91$newPhone"
    $content = $content -replace "tel:$oldPhone", "tel:+91$newPhone"
    
     # Fix "Call Office" small print if present
    
    Set-Content -Path $file.FullName -Value $content
}
Write-Host "Content verification update complete."
