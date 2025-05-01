<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JOArc_System.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Joan Arc Youth Organization</title>

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
            background-color: gainsboro;
            padding: 20px 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
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
        }

        .nav-links li a:hover {
            color: #ba8c00;
        }

        .login-btn {
            background-color:#ffc30f;
            border: none;
            padding: 12px 30px;
            font-family : Arial;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-btn:hover {
            background-color: #002c94;
        }

        .header {
            background-image: url('IMAGES/orgimg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header h1 {
            font-size: 60px;
            font-weight: bold;
            font-family: 'Arial Black';
        }

        .header p {
            font-size: 24px;
            margin-top: 10px;
            font-family: Arial;
        }

       .know-more-btn {
    margin-top: 35px;
    padding-right: 40px;
    padding: 15px 30px;
    padding-left: 40px;
    background-color: #ffc30f;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 30px;
    cursor: pointer;
    text-transform: uppercase;
    color: #333;
    display: inline-flex;
    align-items: center;
    gap: 10px;
    transition: all 0.3s ease;
    overflow: hidden;
    position: relative;
}

.know-more-btn .arrow {
    display: inline-block;
    font-size: 20px;
    font-weight: bold;
    transform: translateX(-10px);
    opacity: 0;
    transition: all 0.3s ease;
}

.know-more-btn:hover {
    background-color: #ba8c00;
    transform: scale(1.05);
    color: white;
    padding-right: 50px; /* makes space for the arrow */
}

.know-more-btn:hover .arrow {
    transform: translateX(0);
    opacity: 1;
}




        .section {
            display: flex;
            flex-wrap: wrap;
            padding: 40px 20px;
            background-color: white;
        }

        .map {
            width: 100%;
            max-width: 50%;
        }

        .map img {
            width: 100%;
            height: auto;
        }

        .info {
            width: 100%;
            max-width: 50%;
            padding: 0 20px;
        }

        .info h3 {
            font-size: 20px;
            font-family: 'Arial Black';
        }

        .info p {
            font-size: 18px;
            margin-top: 10px;
            font-family: Calibri ;
        }

        .register-btn {
            margin-top: 15px;
            padding: 15px 30px;
            background-color: #ffc30f;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 8px;
        }

        .register-btn:hover {
            background-color: #ba8c00;
            transform: scale(1.05);
        }

        .activities {
            padding: 40px 0;
            text-align: center;
        }

        .activities h3 {
            font-weight: bold;
            font-size: 25px;
            margin-bottom: 50px;
            position: relative;
        }

        .activities h3::after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background-color: #ffc30f;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .gallery {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin: 0 auto;
            max-width: 1200px;
            margin-bottom: 50px;
        }

        .gallery img {
            width: 100%;
            max-width: 500px;
            height: 300px;
            border-radius: 10px;
        }

        .activity-card {
            width: 350px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .activity-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            display: block;
            border-radius: 10px 10px 0 0;
        }

        .caption {
            padding: 20px;
            font-weight: 600;
            background-color: #f5f5f5;
            margin: 0;
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
        
        .footer-links a {
            color: #555;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 14px;
        }
        
        .footer-links a:hover {
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

        @media (max-width: 768px) {
            .section {
                flex-direction: column;
            }

            .map, .info {
                max-width: 100%;
            }

            .gallery img {
                max-width: 100%;
            }
            
            .footer-container {
                flex-direction: column;
            }
            
            .footer-column {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation Bar -->
        <nav class="navbar" data-aos-duration="800">
            <div class="nav-container">
                <div class="nav-logo">Joan of Arc Youth</div>
                <ul class="nav-links">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Programs</a></li>
                    <li><a href="#">Activities</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <button class="login-btn">Log In</button>
            </div>
        </nav>

        <!-- Hero Banner -->
        <div class="header" data-aos="fade-up" data-aos-duration="1500">
            <h1>Joan Arc Youth Organization:</h1>
            <p>Empowering the Youth,
                Igniting Purpose, and<br />
                Leading with Courage!</p>

            <button class="know-more-btn">
                KNOW MORE <span class="arrow">↓</span>
            </button>
        </div>

        <!-- Info + Map Section -->
        <div class="section">
            <div class="info" data-aos="fade-left" data-aos-duration="1000">
                <h3>ARE YOU A YOUNG LEADER READY TO MAKE A DIFFERENCE IN YOUR COMMUNITY?</h3>
                <p>You're in the right place! Our organization empowers youth with leadership opportunities, skill-building programs, and community initiatives to help you grow and make a real impact.</p>
                <button type="button" class="register-btn">REGISTER NOW!</button>
            </div>
        </div>

        <!-- Activities Section -->
        <div class="activities" data-aos="zoom-in-up" data-aos-duration="1200">
            <h3>RECENTS ACTIVITIES</h3>
            <div class="gallery">
                <div class="activity-card">
                    <img src="IMAGES/bingo.jpg" alt="Bingo Project" />
                    <p class="caption">Bingo Project</p>
                </div>
                <div class="activity-card">
                    <img src="IMAGES/party.jpg" alt="Christmas Party" />
                    <p class="caption">Christmas Party</p>
                </div>
                <div class="activity-card">
                    <img src="IMAGES/clean.jpg" alt="Clean Up Drive" />
                    <p class="caption">Clean-Up Drive</p>
                </div>
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
                        <li><a href="#">Register</a></li>
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

    <!-- AOS JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init();

        // Register button alert
        document.querySelector('.register-btn').addEventListener('click', function () {
            alert('Redirecting to registration...');
            // window.location.href = 'Register.aspx';
        });

        // Login button alert
        document.querySelector('.login-btn').addEventListener('click', function () {
            alert('Redirecting to login...');
            // window.location.href = 'Login.aspx';
        });

        // Subscribe button alert
        document.querySelector('.subscribe-btn').addEventListener('click', function () {
            var email = document.querySelector('.subscribe-input').value;
            if (email) {
                alert('Thank you for subscribing with: ' + email);
                document.querySelector('.subscribe-input').value = '';
            } else {
                alert('Please enter a valid email address.');
            }
        });
    </script>
</body>
</html>