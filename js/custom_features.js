/* Custom Features for Gaurav CCTV (ZPlus Style) */

document.addEventListener("DOMContentLoaded", function () {
    // --- 1. Lead Generation Popup Logic ---
    // --- 1. Lead Generation Popup Logic REMOVED per user request ---
    /*
    const popupHtml = `
    <div id="lead-popup">
        <div class="popup-content">
            <span class="close-popup">&times;</span>
            <h3 class="h3-md text-white mb-3">Get a Free CCTV Quote!</h3>
            <p class="text-gray mb-4">Secure your home or office with Patna's #1 CCTV Experts.</p>
            
            <div class="cta-buttons justify-content-center">
                <a href="tel:+917070905318" class="btn-theme">
                    <i class="icofont-phone"></i> Call Now
                </a>
                <a href="https://wa.me/917070905318" class="btn-theme bg-green">
                    <i class="icofont-whatsapp"></i> WhatsApp
                </a>
            </div>
            <p class="mt-3 text-sm text-gray">or visit us at Danapur, Patna</p>
        </div>
    </div>`;

    document.body.insertAdjacentHTML('beforeend', popupHtml);

    const popup = document.getElementById('lead-popup');
    const closeBtn = document.querySelector('.close-popup');

    if (popup) {
        // Show after 5 seconds
        setTimeout(() => {
            if (!sessionStorage.getItem('popupShown')) {
                popup.style.display = 'flex';
                sessionStorage.setItem('popupShown', 'true');
            }
        }, 5000);

        // Close events
        closeBtn.onclick = () => popup.style.display = 'none';
        window.onclick = (event) => {
            if (event.target == popup) popup.style.display = 'none';
        };
    }
    */

    // --- 2. Reviews Injection (Index Page Specific) ---
    // Targeted injection into existing container or creating a new one if not matching
    // We already have specific markup in index.html, we just need to ensure generic text replaced.
    // This script will inject distinct Google Reviews if the container exists.

    // (This part is handled by the static HTML update or script replacement below)
});

