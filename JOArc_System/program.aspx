<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="program.aspx.cs" Inherits="JOArc_System.program" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Programs - Joan Arc Youth Organization</title>
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
     background-color: rgba(220, 220, 220, 0.8); /* Changed from solid to semi-transparent */
     backdrop-filter: blur(10px); /* Added blur effect */
     -webkit-backdrop-filter: blur(10px); /* For Safari */
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

        /* Header Section */
        .programs-header {
           background-image:linear-gradient(90deg,rgba(0, 2, 3, 1) 0%, rgba(31, 26, 0, 1) 51%, rgba(92, 73, 0, 1) 100%);
 background-size: cover;
 background-position: center;
 color: white;
 padding: 80px 20px;
 text-align: center;
        }
        .programs-header h1 {
            font-size: 2.5em;
            color: white;
            font-family: 'Arial Black';
            margin-bottom: 15px;

        }
        .programs-header p {
            font-size: 1.1em;
            max-width: 800px;
            margin: 0 auto;
        }

        /* Programs Container */
        .programs-container {
            max-width: 1200px;
            margin: 0 auto 50px;
            padding: 0 20px;
        }

        .programs-section-title {
            color: #ba8c00;
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            font-size: 28px;
        }
        
        .programs-section-title::after {
            content: '';
            display: block;
            width: 60px;
            height: 3px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
            margin: 10px auto 0;
        }

        /* Program Cards Grid */
        .programs-grid {
            display: grid;
            margin-top: 80px;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
        }

        /* Program Card */
        .program-card {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .program-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }
        
        .program-image {
            height: 200px;
            overflow: hidden;
        }
        
        .program-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .program-card:hover .program-image img {
            transform: scale(1.05);
        }
        
        .program-title {
            padding: 15px;
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            color: #333;
            background-color: #ffc107;
        }
        
        .program-details {
            padding: 20px;
        }
        
        .program-description {
            margin-bottom: 15px;
            line-height: 1.5;
            color: #555;
        }
        
        .program-info {
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }
        
        .program-info i {
            color: #ba8c00;
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .program-button {
            display: block;
            text-align: center;
            padding: 10px;
            background-color: #ba8c00;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }
        
        .program-button:hover {
            background-color: #8a6103;
        }

        /* Special Programs */
        .special-program {
            background: linear-gradient(to right, #f5f5f5, #e0e0e0);
            padding: 50px 20px;
            margin: 70px 0;
        }
        
        .special-program-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 40px;
        }
        
        .special-program-image {
            flex: 1;
            min-width: 300px;
        }
        
        .special-program-image img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
        }
        
        .special-program-info {
            flex: 1;
            min-width: 300px;
        }
        
        .special-program-info h2 {
            color: #ba8c00;
            margin-bottom: 15px;
            font-size: 1.8em;
        }
        
        .special-program-info p {
            margin-bottom: 15px;
            line-height: 1.6;
            color: #444;
        }
        
        .special-program-info ul {
            padding-left: 20px;
            margin-bottom: 20px;
        }
        
        .special-program-info li {
            margin-bottom: 8px;
            color: #444;
        }
        
        .special-program-button {
            display: inline-block;
            padding: 12px 25px;
            background-color: #ba8c00;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        
        .special-program-button:hover {
            background-color: #8a6103;
        }

        /* Call to Action */
        .cta-section {
            background-color: black;
            padding: 50px 20px;
            text-align: center;
            margin: 50px 0;
        }
        
        .cta-content {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .cta-content h2 {
            color: #fff;
            font-size: 2em;
            margin-bottom: 15px;
        }
        
        .cta-content p {
            color: #fff;
            margin-bottom: 25px;
            font-size: 1.1em;
        }
        
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .cta-btn, #btnApplyNow {
            padding: 12px 25px;
            text-decoration: none;
            font-weight: bold;
            font-size: 20px;
            font-family: Arial;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        #btnApplyNow {
            background-color: #fff;
            cursor: pointer;
              padding: 15px 30px;
            color: #ba8c00;
            font-family: Arial;
            font-size: 15px;

        }
        
        #btnApplyNow:hover {
            background-color: #f5f5f5;
            transform: translateY(-3px);
        }
        
        .cta-btn-secondary {
            background-color: transparent;
            color: #fff;
            border: 2px solid #fff;
        }
        
        .cta-btn-secondary:hover {
            background-color: rgba(255,255,255,0.1);
            transform: translateY(-3px);
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
            margin-left: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 100%;
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

        /* Mobile Responsive Styles */
        @media (max-width: 992px) {
            .programs-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
            
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
        }

        @media (max-width: 768px) {
            .programs-header h1 {
                font-size: 2em;
            }
            
            .programs-grid {
                grid-template-columns: repeat(auto-fill, minmax(100%, 1fr));
            }
            
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
            
            .special-program-content {
                flex-direction: column;
            }
            
            .cta-buttons {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
            
            .footer-column {
                flex: 0 0 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation -->
        <nav class="navbar">
            <div class="nav-container">
                <div class="nav-logo">JAOYO</div>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <ul class="nav-links" id="navLinks">
                    <li><a href="Landingpage.aspx">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="program.aspx" class="active">Programs</a></li>
                    <li><a href="activity.aspx">Activities</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                      <li><a href="donation.aspx">Donate</a></li>
                  
                </ul>
            </div>
        </nav>
        
        <!-- Header Section -->
        <header class="programs-header">
            <h1>Our Youth Development Programs</h1>
            <p>Discover a range of programs designed to empower, ignite purpose, and foster leadership in young individuals through meaningful experiences and activities.</p>
        </header>
        
        <!-- Regular Programs Section -->
        <div class="programs-container">
           
            <div class="programs-grid">
                <!-- Program Card 1 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/leadershippaul.png" alt="Leadership Training" />
                    </div>
                    <div class="program-title">Leadership Development</div>
                    <div class="program-details">
                        <p class="program-description">A comprehensive program that helps young individuals develop essential leadership skills, confidence, and vision to lead positive change.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Every Saturday, 9:00 AM - 12:00 PM</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>JAOYO Community Center</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>Ages 14-21</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
                
                <!-- Program Card 2 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/clean.jpg" alt="Community Service" />
                    </div>
                    <div class="program-title">Community Outreach</div>
                    <div class="program-details">
                        <p class="program-description">Engage in meaningful community service projects that address local needs while developing empathy and social responsibility.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Every 2nd & 4th Sunday of the month</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Various locations in Novaliches</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>All ages welcome</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
                
                <!-- Program Card 3 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/bingo.jpg" alt="Skills Workshop" />
                    </div>
                    <div class="program-title">Skills Development</div>
                    <div class="program-details">
                        <p class="program-description">Hands-on workshops covering essential life and career skills including communication, digital literacy, financial management, and more.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Wednesdays, 4:00 PM - 6:00 PM</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>JAOYO Training Room</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>Ages 16-24</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
                
                <!-- Program Card 4 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/party.jpg" alt="Mentorship Program" />
                    </div>
                    <div class="program-title">Youth Mentorship</div>
                    <div class="program-details">
                        <p class="program-description">Connect with experienced mentors who provide guidance, support, and insight to help you navigate challenges and achieve your goals.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Flexible schedule, bi-weekly meetings</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>In-person or virtual options</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>Ages 14-21</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
                
                <!-- Program Card 5 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/academicachiever.jpg" alt="Educational Support" />
                    </div>
                    <div class="program-title">Academic Excellence</div>
                    <div class="program-details">
                        <p class="program-description">Academic support through tutoring, study groups, and resources to help students excel in their educational pursuits.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Monday-Thursday, 3:00 PM - 6:00 PM</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>JAOYO Study Center</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>Elementary to College students</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
                
                <!-- Program Card 6 -->
                <div class="program-card">
                    <div class="program-image">
                        <img src="IMAGES/j0an.jpg" alt="Arts Program" />
                    </div>
                    <div class="program-title">Creative Arts Expression</div>
                    <div class="program-details">
                        <p class="program-description">Explore various art forms and creative expression through workshops in music, visual arts, dance, theater, and more.</p>
                        <div class="program-info">
                            <i class="far fa-calendar"></i>
                            <span>Fridays, 4:00 PM - 7:00 PM</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>JAOYO Arts Studio</span>
                        </div>
                        <div class="program-info">
                            <i class="fas fa-user-friends"></i>
                            <span>Ages 12-24</span>
                        </div>
                        <a href="#" class="program-button">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Special Program Highlight -->
        <section class="special-program">
            <div class="special-program-content">
                <div class="special-program-image">
                    <img src="IMAGES/party.jpg" alt="Summer Leadership Camp" />
                </div>
                <div class="special-program-info">
                    <h2>Summer Leadership Camp 2025</h2>
                    <p>Our flagship annual summer program bringing together youth from across Metro Manila for an intensive week of leadership development, team-building, and personal growth.</p>
                    <ul>
                        <li>Hands-on leadership workshops and activities</li>
                        <li>Team challenges and outdoor adventures</li>
                        <li>Public speaking and communication skills</li>
                        <li>Community service project planning</li>
                        <li>Mentorship from established community leaders</li>
                    </ul>
                    <p><strong>Date:</strong> May 15-22, 2025<br />
                    <strong>Location:</strong> Camp Riverview, Laguna<br />
                    <strong>Ages:</strong> 15-21</p>
                    <a href="#" class="special-program-button">Register Now</a>
                </div>
            </div>
        </section>
        
        <!-- Call to Action -->
        <section class="cta-section">
            <div class="cta-content">
                <h2>Ready to Join Our Programs?</h2>
                <p>Take the first step toward personal growth, leadership development, and meaningful community impact. Join the Joan Arc Youth Organization today!</p>
                <div class="cta-buttons">
                    <asp:Button ID="btnApplyNow" runat="server" Text="Apply Now" OnClientClick="redirectToJoinNow(); return false;" CssClass="btn btn-primary" />
                    <a href="#" class="cta-btn cta-btn-secondary">Contact Us</a>
                </div>
            </div>
        </section>
        
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-container">
                <!-- Logo and About Section -->
                <div class="footer-logo-section">
                    <div class="footer-logo">Joan of Arc Youth</div>
                    <p class="footer-tagline">Empowering the Youth, Igniting Purpose</p>
                    <p class="footer-about-text">We're a youth organization dedicated to building leadership skills, community service, and personal growth through meaningful activities and programs.</p>
                    <div class="social-icons">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="GitHub"><i class="fab fa-github"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                        <a href="#" aria-label="Phone"><i class="fas fa-phone"></i></a>
                        <a href="#" aria-label="Email"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Information Links -->
                <div class="footer-column">
                    <h3 class="footer-title">Information</h3>
                    <ul class="footer-links">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Programs</a></li>
                        <li><a href="#">Activities</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                
                <!-- Useful Links -->
                <div class="footer-column">
                    <h3 class="footer-title">Useful Links</h3>
                    <ul class="footer-links">
                        <li><a href="#">Know More</a></li>
                        <li><a href="#">Volunteer</a></li>
                        <li><a href="#">Donate</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
                
                <!-- Location and Subscribe -->
                <div class="footer-column">
                    <h3 class="footer-title">Location</h3>
                    <p class="footer-location">673 Quirino Hwy, Novaliches<br/>Quezon City, Metro Manila</p>
                    <p class="footer-location">Email: info@joanarcyouth.org<br/>Phone: +63 123 456 7890</p>
                    
                    <h3 class="footer-title">Subscribe on us:</h3>
                    <div class="subscribe-form">
                        <input type="email" class="subscribe-input" placeholder="Email" />
                        <button type="button" class="subscribe-btn">Submit</button>
                    </div>
                </div>
            </div>
            
            <!-- Copyright Section -->
            <div class="copyright">
                © 2025 - 2026 Joan Arc Youth Organization. All rights reserved.
            </div>
        </footer>
        </form>


        
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

            

                // Smooth scrolling for anchor links
                document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                    anchor.addEventListener('click', function (e) {
                        e.preventDefault();

                        const targetId = this.getAttribute('href');
                        if (targetId === '#') return;

                        const targetElement = document.querySelector(targetId);
                        if (targetElement) {
                            targetElement.scrollIntoView({
                                behavior: 'smooth',
                                block: 'start'
                            });

                            // Close mobile menu if open
                            if (navLinks.classList.contains('active')) {
                                navLinks.classList.remove('active');
                            }
                        }
                    });
                });

                // Program card hover effects
                const programCards = document.querySelectorAll('.program-card');
                programCards.forEach(card => {
                    card.addEventListener('mouseenter', function () {
                        this.querySelector('.program-image img').style.transform = 'scale(1.05)';
                    });

                    card.addEventListener('mouseleave', function () {
                        this.querySelector('.program-image img').style.transform = 'scale(1)';
                    });
                });

                // Form validation for subscribe
                const subscribeForm = document.querySelector('.subscribe-form');
                const subscribeInput = document.querySelector('.subscribe-input');
                const subscribeBtn = document.querySelector('.subscribe-btn');

                if (subscribeBtn && subscribeInput) {
                    subscribeBtn.addEventListener('click', function () {
                        const email = subscribeInput.value.trim();
                        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                        if (!email) {
                            alert('Please enter your email address.');
                            return;
                        }

                        if (!emailRegex.test(email)) {
                            alert('Please enter a valid email address.');
                            return;
                        }

                        // Here you would typically send the data to a server
                        alert('Thank you for subscribing to our newsletter!');
                        subscribeInput.value = '';
                    });
                }

                // Initialize current year for copyright
                const currentYear = new Date().getFullYear();
                const copyrightElement = document.querySelector('.copyright');
                if (copyrightElement) {
                    copyrightElement.innerHTML = `© ${currentYear} - ${currentYear + 1} Joan Arc Youth Organization. All rights reserved.`;
                }
            });

            function redirectToJoinNow() {
                // Redirects to Landingpage.aspx and scrolls to the form section with the ID 'joinNowSection'
                window.location.href = 'Landingpage.aspx#joinNowSection';
            }
        </script>
    </body>
    </html>