<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="JOArc_System.about" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Joan Arc Youth Organization</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Navigation Styles */
        .navbar {
            background-color: rgba(220, 220, 220, 0.8);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 20px 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }
        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: auto;
        }
        
        /* Logo Styles */
        .nav-logo {
            font-weight: bold;
            font-size: 22px;
            color: #ba8c00;
        }
        
        .nav-links {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }
        .nav-links li a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
            padding: 8px 12px;
            border-radius: 4px;
            position: relative;
        }
        .nav-links li a:hover {
            color: #ba8c00;
        }
        .nav-links li a.active {
            color: #ba8c00;
            font-weight: bold;
        }
        .nav-links li a.active::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #ffc30f;
            animation: pulse 1.5s infinite;
        }
        @keyframes pulse {
            0% { opacity: 0.6; transform: scaleX(0.92); }
            50% { opacity: 1; transform: scaleX(1); }
            100% { opacity: 0.6; transform: scaleX(0.92); }
        }
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #333;
        }

        /* Introduction Section */
        .about-intro {
            background: linear-gradient(to right, #ffe0b2, #ffb300);
            color: #333;
            padding: 50px 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 1200px;
            margin: 70px auto;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            flex-wrap: wrap;
        }
        .intro-text {
            flex: 1;
            min-width: 50%;
            padding-right: 50px;
            line-height: 25px;
            text-align: left;
            position: relative;
        }
        .intro-text h1 {
            font-size: 3em;
            font-family: 'Arial Black';
            font-weight: bold;
            color: #8a6103;
            margin-bottom: 50px;
            display: inline-block;
            position: relative;
        }
        
        /* Modified decorative line to be next to JAOYO heading */
        .intro-decorative-line {
            display: inline-block;
            position: relative;
            top: -15px;
            left: 10px;
            width: 0;
            height: 4px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
            opacity: 0;
            transition: width 1.5s ease, opacity 1.5s ease;
        }
        
        .intro-decorative-line.visible {
            width: 100px;
            opacity: 1;
        }
        .intro-image {
            flex: 1;
            min-width: 300px;
            text-align: center;
        }
        .intro-image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Mission/Vision/Goals Section */
        .mvv-header {
            max-width: 1200px;
            margin: 50px auto;
            text-align: center;
        }
        .mvv-header h2 {
            color: #ba8c00;
            font-size: 24px;
            margin: 0 0 10px;
        }
        .mvv-header p {
            color: #666;
            font-size: 15px;
            margin: 0;
        }
        .mvv-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
            flex-wrap: wrap;
        }
        .mvv-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
            flex: 1 0 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .mvv-icon-container {
            background-color: #f9f9f9;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            color: #ba8c00;
            font-size: 2.5em;
        }
        .mvv-title {
            color: #333;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .mvv-description {
            color: #666;
            line-height: 1.6;
            font-size: 15px;
        }
        
        /* Gallery Section */
        .gallery-section {
            max-width: 1200px;
            margin: 70px auto;
            padding: 0 20px;
             display: flex;
    flex-direction: column;
    align-items: center;
        }
        
        .gallery-heading {
            text-align: center;
            margin-bottom: 40px;
        }
        
        .gallery-heading h2 {
            color: #ba8c00;
            font-size: 28px;
            margin-bottom: 10px;
            position: relative;
            display: inline-block;
        }
        
        .gallery-heading h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
        }
        
        .gallery-heading p {
            color: #666;
            font-size: 16px;
        }
        
        /* Modified carousel gallery styles */
        .gallery-container {
            position: relative;
            width: 100%;
            height: 500px;
            max-width: 800px;
            overflow: hidden;
            border-radius: 8px;

            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .gallery-slides {
            display: flex;
            transition: transform 0.5s ease;
            height: 100%;
        }
        
        .gallery-slide {
            min-width: 100%;
            height: 100%;
            position: relative;
            overflow: hidden;
        }
        
        .gallery-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .gallery-slide:hover img {
            transform: scale(1.05);
        }
        
        .gallery-caption {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
            color: white;
            padding: 15px;
            transform: translateY(100%);
            transition: transform 0.3s ease;
        }
        
        .gallery-slide:hover .gallery-caption {
            transform: translateY(0);
        }
        
        .gallery-caption h4 {
            margin: 0 0 5px;
            font-size: 18px;
        }
        
        .gallery-caption p {
            margin: 0;
            font-size: 14px;
            opacity: 0.9;
        }
        
        .gallery-controls {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .gallery-control-btn {
            background: #fff;
            border: 2px solid #ba8c00;
            color: #ba8c00;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .gallery-control-btn:hover {
            background: #ba8c00;
            color: white;
        }
        
        .gallery-indicators {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 15px;
        }
        
        .gallery-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #ddd;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        
        .gallery-indicator.active {
            background: #ba8c00;
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            .mvv-container {
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }
            .mvv-card {
                width: 100%;
                flex-basis: auto;
            }
            .gallery-container {
                height: 300px;
            }
            .menu-toggle {
                display: block;
            }
            .nav-links {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: rgba(220, 220, 220, 0.95);
                flex-direction: column;
                align-items: center;
                padding: 20px 0;
                clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
                transition: clip-path 0.4s ease-out;
            }
            .nav-links.active {
                clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
            }
            .intro-text {
                padding-right: 0;
                margin-bottom: 30px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar" data-aos-duration="800">
            <div class="nav-container">
                <div class="nav-logo">JAOYO</div>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <ul class="nav-links" id="navLinks">
                    <li><a href="Landingpage.aspx">Home</a></li>
                    <li><a href="about.aspx" class="active">About</a></li>
                    <li><a href="#">Programs</a></li>
                    <li><a href="#">Activities</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </nav>
        <div class="about-intro">
            <div class="intro-text">
                <h1>JAOYO</h1>
                <div class="intro-decorative-line"></div>
                <p>The Joan Arc Youth Organization stands as a beacon for young individuals, dedicated to empowering them, igniting their sense of purpose, and fostering leadership driven by courage. With a vision to shape the next generation of impactful leaders, the organization likely engages in a variety of programs and activities designed to cultivate essential skills, build character, and inspire positive change within their communities. By focusing on youth development, the Joan Arc Youth Organization aims to equip young people with the tools and mindset needed to navigate the challenges of tomorrow and lead with unwavering conviction.</p>
            </div>
            <div class="intro-image">
                <img src="IMAGES/j0an.jpg" alt="Image related to your organization" />
            </div>
        </div>
        <div class="mvv-header">
            <h2>Our Goals: Embracing Our Core Values</h2>
            <p>Our core values serve as the foundation for our organizational goals.</p>
        </div>
        <div class="mvv-container">
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h3 class="mvv-title">Goal: Foster Courageous Leadership</h3>
                <p class="mvv-description">
                    To develop young leaders who act with bravery and conviction, inspiring others and driving positive change in challenging situations.
                </p>
            </div>
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-users"></i>
                </div>
                <h3 class="mvv-title">Goal: Empower Youth Potential</h3>
                <p class="mvv-description">
                    To provide resources, mentorship, and opportunities that empower young individuals to discover their strengths and achieve their full potential.
                </p>
            </div>
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-lightbulb"></i>
                </div>
                <h3 class="mvv-title">Goal: Cultivate a Sense of Purpose</h3>
                <p class="mvv-description">
                    To guide young people in identifying their passions and contributing meaningfully to their communities and the wider world.
                </p>
            </div>
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-handshake"></i>
                </div>
                <h3 class="mvv-title">Goal: Uphold Integrity and Ethics</h3>
                <p class="mvv-description">
                    To instill strong ethical principles and a commitment to integrity in all our members and activities.
                </p>
            </div>
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-globe-asia"></i>
                </div>
                <h3 class="mvv-title">Goal: Strengthen Community Engagement</h3>
                <p class="mvv-description">
                    To actively involve our youth in community service and initiatives that foster a sense of belonging and collective responsibility.
                </p>
            </div>
            <div class="mvv-card">
                <div class="mvv-icon-container">
                    <i class="fas fa-arrow-up"></i>
                </div>
                <h3 class="mvv-title">Goal: Drive Positive Impact</h3>
                <p class="mvv-description">
                    To create and support projects and actions that lead to meaningful and sustainable positive change in society.
                </p>
            </div>
        </div>
        
        <!-- Gallery Section with Carousel -->
        <section class="gallery-section">
            <div class="gallery-heading">
                <h2>Our Journey in Pictures</h2>
                <p>Explore moments that capture the essence of our mission and the spirit of our community</p>
            </div>
            
            <div class="gallery-container">
                <div class="gallery-slides" id="gallerySlides">
                    <div class="gallery-slide">
                        <img src="IMAGES/party.jpg" alt="Youth Leadership Workshop" />
                        <div class="gallery-caption">
                            <h4>Leadership Workshop</h4>
                            <p>Young leaders developing essential skills through interactive sessions</p>
                        </div>
                    </div>
                    <div class="gallery-slide">
                        <img src="IMAGES/map.jpg" alt="Community Service Project" />
                        <div class="gallery-caption">
                            <h4>Community Impact</h4>
                            <p>Members engaging in local community service initiatives</p>
                        </div>
                    </div>
                    <div class="gallery-slide">
                        <img src="IMAGES/clean.jpg" alt="Team Building Activities" />
                        <div class="gallery-caption">
                            <h4>Team Building</h4>
                            <p>Building strong bonds through collaborative challenges</p>
                        </div>
                    </div>
                    <div class="gallery-slide">
                        <img src="IMAGES/bingo.jpg" alt="Environmental Project" />
                        <div class="gallery-caption">
                            <h4>Environmental Stewardship</h4>
                            <p>Youth-led initiatives for environmental conservation</p>
                        </div>
                    </div>
                    <div class="gallery-slide">
                        <img src="IMAGES/j0an.jpg" alt="Public Speaking Event" />
                        <div class="gallery-caption">
                            <h4>Finding Their Voice</h4>
                            <p>Youth members developing public speaking skills</p>
                        </div>
                    </div>
                    <div class="gallery-slide">
                        <img src="IMAGES/party.jpg" alt="Annual Conference" />
                        <div class="gallery-caption">
                            <h4>Annual Conference</h4>
                            <p>Celebrating achievements and setting future goals together</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="gallery-controls">
                <div class="gallery-control-btn" id="prevBtn">
                    <i class="fas fa-chevron-left"></i>
                </div>
                <div class="gallery-control-btn" id="nextBtn">
                    <i class="fas fa-chevron-right"></i>
                </div>
            </div>
            
            <div class="gallery-indicators" id="galleryIndicators">
                <!-- Indicators will be generated by JavaScript -->
            </div>
        </section>
        
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Navigation menu toggle
                const menuToggle = document.getElementById('menuToggle');
                const navLinks = document.getElementById('navLinks');
                if (menuToggle && navLinks) {
                    menuToggle.addEventListener('click', function () {
                        navLinks.classList.toggle('active');
                    });
                    document.addEventListener('click', function (event) {
                        const isClickInsideMenu = navLinks.contains(event.target);
                        const isClickOnToggle = menuToggle.contains(event.target);
                        if (!isClickInsideMenu && !isClickOnToggle && navLinks.classList.contains('active')) {
                            navLinks.classList.remove('active');
                        }
                    });
                }

                // Add active class to current page link
                const navItems = document.querySelectorAll('.nav-links li a');
                navItems.forEach(item => {
                    if (item.getAttribute('href') === 'about.aspx') {
                        item.classList.add('active');
                    }
                });

                // Gallery Carousel functionality
                const slides = document.querySelectorAll('.gallery-slide');
                const slidesContainer = document.getElementById('gallerySlides');
                const prevBtn = document.getElementById('prevBtn');
                const nextBtn = document.getElementById('nextBtn');
                const indicatorsContainer = document.getElementById('galleryIndicators');

                let currentSlide = 0;
                const totalSlides = slides.length;

                // Create indicators
                for (let i = 0; i < totalSlides; i++) {
                    const indicator = document.createElement('div');
                    indicator.classList.add('gallery-indicator');
                    if (i === 0) indicator.classList.add('active');
                    indicator.dataset.slide = i;
                    indicatorsContainer.appendChild(indicator);

                    // Add click event to indicators
                    indicator.addEventListener('click', function () {
                        goToSlide(parseInt(this.dataset.slide));
                    });
                }

                // Function to update slide position
                function updateSlidePosition() {
                    slidesContainer.style.transform = `translateX(-${currentSlide * 100}%)`;

                    // Update indicators
                    document.querySelectorAll('.gallery-indicator').forEach((indicator, index) => {
                        if (index === currentSlide) {
                            indicator.classList.add('active');
                        } else {
                            indicator.classList.remove('active');
                        }
                    });
                }

                // Function to go to a specific slide
                function goToSlide(slideIndex) {
                    currentSlide = slideIndex;

                    // Handle wrapping
                    if (currentSlide < 0) {
                        currentSlide = totalSlides - 1;
                    } else if (currentSlide >= totalSlides) {
                        currentSlide = 0;
                    }

                    updateSlidePosition();
                }

                // Previous slide button
                prevBtn.addEventListener('click', function () {
                    goToSlide(currentSlide - 1);
                });

                // Next slide button
                nextBtn.addEventListener('click', function () {
                    goToSlide(currentSlide + 1);
                });

                // Auto-play functionality
                let slideInterval = setInterval(() => {
                    goToSlide(currentSlide + 1);
                }, 5000);

                // Pause auto-play on hover
                slidesContainer.addEventListener('mouseenter', function () {
                    clearInterval(slideInterval);
                });

                // Resume auto-play on mouse leave
                slidesContainer.addEventListener('mouseleave', function () {
                    slideInterval = setInterval(() => {
                        goToSlide(currentSlide + 1);
                    }, 5000);
                });

                // Initialize carousel
                updateSlidePosition();

                // Decorative line animation
                const decorativeLine = document.querySelector('.intro-decorative-line');

                // Make the decorative line visible immediately
                decorativeLine.classList.add('visible');

                // Add responsive behavior for window resize
                window.addEventListener('resize', function () {
                    updateSlidePosition();
                });
            });


        </script>
    </form>
</body>
</html>