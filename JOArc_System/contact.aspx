<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="JOArc_System.contact" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us - Joan Arc Youth Organization</title>
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
        .contact-header {
            background-image: linear-gradient(90deg,rgba(0, 2, 3, 1) 0%, rgba(31, 26, 0, 1) 51%, rgba(92, 73, 0, 1) 100%);
            background-size: cover;
            background-position: center;
            color: white;
            padding: 80px 20px;
            text-align: center;
        }
        
        .contact-header h1 {
            font-size: 2.5em;
            font-family: 'Arial Black';
            color: white;
            margin-bottom: 15px;
        }
        
        .contact-header p {
            font-size: 1.1em;
            max-width: 800px;
            margin: 0 auto;
        }

        /* Contact Container */
        .contact-container {
            max-width: 1200px;
            margin: 50px auto;
            padding: 0 20px;
        }

        .contact-section-title {
            color: #ba8c00;
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            font-size: 28px;
        }
        
        .contact-section-title::after {
            content: '';
            display: block;
            width: 60px;
            height: 3px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
            margin: 10px auto 0;
        }

        /* Contact Info and Form Layout */
        .contact-content {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: space-between;
        }

        /* Contact Information Section */
        .contact-info {
            flex: 1;
            min-width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .info-title {
            color: #ba8c00;
            font-size: 22px;
            margin-bottom: 20px;
            position: relative;
        }
        
        .info-title::after {
            content: '';
            display: block;
            width: 40px;
            height: 3px;
            background: #ffc30f;
            margin-top: 8px;
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .info-icon {
            background-color: #f5f5f5;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #ba8c00;
            transition: all 0.3s ease;
        }

        .info-item:hover .info-icon {
            background-color: #ba8c00;
            color: white;
            transform: translateY(-3px);
        }

        .info-content h4 {
            margin: 0 0 5px;
            color: #333;
        }

        .info-content p, .info-content a {
            margin: 0;
            color: #555;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .info-content a:hover {
            color: #ba8c00;
        }

        /* Social Media Links */
        .social-links {
            margin-top: 30px;
        }

        .social-links h4 {
            margin-bottom: 15px;
            color: #333;
        }

        .social-icons {
            display: flex;
            gap: 15px;
        }

        .social-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #f5f5f5;
            color: #555;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .social-icon:hover {
            background-color: #ba8c00;
            color: white;
            transform: translateY(-3px);
        }

        /* Contact Form Section */
        .contact-form {
            flex: 1.5;
            min-width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .form-title {
            color: #ba8c00;
            font-size: 22px;
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-title::after {
            content: '';
            display: block;
            width: 40px;
            height: 3px;
            background: #ffc30f;
            margin-top: 8px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #ba8c00;
            outline: none;
        }

        .form-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .form-col {
            flex: 1;
            min-width: 250px;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .submit-btn {
            background-color: #ba8c00;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #8a6103;
        }

        /* Map Section */
        .map-section {
            margin-top: 50px;
        }

        .map-container {
            width: 100%;
            height: 400px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        /* Office Hours Section */
        .office-hours {
            background-color: #f5f5f5;
            padding: 50px 20px;
            margin: 70px 0;
        }

        .hours-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 40px;
        }

        .hours-image {
            flex: 1;
            min-width: 300px;
        }

        .hours-image img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.12);
        }

        .hours-info {
            flex: 1;
            min-width: 300px;
        }

        .hours-info h2 {
            color: #ba8c00;
            margin-bottom: 15px;
            font-size: 1.8em;
        }

        .hours-info p {
            margin-bottom: 15px;
            line-height: 1.6;
            color: #444;
        }

        .hours-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .hours-table th, .hours-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .hours-table th {
            font-weight: bold;
            color: #333;
        }

        .hours-closed {
            color: #e74c3c;
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
            .contact-content {
                flex-direction: column;
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
            .contact-header h1 {
                font-size: 2em;
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
            
            .hours-container {
                flex-direction: column;
            }
            
            .footer-column {
                flex: 0 0 100%;
            }
            
            .form-row {
                flex-direction: column;
                gap: 0;
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
                    <li><a href="program.aspx">Programs</a></li>
                    <li><a href="activity.aspx">Activities</a></li>
                    <li><a href="contact.aspx" class="active">Contact</a></li>
                    <li><a href="donation.aspx">Donate</a></li>
                    
                </ul>
            </div>
        </nav>
        
        <!-- Header Section -->
        <header class="contact-header">
            <h1>GET IN TOUCH WITH US</h1>
            <p>Have questions about our programs? Want to join our community? Reach out to us and we'll be happy to help.</p>
        </header>
        
        <!-- Contact Section -->
        <div class="contact-container">
            <h2 class="contact-section-title">Contact Information</h2>
            <div class="contact-content">
                <!-- Contact Information -->
                <div class="contact-info">
                    <h3 class="info-title">How to Reach Us</h3>
                    
                    <!-- Address -->
                    <div class="info-item">
                        <div class="info-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div class="info-content">
                            <h4>Our Location</h4>
                            <p>673 Quirino Hwy, Novaliches</p>
                            <p>Quezon City, Metro Manila</p>
                        </div>
                    </div>
                    
                    <!-- Phone -->
                    <div class="info-item">
                        <div class="info-icon">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <div class="info-content">
                            <h4>Call Us</h4>
                            <p><a href="tel:+6312345678">+63 123 456 7890</a></p>
                            <p><a href="tel:+6387654321">+63 876 543 2100</a></p>
                        </div>
                    </div>
                    
                    <!-- Email -->
                    <div class="info-item">
                        <div class="info-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div class="info-content">
                            <h4>Email Us</h4>
                            <p><a href="mailto:info@joanarcyouth.org">info@joanarcyouth.org</a></p>
                            <p><a href="mailto:support@joanarcyouth.org">support@joanarcyouth.org</a></p>
                        </div>
                    </div>
                    
                    <!-- Hours -->
                    <div class="info-item">
                        <div class="info-icon">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="info-content">
                            <h4>Office Hours</h4>
                            <p>Monday - Friday: 9:00 AM - 5:00 PM</p>
                            <p>Saturday: 9:00 AM - 12:00 PM</p>
                        </div>
                    </div>
                    
                    <!-- Social Media Links -->
                    <div class="social-links">
                        <h4>Connect With Us</h4>
                        <div class="social-icons">
                            <a href="#" class="social-icon" aria-label="Facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="social-icon" aria-label="Instagram">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="#" class="social-icon" aria-label="Twitter">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="social-icon" aria-label="LinkedIn">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                            <a href="#" class="social-icon" aria-label="YouTube">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                </div>
                
                <!-- Contact Form -->
                <div class="contact-form">
                    <h3 class="form-title">Send Us a Message</h3>
                    <p>Fill out the form below, and we'll get back to you as soon as possible.</p>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input type="text" id="firstName" class="form-control" placeholder="Your first name" runat="server" />
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <input type="text" id="lastName" class="form-control" placeholder="Your last name" runat="server" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" class="form-control" placeholder="Your email address" runat="server" />
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" class="form-control" placeholder="Your phone number" runat="server" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" class="form-control" placeholder="What is this regarding?" runat="server" />
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" class="form-control" placeholder="Type your message here..." runat="server"></textarea>
                    </div>
                    
                    <button type="submit" class="submit-btn">Send Message</button>
                </div>
            </div>
        </div>
        
        <!-- Map Section -->
        <div class="contact-container map-section">
            <h2 class="contact-section-title">Our Location</h2>
            <div class="map-container">
                <!-- Replace with actual map embed code -->
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15437.058375576297!2d121.03252793955077!3d14.67994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397b706839c27c5%3A0x7e00a7cce4306c59!2sNovaliches%2C%20Quezon%20City%2C%20Metro%20Manila!5e0!3m2!1sen!2sph!4v1715377269103!5m2!1sen!2sph" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
        
        <!-- Office Hours Section -->
        <section class="office-hours">
            <div class="hours-container">
                <div class="hours-image">
                    <img src="IMAGES/party.jpg" alt="Our Office" />
                </div>
                <div class="hours-info">
                    <h2>Visit Our Office</h2>
                    <p>We welcome visitors during our office hours. Whether you want to learn more about our programs, volunteer opportunities, or just to say hello, our door is always open!</p>
                    
                    <h3>Office Hours</h3>
                    <table class="hours-table">
                        <tr>
                            <th>Day</th>
                            <th>Hours</th>
                        </tr>
                        <tr>
                            <td>Monday</td>
                            <td>9:00 AM - 5:00 PM</td>
                        </tr>
                        <tr>
                            <td>Tuesday</td>
                            <td>9:00 AM - 5:00 PM</td>
                        </tr>
                        <tr>
                            <td>Wednesday</td>
                            <td>9:00 AM - 5:00 PM</td>
                        </tr>
                        <tr>
                            <td>Thursday</td>
                            <td>9:00 AM - 5:00 PM</td>
                        </tr>
                        <tr>
                            <td>Friday</td>
                            <td>9:00 AM - 5:00 PM</td>
                        </tr>
                        <tr>
                            <td>Saturday</td>
                            <td>9:00 AM - 12:00 PM</td>
                        </tr>
                        <tr>
                            <td>Sunday</td>
                            <td class="hours-closed">Closed</td>
                        </tr>
                    </table>
                    
                    <p><strong>Note:</strong> For special appointments outside office hours, please contact us in advance.</p>
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
                        <li><a href="Landingpage.aspx">Home</a></li>
                        <li><a href="about.aspx">About</a></li>
                        <li><a href="program.aspx">Programs</a></li>
                        <li><a href="activity.aspx">Activities</a></li>
                        <li><a href="contact.aspx" class="active">Contact</a></li>
                        <li><a href="donation.aspx">Donate</a></li>
                    </ul>
                </div>
                
                <!-- Useful Links -->
                <div class="footer-column">
                    <h3 class="footer-title">Useful Links</h3>
                    <ul class="footer-links">
                        <li><a href="#">Know More</a></li>
                        <li><a href="#">Volunteer</a></li>
                        <li><a href="donation.aspx">Donate</a></li>
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
                        <input type="email" class="subscribe-input" placeholder="Enter your email" runat="server" id="newsletterEmail" />
                        <button type="button" class="subscribe-btn">Subscribe</button>
                    </div>
                </div>
            </div>
            
            <!-- Copyright Section -->
            <div class="copyright">
                <p>&copy; 2025 Joan Arc Youth Organization. All Rights Reserved.</p>
            </div>
        </footer>
        
        <!-- JavaScript for mobile menu toggle -->
        <script>
            document.getElementById('menuToggle').addEventListener('click', function() {
                document.getElementById('navLinks').classList.toggle('active');
            });
            
            // Close the menu when clicking a link (for mobile)
            const navLinks = document.querySelectorAll('.nav-links li a');
            navLinks.forEach(link => {
                link.addEventListener('click', function() {
                    if (window.innerWidth <= 768) {
                        document.getElementById('navLinks').classList.remove('active');
                    }
                });
            });
        </script>
    </form>
</body>
</html>