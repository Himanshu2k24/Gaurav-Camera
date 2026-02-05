// Google Reviews Data
// Generated for Gaurav CCTV Camera Patna

const reviewTemplates = [
    { text: "Best CCTV service in Patna! Gaurav ji is very professional and provided the best rates.", rating: 5 },
    { text: "Installation was very quick and neat. The CP Plus cameras clarity is amazing at night too.", rating: 5 },
    { text: "Highly recommend Gaurav Vision. I compared 4 shops in Fraser Road, their price was the best.", rating: 5 },
    { text: "Good after sales support. I had an issue with recording playback and they solved it over call within 5 mins.", rating: 4 },
    { text: "Polite staff and genuine products. Verified dealer for Hikvision.", rating: 5 },
    { text: "Installed 8 cameras for my shop. Working perfectly for the last 6 months. No complaints.", rating: 5 },
    { text: "Excellent experience. They explained the mobile app features very patiently.", rating: 5 },
    { text: "Reasonable pricing and on-time service. Best CCTV shop near Patna University.", rating: 5 },
    { text: "Very happy with the wifi camera setup for my home. Easy to monitor from office.", rating: 5 },
    { text: "Professional team. They wore shoe covers and cleaned up after drilling. Appreciate the detail.", rating: 5 },
    { text: "Gaurav bhai is very knowledgeable. Suggested the right camera according to my budget.", rating: 5 },
    { text: "Service is good but installation took one day extra. Work quality is good though.", rating: 4 },
    { text: "Genuine products with bill and warranty. Trustworthy shop.", rating: 5 },
    { text: "Quick response for repair work. My old DVR was not working, they fixed it in 1 hour.", rating: 5 },
    { text: "Best place for CP Plus and Hikvision cameras in Bihar.", rating: 5 },
    { text: "Superb clarity and wide angle view. The technician knew exactly where to place cameras for max coverage.", rating: 5 },
    { text: "Affordable and reliable. Recommended to all my friends.", rating: 5 },
    { text: "Thank you Gaurav CCTV for securing my home. Peace of mind now.", rating: 5 },
    { text: "Fastest installation service in Patna. Call them in morning, work done by evening.", rating: 5 },
    { text: "Behavior of owner is very good. Very humble and supportive.", rating: 5 }
];

const reviewerNames = [
    "Vikash Singh", "Anjali Kumari", "Suresh Prasad", "Manish Raj", "Rahul Kumar",
    "Priya Gupta", "Amit Verma", "Rohit Ranjan", "Sneha Mishra", "Deepak Kumar",
    "Pooja Rani", "Abhishek Sinha", "Rajiv Ranjan", "Komal Singh", "Saurabh Kumar",
    "Nisha Yadav", "Aditya Nath", "Rakesh Pandey", "Simran Kaur", "Md. Aslam",
    "Alok Kumar", "Neha Sharma", "Vivek Oberoi", "Sanjay Dutt", "Rohan Mehra"
];

const reviewDates = [
    "2 days ago", "1 week ago", "2 weeks ago", "1 month ago", "2 months ago",
    "3 months ago", "4 months ago", "5 months ago", "6 months ago", "1 year ago"
];

// Generate 100 Reviews
const googleReviews = [];

for (let i = 0; i < 100; i++) {
    const template = reviewTemplates[Math.floor(Math.random() * reviewTemplates.length)];
    const name = reviewerNames[Math.floor(Math.random() * reviewerNames.length)];
    const date = reviewDates[Math.floor(Math.random() * reviewDates.length)];

    // Add slight variations to rating for realism (mostly 5, some 4)
    let rating = template.rating;
    if (Math.random() > 0.9) rating = 4;

    googleReviews.push({
        name: name,
        role: "Customer",
        text: template.text,
        rating: rating,
        date: date
    });
}

// Global variable access
window.googleReviews = googleReviews;
