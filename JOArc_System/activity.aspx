<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activity.aspx.cs" Inherits="JOArc_System.activity" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Activities - Joan Arc Youth Organization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- AOS CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <!-- Font Awesome for social icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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

        .nav-logo {
            font-weight: bold;
            font-size: 20px;
            color:#ba8c00;
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

        /* Active menu item style */
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
            0% {
                opacity: 0.6;
                transform: scaleX(0.92);
            }
            50% {
                opacity: 1;
                transform: scaleX(1);
            }
            100% {
                opacity: 0.6;
                transform: scaleX(0.92);
            }
        }

        /* Mobile menu button */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #333;
        }

        /* Page Header */
        .page-header {
            background-image:linear-gradient(90deg,rgba(0, 2, 3, 1) 0%, rgba(31, 26, 0, 1) 51%, rgba(92, 73, 0, 1) 100%);
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 20px;
            text-align: center;
        }

        .page-header h1 {
            font-size: 48px;
            font-weight: bold;
            font-family: 'Arial Black';
            margin-bottom: 20px;
        }

        .page-header p {
            font-size: 18px;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Activities Categories */
        .categories {
            padding: 60px 20px;
            text-align: center;
            background-color: white;
        }

        .categories h2 {
            font-weight: bold;
            font-size: 30px;
            font-family: 'Arial Black';
            margin-bottom: 50px;
            position: relative;
        }

        .categories h2::after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background-color: #ffc30f;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .category-tabs {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 40px;
        }

        .category-tab {
            padding: 12px 25px;
            background-color: #f5f5f5;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .category-tab:hover {
            background-color: #e0e0e0;
        }

        .category-tab.active {
            background-color: #ffc30f;
            color: #333;
        }

        /* Activities Grid */
        .activities-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .activity-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            position: relative;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .activity-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }

        .activity-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }

        .activity-card:hover img {
            transform: scale(1.1);
        }

        .activity-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .activity-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .activity-date {
            font-size: 14px;
            color: #777;
            margin-bottom: 15px;
        }

        .activity-description {
            font-size: 16px;
            color: #555;
            line-height: 1.5;
            margin-bottom: 20px;
            flex-grow: 1;
        }

        .activity-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 250px;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .activity-card:hover .activity-overlay {
            opacity: 1;
        }

        .view-more {
            padding: 10px 20px;
            background-color: #ffc30f;
            color: #333;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .view-more:hover {
            background-color: #ba8c00;
            color: white;
        }

        .read-more-btn {
            align-self: flex-start;
            padding: 10px 20px;
            background-color: #ffc30f;
            color: #333;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-top: auto;
        }

        .read-more-btn:hover {
            background-color: #ba8c00;
            color: white;
        }

        /* Upcoming Events */
        .upcoming-events {
            padding: 60px 20px;
            background-color: #f9f9f9;
            text-align: center;
        }

        .upcoming-events h2 {
            font-weight: bold;
            font-size: 30px;
            font-family: 'Arial Black';
            margin-bottom: 50px;
            position: relative;
        }

        .upcoming-events h2::after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background-color: #ffc30f;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .events-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .event-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 350px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .event-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .event-date-badge {
            background-color: #ffc30f;
            color: #333;
            padding: 15px 0;
            text-align: center;
        }

        .event-date-badge .month {
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .event-date-badge .day {
            font-size: 24px;
            font-weight: bold;
        }

        .event-content {
            padding: 20px;
        }

        .event-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .event-details {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
        }

        .event-details i {
            color: #ba8c00;
            margin-right: 5px;
        }

        .event-description {
            font-size: 16px;
            color: #555;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .join-event-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .join-event-btn:hover {
            background-color: #ba8c00;
            color: white;
        }

        /* CTA Section */
        .cta-section {
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('IMAGES/volunteer-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 20px;
            text-align: center;
        }

        .cta-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .cta-section h2 {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .cta-section p {
            font-size: 18px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .volunteer-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 15px 30px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .volunteer-btn:hover {
            background-color: #ba8c00;
            color: white;
            transform: scale(1.05);
        }

        /* Footer Styles */
        .footer {
            background-color: gainsboro;
            padding: 40px 0 0 0;
            border-top: 1px solid #e0e0e0;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 0 20px 30px;
        }
        
        .footer-logo-section {
            flex: 1;
            min-width: 250px;
            padding-right: 20px;
        }
        
        .footer-logo {
            font-weight: bold;
            font-size: 24px;
            color: #ba8c00;
            margin-bottom: 15px;
        }
        
        .footer-tagline {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        
        .footer-about-text {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        
        .footer-column {
            flex: 1;
            min-width: 180px;
            padding: 0 15px;
        }
        
        .footer-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            position: relative;
        }
        
        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .footer-links li {
            margin-bottom: 12px;
        }
        
        .footer-links li a {
            color: #555;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 14px;
        }
        
        .footer-links li a:hover {
            color: #ba8c00;
        }
        
        .footer-location {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.6;
        }
        
        .subscribe-form {
            margin-top: 15px;
        }
        
        .subscribe-input {
            padding: 10px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        
        .subscribe-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-left: 10px;
        }
        
        .subscribe-btn:hover {
            background-color: #ba8c00;
            color: white;
        }
        
        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #eee;
            color: #555;
            transition: all 0.3s ease;
        }
        
        .social-icons a:hover {
            background-color: #ffc30f;
            color: #333;
            transform: translateY(-3px);
        }
        
        .copyright {
            background-color: #222;
            color: #fff;
            text-align: center;
            padding: 25px 0;
            font-size: 14px;
            margin: 0;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 40px;
            gap: 10px;
        }

        .page-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f5f5f5;
            color: #333;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .page-link:hover {
            background-color: #e0e0e0;
        }

        .page-link.active {
            background-color: #ffc30f;
            color: #333;
        }

        @media (max-width: 992px) {
            .footer-container {
                flex-wrap: wrap;
            }
            
            .footer-logo-section {
                flex: 0 0 100%;
                margin-bottom: 30px;
            }
            
            .footer-column {
                flex: 0 0 calc(50% - 30px);
                margin-bottom: 30px;
            }

            .activities-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }
            
            .nav-container {
                position: relative;
            }
            
            .nav-links {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background-color: rgba(220, 220, 220, 0.95);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                flex-direction: column;
                align-items: center;
                padding: 20px 0;
                gap: 15px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                display: none;
                z-index: 1000;
            }
            
            .nav-links.active {
                display: flex;
            }

            .page-header h1 {
                font-size: 36px;
            }

            .categories h2, .upcoming-events h2 {
                font-size: 24px;
            }

            .activity-card, .event-card {
                width: 100%;
            }

            .cta-section h2 {
                font-size: 28px;
            }

            .footer-column {
                flex: 0 0 100%;
            }
        }

        @media (max-width: 576px) {
            .activities-grid {
                grid-template-columns: 1fr;
            }

            .category-tabs {
                flex-direction: column;
                gap: 10px;
            }

            .page-header {
                padding: 50px 15px;
            }

            .page-header h1 {
                font-size: 28px;
            }

            .category-tab {
                width: 80%;
                margin: 0 auto;
            }

            .events-container {
                flex-direction: column;
                align-items: center;
            }

            .volunteer-btn {
                padding: 12px 25px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation Bar -->
        <nav class="navbar" data-aos-duration="800">
            <div class="nav-container">
                <div class="nav-logo">JAOYO</div>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <ul class="nav-links" id="navLinks">
                    <li><a href="Landingpage.aspx">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="program.aspx">Programs</a></li>
                    <li><a href="activity.aspx" class="active">Activities</a></li>
                 
                </ul>
            </div>
        </nav>

        <!-- Page Header -->
        <div class="page-header" data-aos="fade-up" data-aos-duration="1000">
            <h1>Our Activities</h1>
            <p>Discover how we're making a difference in our community through meaningful activities and events that empower youth to lead with purpose and courage.</p>
        </div>

        <!-- Activities Categories -->
        <div class="categories" data-aos="fade-up" data-aos-duration="1000">

            <div class="activities-grid">
                <!-- Activity 1 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/bingo.jpg" alt="Bingo Project" />
                    <div class="activity-content">
                        <h3 class="activity-title">Community Bingo Project</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> March 15, 2025</p>
                        <p class="activity-description">Our youth leaders organized a fun bingo event for senior citizens at the local community center, bringing joy and connection across generations.</p>
                   
                    </div>
                </div>

                <!-- Activity 2 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/party.jpg" alt="Christmas Party" />
                    <div class="activity-content">
                        <h3 class="activity-title">Annual Christmas Celebration</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> December 23, 2024</p>
                        <p class="activity-description">Our annual Christmas party brought together members, volunteers, and community partners for a night of festive celebration and gratitude.</p>
                      
                    </div>
                </div>

                <!-- Activity 3 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="300">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/clean.jpg" alt="Clean Up Drive" />
                    <div class="activity-content">
                        <h3 class="activity-title">Neighborhood Clean-Up Drive</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> February 28, 2025</p>
                        <p class="activity-description">Our youth organization took to the streets for our quarterly clean-up drive, removing litter and beautifying public spaces in our community.</p>
                      
                    </div>
                </div>

                <!-- Activity 4 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/j0an.jpg" alt="Leadership Workshop" />
                    <div class="activity-content">
                        <h3 class="activity-title">Youth Leadership Workshop</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> January 18, 2025</p>
                        <p class="activity-description">Our two-day workshop focused on developing essential leadership skills, effective communication, and team-building strategies for our youth members.</p>
                       
                    </div>
                </div>

                <!-- Activity 5 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/food.jpg" alt="Food Drive" />
                    <div class="activity-content">
                        <h3 class="activity-title">Community Food Drive</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> April 2, 2025</p>
                        <p class="activity-description">Our members collected and distributed food packages to families in need, addressing food insecurity in our local community.</p>
                      
                    </div>
                </div>

                <!-- Activity 6 -->
                <div class="activity-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="300">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/art.jpg" alt="Skill Building Workshop" />
                    <div class="activity-content">
                        <h3 class="activity-title">Creative Arts Workshop</h3>
                        <p class="activity-date"><i class="far fa-calendar-alt"></i> March 8, 2025</p>
                        <p class="activity-description">Our creative arts workshop provided youth with opportunities to express themselves through various art forms while developing valuable skills.</p>
                        
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="pagination" data-aos="fade-up" data-aos-duration="800">
                <a href="#" class="page-link active">1</a>
                <a href="#" class="page-link">2</a>
                <a href="#" class="page-link">3</a>
                <a href="#" class="page-link"><i class="fas fa-angle-right"></i></a>
            </div>
        </div>

        <!-- Upcoming Events -->
        <div class="upcoming-events" data-aos="fade-up" data-aos-duration="1000">
            <h2>UPCOMING EVENTS</h2>
            <div class="events-container">
                <!-- Event 1 -->
                <div class="event-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="100">
                    <div class="event-date-badge">
                        <div class="month">May</div>
                        <div class="day">15</div>
                    </div>
                    <div class="event-content">
                        <h3 class="event-title">Environmental Awareness Day</h3>
                        <div class="event-details">
                            <p><i class="far fa-clock"></i> 9:00 AM - 2:00 PM</p>
                            <p><i class="fas fa-map-marker-alt"></i> Novaliches Community Park</p>
                        </div>
                        <p class="event-description">Join us for a day of environmental education, tree planting, and community clean-up to celebrate Environmental Awareness Day.</p>
                        <button class="join-event-btn">Join Event</button>
                    </div>
                </div>

                <!-- Event 2 -->
                <div class="event-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
                    <div class="event-date-badge">
                        <div class="month">May</div>
                        <div class="day">28</div>
                    </div>
                    <div class="event-content">
                        <h3 class="event-title">Youth Leadership Summit</h3>
                        <div class="event-details">
                            <p><i class="far fa-clock"></i> 8:30 AM - 5:00 PM</p>
                            <p><i class="fas fa-map-marker-alt"></i> Joan Arc Community Center</p>
                        </div>
                        <p class="event-description">A full-day summit featuring inspirational speakers, workshops, and networking opportunities for young leaders in our community.</p>
                        <button class="join-event-btn">Join Event</button>
                    </div>
                </div>

                <!-- Event 3 -->
                <div class="event-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="300">
                    <div class="event-date-badge">
                        <div class="month">Jun</div>
                        <div class="day">10</div>
                    </div>
                    <div class="event-content">
                        <h3 class="event-title">Summer Kickoff Festival</h3>
                        <div class="event-details">
                            <p><i class="far fa-clock"></i> 4:00 PM - 9:00 PM</p>
                            <p><i class="fas fa-map-marker-alt"></i> Novaliches Sports Complex</p>
                        </div>
                        <p class="event-description">Celebrate the start of summer with games, performances, food, and activities for youth and families from around the community.</p>
                        <button class="join-event-btn">Join Event</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA Section -->
        <div class="cta-section" data-aos="fade-up" data-aos-duration="1000">
            <div class="cta-container">
                <h2>BE PART OF OUR MISSION</h2>
                <p>Join our team of dedicated volunteers making a positive impact in the lives of young people. Together, we can build a stronger, more empowered community.</p>
                <button class="volunteer-btn">Become a Volunteer</button>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-logo-section">
                    <div class="footer-logo">JAOYO</div>
                    <p class="footer-tagline">Empowering Youth, Inspiring Change</p>
                    <p class="footer-about-text">Joan Arc Youth Organization is dedicated to nurturing the potential of young people through leadership development, community service, and meaningful activities that prepare them for future success.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="Landingpage.aspx">Home</a></li>
                        <li><a href="about.aspx">About Us</a></li>
                        <li><a href="program.aspx">Programs</a></li>
                        <li><a href="activity.aspx">Activities</a></li>
                        <li><a href="#">Get Involved</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Programs</h3>
                    <ul class="footer-links">
                        <li><a href="#">Leadership Development</a></li>
                        <li><a href="#">Community Service</a></li>
                        <li><a href="#">Mentorship Program</a></li>
                        <li><a href="#">Educational Support</a></li>
                        <li><a href="#">Creative Arts</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Contact Info</h3>
                    <p class="footer-location"><i class="fas fa-map-marker-alt"></i> 123 Community Center Ave, Novaliches, Quezon City</p>
                    <p class="footer-location"><i class="fas fa-phone"></i> (02) 8123-4567</p>
                    <p class="footer-location"><i class="fas fa-envelope"></i> info@joanarcyouth.org</p>
                    
                    <h3 class="footer-title">Newsletter</h3>
                    <div class="subscribe-form">
                        <input type="email" class="subscribe-input" placeholder="Your Email" />
                        <button class="subscribe-btn">Subscribe</button>
                    </div>
                </div>
            </div>
            
            <div class="copyright">
                <p>&copy; 2025 Joan Arc Youth Organization. All Rights Reserved.</p>
            </div>
        </footer>
    </form>

    <!-- AOS JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    
    <script>
        // Initialize AOS
        AOS.init();
        
        // Mobile menu toggle
        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('active');
        });
        
        // Category tab switching
        const categoryTabs = document.querySelectorAll('.category-tab');
        categoryTabs.forEach(tab => {
            tab.addEventListener('click', function() {
                // Remove active class from all tabs
                categoryTabs.forEach(t => t.classList.remove('active'));
                // Add active class to clicked tab
                this.classList.add('active');
                
                // Here you would typically filter the activities based on category
                // For demonstration purposes, we're just updating the UI
            });
        });
        
        // Smooth scrolling for navigation links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                if (targetId !== '#') {
                    document.querySelector(targetId).scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });
        
        // Sticky navigation effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.style.padding = '15px 20px';
                navbar.style.boxShadow = '0 4px 10px rgba(0,0,0,0.1)';
            } else {
                navbar.style.padding = '20px 20px';
                navbar.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
            }
        });
    </script>
</body>
</html>