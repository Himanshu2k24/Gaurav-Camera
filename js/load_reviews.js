// Load Google Reviews
$(document).ready(function () {
    const container = $("#reviews-container");
    const reviews = window.googleReviews || [];

    if (reviews.length === 0) return;

    // Shuffle Array
    const shuffled = reviews.sort(() => 0.5 - Math.random());

    // Select top 20 to display (or more)
    const selectedReviews = shuffled.slice(0, 20);

    // Generate HTML
    let htmlContent = '';

    selectedReviews.forEach(review => {
        // Star Rating Generation
        let stars = '';
        for (let i = 0; i < 5; i++) {
            if (i < review.rating) {
                stars += '<i class="icofont-star"></i>';
            } else {
                stars += '<i class="icofont-star text-muted"></i>';
            }
        }

        htmlContent += `
        <div class="item">
            <div class="review-card">
                <div class="review-quote-icon">
                    <i class="icofont-quote-right"></i>
                </div>
                <div class="reviewer-profile">
                    <div class="reviewer-info">
                        <h4>${review.name}</h4>
                        <span>${review.date}</span>
                    </div>
                </div>
                <p class="review-text">"${review.text}"</p>
                <div class="review-rating">
                    ${stars}
                </div>
                <div class="google-logo" style="margin-top: 10px; text-align: right;">
                     <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Google_2015_logo.svg" alt="Google" style="width: 50px; opacity: 0.6;">
                </div>
            </div>
        </div>
        `;
    });

    // Replace Container Content
    // Important: We need to do this BEFORE Owl Carousel initializes
    // OR we need to destroy and re-init if it's already running.
    // For simplicity, we assume this runs before main.js or we manually handle it.

    container.html(htmlContent);

    // Re-initialize Owl Carousel if needed
    // Assuming main.js initializes .testimonials-carousel
    // We might need to ensure this script runs first
});
