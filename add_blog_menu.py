import os
import glob

def add_blog_menu():
    files = glob.glob('*.html')
    
    for file in files:
        if file == 'zplus_index.html':
            with open(file, 'r', encoding='utf-8') as f:
                content = f.read()
            
            target = '<a class="text-sm font-medium text-gray-300 hover:text-white transition-colors" href="/contact">Contact</a>'
            replacement = '<a class="text-sm font-medium text-gray-300 hover:text-white transition-colors" href="/blog.html">Blog</a><a class="text-sm font-medium text-gray-300 hover:text-white transition-colors" href="/contact">Contact</a>'
            
            if target in content and 'href="/blog.html">Blog</a>' not in content:
                print(f"Updating zplus_index.html")
                content = content.replace(target, replacement)
                with open(file, 'w', encoding='utf-8') as f:
                    f.write(content)
            continue
            
        with open(file, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Standard menu insertion
        target1 = '''<li class="nav-item">
                                <a class="nav-link" href="cctv-camera-dealers-near-me.html">Contact us</a>
                            </li>'''
        target2 = '''<li class="nav-item">
                                <a class="nav-link" href="cctv-camera-dealers-near-me.html">Contact Us</a>
                            </li>'''
        target3 = '''<li class="nav-item">
                                <a class="nav-link" href="cctv-camera-dealers-near-me.html">Contact us </a>
                            </li>'''
                            
        replacement = '''<li class="nav-item">
                                <a class="nav-link" href="blog.html">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="cctv-camera-dealers-near-me.html">Contact us</a>
                            </li>'''

        if 'href="blog.html">Blog</a>' not in content:
            updated = False
            for t in [target1, target2, target3]:
                if t in content:
                    print(f"Updating {file}")
                    content = content.replace(t, replacement)
                    with open(file, 'w', encoding='utf-8') as f:
                        f.write(content)
                    updated = True
                    break
            
            if not updated:
                print(f"Could not find target in {file}")

if __name__ == "__main__":
    add_blog_menu()
