<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="donation.aspx.cs" Inherits="JOArc_System.donation" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Donate to Joan Arc Youth Organization</title>
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

        /* Donation Header Section */
        .donation-header {
            background-image:linear-gradient(90deg,rgba(0, 2, 3, 1) 0%, rgba(31, 26, 0, 1) 51%, rgba(92, 73, 0, 1) 100%);
 background-size: cover;
 background-position: center;
 color: white;
 padding: 80px 20px;
 margin-bottom: 40px;
 text-align: center;
        }
        
        .donation-header h1 {
            font-size: 3em;
            margin-bottom: 20px;
            color: White;
            font-family: 'Arial Black';
        }
        
        .donation-header p {
            font-size: 18px;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Donation Form Section */
        .donation-container {
            max-width: 1200px;
            margin: 0 auto 70px;
            padding: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            justify-content: center;
        }
        
        .donation-form-container {
            flex: 1;
            min-width: 300px;
            max-width: 600px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        
        .donation-form-title {
            color: #ba8c00;
            font-size: 24px;
            margin-bottom: 25px;
            text-align: center;
            position: relative;
        }
        
        .donation-form-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }
        
        .form-control {
            width: 100%;
            max-width: 570px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            font-family: Arial;
            transition: border-color 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #ba8c00;
            outline: none;
        }
        
        .amount-options {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .amount-option {
            flex: 1;
            min-width: 80px;
            padding: 12px;
            background-color: #f9f9f9;
            border: 2px solid #ddd;
            border-radius: 4px;
            text-align: center;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .amount-option:hover {
            background-color: #f0f0f0;
            border-color: #ccc;
        }
        
        .amount-option.active {
            background-color: #ffebc1;
            border-color: #ffc30f;
            color: #ba8c00;
        }
        
        .custom-amount {
            width: 100%;
            margin-top: 15px;
        }
        
        .donation-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 14px 25px;
            width: 100%;
            border-radius: 4px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        
        .donation-btn:hover {
            background-color: #ba8c00;
            color: white;
        }

        /* Donation Impact Section */
        .donation-impact {
            flex: 1;
            min-width: 300px;
            max-width: 500px;
        }
        
        .impact-title {
            color: #ba8c00;
            font-size: 24px;
            margin-bottom: 25px;
            position: relative;
        }
        
        .impact-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, #ba8c00, #ffc30f);
        }
        
        .impact-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 40px;
        }
        
        .impact-icon {
            background-color: #ffebc1;
            color: #ba8c00;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 20px;
            margin-right: 15px;
            margin-bottom: 20px;
            flex-shrink: 0;
        }
        
        .impact-content h4 {
            margin: 0 0 8px;
            color: #333;
        }
        
        .impact-content p {
            margin: 0;
            color: #666;
            line-height: 1.6;
        }

        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2000;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
        }
        
        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }
        
        .payment-modal {
            background-color: white;
            border-radius: 8px;
            padding: 30px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-20px);
            transition: transform 0.3s ease;
        }
        
        .modal-overlay.active .payment-modal {
            transform: translateY(0);
        }
        
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .modal-title {
            font-size: 22px;
            color: #ba8c00;
            margin: 0;
        }
        
        .close-modal {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #666;
            transition: color 0.3s ease;
        }
        
        .close-modal:hover {
            color: #333;
        }
        
        .payment-options {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        
        .payment-option {
            border: 2px solid #eee;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .payment-option:hover {
            border-color: #ffc30f;
            background-color: #fffbf2;
        }
        
        .payment-option.active {
            border-color: #ffc30f;
            background-color: #ffebc1;
        }
        
        .payment-logo {
            width: 70px;
            height: 70px;
            object-fit: contain;
            margin-right: 15px;
        }
        
        .payment-details {
            flex: 1;
        }
        
        .payment-name {
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .payment-description {
            font-size: 14px;
            color: #666;
        }
        
        .payment-qr {
            text-align: center;
            margin: 30px 0;
            display: none;
        }
        
        .payment-qr.active {
            display: block;
        }
        
        .payment-qr img {
            max-width: 200px;
            border: 1px solid #eee;
            padding: 10px;
            border-radius: 8px;
        }
        
        .payment-qr p {
            margin-top: 10px;
            font-weight: 600;
            color: #666;
        }
        
        .payment-instructions {
            background-color: #f9f9f9;
            border-radius: 6px;
            padding: 15px;
            margin-top: 20px;
        }
        
        .payment-instructions h4 {
            margin-top: 0;
            color: #ba8c00;
        }
        
        .payment-instructions ol {
            margin: 10px 0 0;
            padding-left: 20px;
        }
        
        .payment-instructions li {
            margin-bottom: 8px;
        }
        
        .confirm-payment-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 12px 25px;
            width: 100%;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 20px;
        }
        
        .confirm-payment-btn:hover {
            background-color: #ba8c00;
            color: white;
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

        /* Mobile Styles */
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
            
            .donation-header h1 {
                font-size: 2.5em;
            }
            
            .donation-header p {
                font-size: 16px;
            }
            
            .footer-column {
                flex: 0 0 100%;
            }
        }

        @media (max-width: 576px) {
            .donation-header {
                padding: 60px 15px;
            }
            
            .donation-header h1 {
                font-size: 2em;
            }
            
            .donation-form-container, .donation-impact {
                min-width: 100%;
            }
            
            .amount-options {
                flex-direction: column;
            }
            
            .amount-option {
                width: 100%;
            }
            
            .footer-logo-section, .footer-column {
                padding: 0 10px;
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
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="program.aspx">Programs</a></li>
                    <li><a href="activity.aspx">Activities</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                    <li><a href="donation.aspx" class="active">Donate</a></li>
                </ul>
            </div>
        </nav>
        
        <!-- Donation Header Section -->
        <header class="donation-header">
            <img src="IMAGES/logo.bg.png" />
            <h1>Support Our Cause</h1>
            <p>Your donation empowers youth leadership, promotes community service, and helps build a brighter future. Every contribution, no matter the size, makes a meaningful difference.</p>
        </header>
        
        <!-- Donation Form Section -->
        <div class="donation-container">
            <div class="donation-form-container">
                <h2 class="donation-form-title">Make a Donation</h2>
                
                <div class="form-group">
                    <label>Choose Amount</label>
                    <div class="amount-options">
                        <div class="amount-option" data-amount="100">₱100</div>
                        <div class="amount-option" data-amount="300">₱300</div>
                        <div class="amount-option" data-amount="500">₱500</div>
                        <div class="amount-option" data-amount="1000">₱1000</div>
                    </div>
                    <div class="custom-amount">
                        <input type="text" class="form-control" id="customAmount" placeholder="Custom Amount (₱)" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" class="form-control" id="fullName" placeholder="Enter your full name" />
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter your email address" />
                </div>
                
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" class="form-control" id="phoneNumber" placeholder="Enter your phone number" />
                </div>
                
                <div class="form-group">
                    <label for="message">Message (Optional)</label>
                    <textarea class="form-control" id="message" rows="4" placeholder="Share why you're donating or any specific programs you'd like to support"></textarea>
                </div>
                
                <button type="button" class="donation-btn" id="donateBtn">Donate Now</button>
            </div>
            
            <div class="donation-impact">
                <h2 class="impact-title">Your Impact</h2>
                
                <div class="impact-item">
                    <div class="impact-icon">
                        <i class="fas fa-graduation-cap"></i>
       
                    </div>
                    <div class="impact-content">
                        <h4>Leadership Development</h4>
                        <p>Your donation helps fund leadership workshops and trainings that empower youth with essential skills for the future.</p>
                    </div>
                </div>
                
                <div class="impact-item">
                    <div class="impact-icon">
                        <i class="fas fa-hands-helping"></i>
                    </div>
                    <div class="impact-content">
                        <h4>Community Service</h4>
                        <p>Support community outreach programs that enable young people to make a positive difference in their neighborhoods.</p>
                    </div>
                </div>
                
                <div class="impact-item">
                    <div class="impact-icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="impact-content">
                        <h4>Educational Resources</h4>
                        <p>Help provide books, materials, and educational resources for youth who lack access to quality learning tools.</p>
                    </div>
                </div>
                
                <div class="impact-item">
                    <div class="impact-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="impact-content">
                        <h4>Mentorship Programs</h4>
                        <p>Fund mentorship initiatives that connect experienced leaders with young individuals seeking guidance and support.</p>
                    </div>
                </div>
                
                <div class="impact-item">
                    <div class="impact-icon">
                        <i class="fas fa-campground"></i>
                    </div>
                    <div class="impact-content">
                        <h4>Youth Camps & Retreats</h4>
                        <p>Support immersive experiences that build character, foster teamwork, and create lasting friendships.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Payment Modal -->
        <div class="modal-overlay" id="paymentModal">
            <div class="payment-modal">
                <div class="modal-header">
                    <h3 class="modal-title">Choose Payment Method</h3>
                    <button class="close-modal" id="closeModal">&times;</button>
                </div>
                
                <div class="payment-options">
                    <div class="payment-option" data-payment="gcash">
                        <img src="IMAGES/gcash.jpg" alt="GCash Logo" class="payment-logo" id="gcashLogo" />
                        <div class="payment-details">
                            <div class="payment-name">GCash</div>
                            <div class="payment-description">Fast and secure mobile payment</div>
                        </div>
                    </div>
                    
                    <div class="payment-option" data-payment="maya">
                        <img src="IMAGES/maya.jpg" alt="Maya Logo" class="payment-logo" id="mayaLogo" />
                        <div class="payment-details">
                            <div class="payment-name">Maya</div>
                            <div class="payment-description">Digital banking and payment platform</div>
                        </div>
                    </div>
                </div>
                
                <div class="payment-qr" id="gcashQR">
                    <img src="IMAGES/gcashqr.jpg" alt="GCash QR Code" />
                    <p>Scan this QR code with your GCash app</p>
                </div>
                
                <div class="payment-qr" id="mayaQR">
                    <img src="IMAGES/mayaqr.jpg" alt="Maya QR Code" />
                    <p>Scan this QR code with your Maya app</p>
                </div>
                
                <div class="payment-instructions">
                    <h4>How to Pay:</h4>
                    <ol>
                        <li>Open your payment app</li>
                        <li>Scan the QR code</li>
                        <li>Enter the amount: <span id="donationAmount">₱500</span></li>
                        <li>Complete the payment in your app</li>
                        <li>Return here and click "I've Completed Payment"</li>
                    </ol>
                </div>
                
                <button class="confirm-payment-btn" id="confirmPaymentBtn">I've Completed Payment</button>
            </div>
        </div>
        
        <!-- Footer Section -->
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
                        <li><a href="programs.aspx">Programs</a></li>
                        <li><a href="activity.aspx">Activities</a></li>
                        <li><a href="donation.aspx">Donate</a></li>
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
                      <button type="button" class="subscribe-btn">Subscribe</button>
                    </div>
                </div>
            </div>
            <div class="copyright">
                &copy; 2025 Joan of Arc Youth Organization. All Rights Reserved.
            </div>
        </footer>
    </form>

    <!-- JavaScript -->
    <script>
        // Toggle mobile menu
        document.getElementById('menuToggle').addEventListener('click', function() {
            document.getElementById('navLinks').classList.toggle('active');
        });

        // Amount Selection
        const amountOptions = document.querySelectorAll('.amount-option');
        const customAmountInput = document.getElementById('customAmount');
        let selectedAmount = 500; // Default amount

        amountOptions.forEach(option => {
            option.addEventListener('click', function() {
                // Remove active class from all options
                amountOptions.forEach(opt => opt.classList.remove('active'));
                
                // Add active class to clicked option
                this.classList.add('active');
                
                // Update selected amount
                selectedAmount = parseInt(this.getAttribute('data-amount'));
                
                // Clear custom amount input
                customAmountInput.value = '';
                
                // Update amount in payment modal
                document.getElementById('donationAmount').textContent = '₱' + selectedAmount;
            });
        });

        // Set default active amount
        document.querySelector('.amount-option[data-amount="500"]').classList.add('active');

        // Custom amount input handler
        customAmountInput.addEventListener('input', function() {
            // Remove active class from all preset options
            amountOptions.forEach(opt => opt.classList.remove('active'));
            
            // Update selected amount if input is not empty
            if (this.value.trim() !== '') {
                selectedAmount = parseInt(this.value);
                
                // Update amount in payment modal
                document.getElementById('donationAmount').textContent = '₱' + selectedAmount;
            } else {
                // Default to 500 if input is cleared
                selectedAmount = 500;
                document.getElementById('donationAmount').textContent = '₱' + selectedAmount;
                document.querySelector('.amount-option[data-amount="500"]').classList.add('active');
            }
        });

        // Payment Modal
        const donateBtn = document.getElementById('donateBtn');
        const paymentModal = document.getElementById('paymentModal');
        const closeModal = document.getElementById('closeModal');
        const paymentOptions = document.querySelectorAll('.payment-option');
        const gcashQR = document.getElementById('gcashQR');
        const mayaQR = document.getElementById('mayaQR');
        const confirmPaymentBtn = document.getElementById('confirmPaymentBtn');

        // Open payment modal
        donateBtn.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Simple form validation
            const fullName = document.getElementById('fullName').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phoneNumber').value;
            
            if (!fullName || !email || !phone) {
                alert('Please fill in all required fields.');
                return;
            }
            
            // Update donation amount in modal
            document.getElementById('donationAmount').textContent = '₱' + selectedAmount;
            
            // Show modal
            paymentModal.classList.add('active');
            
            // Disable scrolling on the body
            document.body.style.overflow = 'hidden';
        });

        // Close payment modal
        closeModal.addEventListener('click', function() {
            paymentModal.classList.remove('active');
            
            // Re-enable scrolling
            document.body.style.overflow = 'auto';
            
            // Reset payment options
            paymentOptions.forEach(opt => opt.classList.remove('active'));
            gcashQR.classList.remove('active');
            mayaQR.classList.remove('active');
        });

        // Payment option selection
        paymentOptions.forEach(option => {
            option.addEventListener('click', function() {
                // Remove active class from all options
                paymentOptions.forEach(opt => opt.classList.remove('active'));
                
                // Add active class to clicked option
                this.classList.add('active');
                
                // Hide all QR codes
                gcashQR.classList.remove('active');
                mayaQR.classList.remove('active');
                
                // Show the relevant QR code
                const paymentMethod = this.getAttribute('data-payment');
                if (paymentMethod === 'gcash') {
                    gcashQR.classList.add('active');
                } else if (paymentMethod === 'maya') {
                    mayaQR.classList.add('active');
                }
            });
        });

        // Confirm payment button
        confirmPaymentBtn.addEventListener('click', function() {
            // Check if a payment method is selected
            const activePayment = document.querySelector('.payment-option.active');
            
            if (!activePayment) {
                alert('Please select a payment method.');
                return;
            }
            
            // Close modal
            paymentModal.classList.remove('active');
            
            // Re-enable scrolling
            document.body.style.overflow = 'auto';
            
            // Show thank you message or redirect
            alert('Thank you for your donation! Your support makes a difference.');
            
            // Reset form
            document.getElementById('form1').reset();
            
            // Reset payment options
            paymentOptions.forEach(opt => opt.classList.remove('active'));
            gcashQR.classList.remove('active');
            mayaQR.classList.remove('active');
            
            // Reset amount options
            amountOptions.forEach(opt => opt.classList.remove('active'));
            document.querySelector('.amount-option[data-amount="500"]').classList.add('active');
            selectedAmount = 500;
        });

        // Close modal if clicked outside of content
        paymentModal.addEventListener('click', function(e) {
            if (e.target === paymentModal) {
                paymentModal.classList.remove('active');
                document.body.style.overflow = 'auto';
            }
        });
    </script>
</body>
</html>