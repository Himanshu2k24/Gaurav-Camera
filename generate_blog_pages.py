import os
import random

def read_template():
    with open('index.html', 'r', encoding='utf-8') as f:
        content = f.read()
    
    header_end = content.find('<!-- Hero Section Start -->')
    footer_start = content.find('<!-- Floating Action Buttons -->')
    
    header = content[:header_end]
    footer = content[footer_start:]
    return header, footer

def create_blog_index(header, footer, posts):
    hero_section = """
    <!-- Hero Section Start -->
    <section class="hero-section" style="padding: 120px 0 80px; background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); text-align: center; color: white;">
        <div class="container">
            <span class="hero-badge" style="background: rgba(255,255,255,0.1); padding: 5px 15px; border-radius: 20px; font-size: 14px; margin-bottom: 20px; display: inline-block;">Latest Insights</span>
            <h1 class="hero-title" style="font-size: 3rem; font-weight: bold; margin-bottom: 15px;">Security <span class="text-blue" style="color: #00d2ff;">Blog</span></h1>
            <p class="hero-highlights" style="font-size: 1.1rem; opacity: 0.9; max-width: 600px; margin: 0 auto;">
                Discover the benefits of CCTV cameras, expert tips, and the latest trends in security to keep your property safe.
            </p>
        </div>
    </section>
    <!-- Hero Section End -->
"""

    main_start = """
    <main id="body-content">
        <section class="wide-tb-100 bg-light-gray" style="padding: 80px 0;">
            <div class="container">
                <div class="row">
"""
    
    posts_html = ""
    for post in posts:
        posts_html += f"""
                    <div class="col-md-4 col-sm-6 mb-4">
                        <div class="blog-card" style="background: white; border-radius: 10px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.05); transition: transform 0.3s ease; height: 100%; display: flex; flex-direction: column;">
                            <div class="blog-img" style="height: 200px; background-image: url('images/gallery/{post['img']}'); background-size: cover; background-position: center; background-repeat: no-repeat; background-color: #eee;"></div>
                            <div class="blog-content" style="padding: 25px; flex-grow: 1; display: flex; flex-direction: column;">
                                <span style="color: #00d2ff; font-size: 13px; font-weight: 600; text-transform: uppercase;">Benefit #{post['id']}</span>
                                <h3 style="font-size: 1.25rem; font-weight: bold; margin: 10px 0 15px; color: #333;">{post['title']}</h3>
                                <p style="color: #777; font-size: 15px; line-height: 1.6; flex-grow: 1;">{post['excerpt']}...</p>
                                <a href="blog-post-{post['id']}.html" style="display: inline-block; margin-top: 15px; padding: 10px 20px; background: #00d2ff; color: white; border-radius: 5px; font-weight: 600; text-decoration: none; align-self: flex-start; transition: background 0.3s;">Read More</a>
                            </div>
                        </div>
                    </div>
"""

    main_end = """
                </div>
            </div>
        </section>
    </main>
"""
    
    extra_css = """
    <style>
        .blog-card:hover { transform: translateY(-10px); }
        .blog-card a:hover { background: #0099cc !important; }
        .quote-box {
            background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            border-left: 5px solid #00d2ff;
            padding: 25px;
            margin: 30px 0;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            font-style: italic;
            font-size: 1.2rem;
            color: #444;
            position: relative;
        }
        .quote-box::before {
            content: '\\201C';
            font-size: 4rem;
            color: rgba(0, 210, 255, 0.2);
            position: absolute;
            top: -10px;
            left: 10px;
            font-family: Georgia, serif;
        }
        .seo-tags {
            margin-top: 40px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 0.9rem;
            color: #666;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .seo-tag {
            background: #e9ecef;
            padding: 5px 12px;
            border-radius: 20px;
        }
    </style>
"""

    full_html = header + extra_css + hero_section + main_start + posts_html + main_end + footer
    with open('blog.html', 'w', encoding='utf-8') as f:
        f.write(full_html)
    print("Created blog.html")

