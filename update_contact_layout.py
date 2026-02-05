import os
import re

def update_html_files(directory):
    html_files = [f for f in os.listdir(directory) if f.endswith('.html')]
    
    for filename in html_files:
        filepath = os.path.join(directory, filename)
        
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Find the contact section by ID and limited scope to avoid changing other rows
            # Strategy: Look for the specific structure of the contact items inside the contact-section
            
            new_content = content
            
            # Regex to find the columns in the contact section and change col-6 to col-12
            # We target the specific div structure found in the contact section
            
            # Pattern 1: Call Us col-6
            pattern1 = r'(<div class="col-6 mb-3">)(\s*<div class="contact-item)'
            replacement1 = r'<div class="col-12 mb-3">\2'
            
            # Pattern 2: Email Us col-6
            # It's the same pattern, but verify if we need specific context
            
            if 'class="contact-section-dark"' in content or 'id="contact-us"' in content:
                 # Check if the file has the contact section
                 
                 # Replace only within the contact section if possible, but global replace 
                 # for "col-6 mb-3" followed by "contact-item" is likely safe as "contact-item" is specific.
                 
                 new_content = re.sub(pattern1, replacement1, content)
                 
                 if new_content != content:
                     print(f"Updating {filename}")
                     with open(filepath, 'w', encoding='utf-8') as f:
                         f.write(new_content)
                 else:
                     print(f"No changes needed for {filename}")
            else:
                print(f"Skipping {filename} (No contact section found)")
                
        except Exception as e:
            print(f"Error processing {filename}: {e}")

if __name__ == "__main__":
    update_html_files(r"c:\Users\Himanshu\Desktop\Copy\maxmilesolutions_clone")