def create_blog_posts(header, footer, posts):
    extra_css = """
    <style>
        .quote-box {
            background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            border-left: 5px solid #00d2ff;
            padding: 25px;
            margin: 30px 0;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            font-style: italic;
            font-size: 1.2rem;
            color: #444;
            position: relative;
        }
        .quote-box::before {
            content: '\\201C';
            font-size: 4rem;
            color: rgba(0, 210, 255, 0.2);
            position: absolute;
            top: -10px;
            left: 10px;
            font-family: Georgia, serif;
        }
        .seo-tags {
            margin-top: 40px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 0.9rem;
            color: #666;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .seo-tag {
            background: #e9ecef;
            padding: 5px 12px;
            border-radius: 20px;
        }
    </style>
"""

    for post in posts:
        hero_section = f"""
    <!-- Hero Section Start -->
    <section class="hero-section" style="padding: 120px 0 80px; background: linear-gradient(rgba(15, 32, 39, 0.8), rgba(32, 58, 67, 0.9)), url('images/gallery/{post['img']}') center/cover; text-align: center; color: white;">
        <div class="container">
            <span class="hero-badge" style="background: #00d2ff; color: #fff; padding: 5px 15px; border-radius: 20px; font-size: 14px; margin-bottom: 20px; display: inline-block;">Security Update</span>
            <h1 class="hero-title" style="font-size: 3rem; font-weight: bold; margin-bottom: 15px;">{post['title']}</h1>
        </div>
    </section>
    <!-- Hero Section End -->
"""

        tags_html = "".join([f"<span class='seo-tag'>{tag}</span>" for tag in post['tags']])

        main_content = f"""
    <main id="body-content">
        <section class="wide-tb-100" style="padding: 80px 0; background-color: #fcfcfc;">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="post-content" style="background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 40px rgba(0,0,0,0.03);">
                            
                            <img src="images/gallery/{post['img']}" alt="{post['title']}" style="width: 100%; border-radius: 8px; margin-bottom: 30px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">

                            <div style="font-size: 18px; line-height: 1.8; color: #444; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                                {post['content']}
                            </div>
                            
                            <div class="quote-box">
                                "{post['quote']}"
                            </div>

                            <div class="seo-tags">
                                {tags_html}
                            </div>

                            <div style="margin-top: 40px; padding-top: 20px; border-top: 1px solid #eee; display: flex; justify-content: space-between; align-items: center;">
                                <a href="blog.html" style="display: inline-block; padding: 10px 20px; border: 2px solid #00d2ff; color: #00d2ff; font-weight: 600; border-radius: 5px; text-decoration: none; transition: all 0.3s;">
                                    &larr; Back to Blog
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
"""
        full_html = header + extra_css + hero_section + main_content + footer
        full_html = full_html.replace("<title>CCTV Camera Dealer", f"<title>{post['title']} | Best CCTV Camera in Patna")
        
        with open(f"blog-post-{post['id']}.html", 'w', encoding='utf-8') as f:
            f.write(full_html)
        print(f"Created blog-post-{post['id']}.html")


posts = [
    {
        "id": 1,
        "title": "Deterring Crime with Visible Cameras in Patna",
        "excerpt": "Discover how installing CCTV cameras can deter potential criminals and secure your property.",
        "img": "blog1_ai.png",
        "tags": ["CCTV camera Patna", "Best CCTV camera in Patna", "Buy CCTV camera in Patna", "CCTV dealer in Patliputra Patna"],
        "quote": "सुरक्षा में ही समझदारी है, आज ही लगवायें CCTV कैमरे। अपनी संपत्ति और अपनों की हिफाजत सुनिश्चित करें।",
        "content": "<p>One of the most immediate and impactful benefits of installing <strong>CCTV camera Patna</strong> is their ability to deter potential criminals. When burglars or vandals see that a property is equipped with a highly visible surveillance system, they are far less likely to target it. Choosing the <strong>Best CCTV camera in Patna</strong> for your home or business acts as a powerful psychological barrier against malicious activities.</p><h2>Top CCTV Dealer in Patliputra Patna</h2><p>Security experts consistently point out that properties without security systems are significantly more likely to be broken into. A camera signals that the area is continuously monitored and any illegal activity will be recorded. This is why many people look to <strong>Buy CCTV camera in Patna</strong> from a reliable <strong>CCTV dealer in Patliputra Patna</strong>. It alone is often enough to make criminals think twice.</p><p>In commercial settings in Patna, the deterrence factor discourages internal theft and inappropriate behavior among employees. Whether it’s a dome camera in a retail store or an outdoor surveillance unit, having the right setup protects your assets. By investing in visible CCTV cameras from a top provider, you proactively secure your peace of mind and prevent crimes before they happen.</p>"
    },
    {
        "id": 2,
        "title": "Monitoring Activities and Scenarios: Expert CCTV Setup",
        "excerpt": "Real-time monitoring gives you total visibility of your premises, no matter where you are.",
        "img": "blog2_ai.png",
        "tags": ["CCTV installation Patna", "CCTV camera installation in Patna", "CCTV camera setup service Patna", "CCTV installation in Kankarbagh"],
        "quote": "तीसरी आँख से रखें हर पल पर नज़र। क्योंकि आपकी सुरक्षा से बड़ा कुछ भी नहीं।",
        "content": "<p>Professional <strong>CCTV installation Patna</strong> allows you to monitor activities in real-time, giving you total visibility of your premises at any given moment. This continuous monitoring capability is invaluable for both residential and commercial property owners. For top-tier safety, looking into expert <strong>CCTV camera installation in Patna</strong> is essential.</p><h2>Reliable CCTV Camera Setup Service Patna</h2><p>With a comprehensive <strong>CCTV camera setup service Patna</strong>, you can access live video feeds directly from your smartphone. Homeowners can check in on their property while at work, ensuring children have arrived safely or monitoring service providers. Getting swift <strong>CCTV installation in Kankarbagh</strong> or nearby areas means you can respond to unusual activities within seconds, dramatically enhancing your oversight.</p><p>For businesses in Patna, activity monitoring is crucial for operational efficiency. Business owners can oversee daily operations, monitor customer flow, and ensure safety protocols are followed. In the event of an emergency, having real-time video access changes property management from reactive to highly proactive, guaranteeing that your environment is safe and secure at all times.</p>"
    },
    {
        "id": 3,
        "title": "Gathering Crucial Evidence with Reliable Security Cameras",
        "excerpt": "CCTV footage provides crucial evidence for law enforcement and dispute resolution.",
        "img": "blog3_ai.png",
        "tags": ["CCTV dealer Patna", "CCTV installation company Patna", "Best CCTV dealer near me Patna", "CCTV camera in Bailey Road Patna"],
        "quote": "सच कभी छुपता नहीं, कैमरे की नज़र से कोई बचता नहीं। अपनाएं पुख्ता सुरक्षा व्यवस्था।",
        "content": "<p>Despite our best deterrence efforts, crimes can still occur. When they do, finding a reliable <strong>CCTV dealer Patna</strong> ensures you have high-quality equipment to record crucial evidence. A reputable <strong>CCTV installation company Patna</strong> will set up cameras that capture crystal-clear images, vital for law enforcement and judicial proceedings.</p><h2>Search for the Best CCTV Dealer Near Me Patna</h2><p>When searching for the <strong>Best CCTV dealer near me Patna</strong>, you are securing a system that acts as an unblinking witness. If an incident happens at your property, having a <strong>CCTV camera in Bailey Road Patna</strong> or any key location provides undeniable recorded evidence. Police rely heavily on video surveillance to identify suspects and understand timelines, making it much more reliable than subjective eyewitness testimonies.</p><p>Beyond criminal activities, clear CCTV evidence is remarkably useful in resolving civil disputes like slip-and-falls or employee disagreements. Reviewing the footage provides an objective account, protecting owners from false claims and expensive lawsuits. Trusting the top dealers in Patna ensures that your factual evidence is safely stored and ready whenever needed.</p>"
    },
    {
        "id": 4,
        "title": "Decision Making in Disputes: Indoor & Outdoor Solutions",
        "excerpt": "Video footage is an objective witness that helps greatly in making fair decisions.",
        "img": "blog4_ai.png",
        "tags": ["Security camera Patna", "CCTV camera shop in Patna", "Low price CCTV camera Patna", "CCTV installation in Boring Road Patna"],
        "quote": "विवादों से बचने का एक ही उपाय, हर कोने पर हो कैमरे की नज़र। सही निर्णय के लिए अचूक प्रमाण।",
        "content": "<p>Having a dependable <strong>Security camera Patna</strong> serves as an objective, unbiased witness during disputes. In bustling environments like offices or retail stores, conflicts can arise. Visiting a trusted <strong>CCTV camera shop in Patna</strong> ensures you have the right equipment to handle these situations without relying on hearsay.</p><h2>Find Low price CCTV camera Patna</h2><p>Even a <strong>Low price CCTV camera Patna</strong> setup can provide a clear, unmistakable record of an event. For instance, if a customer complains about poor service, reviewing the footage can quickly verify the truth. For those needing a specialized setup, scheduling a <strong>CCTV installation in Boring Road Patna</strong> provides targeted surveillance tailored to high-traffic commercial or residential needs.</p><p>This application of CCTV goes far beyond simple security; it is a vital tool for maintaining a harmonious environment. By relying on concrete video evidence, managers can address HR issues accurately, avoid legal disputes, and protect their reputation. Ultimately, security cameras empower leaders to make swift, just, and confident decisions based entirely on factual recordings.</p>"
    },
    {
        "id": 5,
        "title": "Continuous Workflow Tracking for Homes and Offices",
        "excerpt": "Keeping a continuous record of activity is essential to track workflow and productivity.",
        "img": "blog5_ai.png",
        "tags": ["CCTV shop Patna", "CCTV camera service in Patna", "Hikvision CCTV dealer Patna", "CCTV installation in Rajendra Nagar Patna"],
        "quote": "आपके व्यापार और घर की निगरानी, अब बिना किसी परेशानी। हर पल का पक्का हिसाब।",
        "content": "<p>Keeping a continuous record of activity is essential for businesses to track long-term patterns and workflow. By visiting a premier <strong>CCTV shop Patna</strong>, you can equip your premises with advanced NVR or DVR systems. Consistent <strong>CCTV camera service in Patna</strong> guarantees that your historical archive acts as a comprehensive diary of your daily operations.</p><h2>Top Hikvision CCTV dealer Patna</h2><p>Working with an authorized <strong>Hikvision CCTV dealer Patna</strong> ensures you get high-capacity storage solutions capable of keeping weeks of high-definition footage. For strategic tracking, specific deployments like a <strong>CCTV installation in Rajendra Nagar Patna</strong> provide localized oversight that helps managers identify bottlenecks, analyze customer foot traffic, and verify opening procedures.</p><p>For residential users, continuous recording means you never miss an event. If you discover a missing package days later, reliable storage allows you to scrub through the footage effortlessly. Regular service and quality cameras allow you to build a dependable safety net of historical data, optimizing both productivity and security simultaneously.</p>"
    },
    {
        "id": 6,
        "title": "Reduced Insurance Premiums with Authorized Brands",
        "excerpt": "A reliable surveillance system can lower your property insurance significantly.",
        "img": "blog6_ai.png",
        "tags": ["CCTV service Patna", "CCTV installation near me Patna", "Dahua CCTV dealer Patna", "CCTV camera shop in Patna City"],
        "quote": "सुरक्षा पर खर्च नहीं, निवेश है। सुरक्षित घर मतलब तनाव-मुक्त जीवन।",
        "content": "<p>An often-overlooked financial benefit of professional <strong>CCTV service Patna</strong> is the potential for reduced insurance premiums. When you take proactive steps to secure your property by searching for <strong>CCTV installation near me Patna</strong>, you significantly lower the risk profile of your estate in the eyes of insurance providers.</p><h2>Trusted Dahua CCTV dealer Patna</h2><p>By opting for high-quality gear from a <strong>Dahua CCTV dealer Patna</strong>, you demonstrate to insurers that your property is robustly protected against theft and vandalism. Finding the right <strong>CCTV camera shop in Patna City</strong> ensures you have top-of-the-line equipment that active mitigates liability risks like slip-and-falls or fraudulent claims.</p><p>Many insurance companies offer pronounced discounts to businesses and homes equipped with verified surveillance solutions. Over time, these monthly or annual savings can partially or entirely offset the initial cost of installing the security system. It is a smart financial decision where your protective measures effectively pay for themselves through reduced premiums and improved safety.</p>"
    },
    {
        "id": 7,
        "title": "Unbeatable Peace of Mind for Patna Residents",
        "excerpt": "Knowing your property is under constant watch provides unbeatable peace of mind.",
        "img": "blog7_ai.png",
        "tags": ["CCTV installation service Patna", "CCTV camera dealer in Patna", "CCTV maintenance service Patna", "CCTV camera for home Patna"],
        "quote": "अपनों की सुरक्षा, आपकी सबसे बड़ी ज़िम्मेदारी। बेहतरीन CCTV से पाएं सुकून की नींद।",
        "content": "<p>Ultimately, the most profound benefit of a top-tier <strong>CCTV installation service Patna</strong> is peace of mind. Knowing your property is monitored by gear from a reputable <strong>CCTV camera dealer in Patna</strong> provides unbeatable security for your family and staff, allowing you to focus on what matters most in your daily life.</p><h2>Expert CCTV maintenance service Patna</h2><p>With consistent <strong>CCTV maintenance service Patna</strong>, you never have to worry about system downtime. When you sleep at night or go on vacation, the anxiety of leaving your property vulnerable is eliminated. A robust <strong>CCTV camera for home Patna</strong> setup captures everything, sending instant alerts to your phone if an intrusion occurs.</p><p>This psychological comfort is essential. Employees feel safer working where their well-being is prioritized, and families feel secure knowing their boundaries are watched. High-quality CCTV cameras are not just electronic devices; they are vigilant, 24/7 guardians ensuring your world remains safe, providing the ultimate gift of peace of mind.</p>"
    }
]

if __name__ == "__main__":
    header, footer = read_template()
    create_blog_index(header, footer, posts)
    create_blog_posts(header, footer, posts)
