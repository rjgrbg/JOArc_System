<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="JOArc_System.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Joan Arc Youth Organization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- AOS CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <!-- Font Awesome for social icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link rel="icon" type="image/png" href="IMAGES/logo.png"/>


    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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

        .header {
            background-image: url('IMAGES/orgimg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
            min-height: 450px;
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
            padding-right: 30px;
            padding: 15px 20px;
            padding-left: 40px;
            background-color: #ffc30f;
            font-size: 15px;
            font-family: 'Arial Black';
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

        .know-more-btn .arrow{
            display: inline-block;
            font-size: 20px;
            font-weight: bold;
            transform: translateX(90px);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .know-more-btn:hover {
            background-color: #ba8c00;
            transform: scale(1.05);
            color: white;
            padding-right: 30px; /* makes space for the arrow */
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
.section img {
    margin-left: 350px; /* Increase this value from current setting */
    margin-right: 20px; /* Add this to create spacing on the right */
}

        .join-now-btn {
            margin-top: 35px;
   
            padding: 15px 20px;
            background-color: #ffc30f;
            font-size: 15px;
            font-family: 'Arial Black';
            font-weight: bold;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            text-transform: uppercase;
            color: #333;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            overflow: hidden;
            position: relative;
            text-align: center;
            width: 100%;
            max-width: 300px;
        }
        

        .join-now-btn:hover {
            background-color: #ba8c00;
            transform: scale(1.05);
            color: white;
            padding-right: 30px; /* makes space for the arrow */
        }

        .join-now-btn:hover {
            transform: translateX(0);
            opacity: 1;
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
    max-width: 45%; /* Reduce slightly from 50% */
    padding: 0 30px; /* Increase padding */
    display: flex;
    margin-left: 40px;
    flex-direction: column;
}

        .info h3 {
            font-size: 20px;
            font-family: 'Arial Black';
        }

        .info p {
            font-size: 18px;
            margin-top: 10px;
            font-family: Calibri;
        }

        .activities {
            padding: 40px 0;
            text-align: center;
        }

        .activities h3 {
            font-weight: bold;
            font-size: 30px;
            font-family: 'Arial Black';
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
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            position: relative;
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
            border-radius: 10px 10px 0 0;
            transition: transform 0.5s ease;
        }

        .activity-card:hover img {
            transform: scale(1.1);
        }

        .caption {
            padding: 20px;
            font-weight: 600;
            background-color: #f5f5f5;
            margin: 0;
            transition: background-color 0.3s ease;
        }

        .activity-card:hover .caption {
            background-color: #ffc30f;
            color: #333;
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
            border-radius: 10px 10px 0 0;
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

        /* Application Form Overlay Styles - UPDATED */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 2000;
            overflow-y: auto;
            padding: 20px;
        }

        .application-form {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
            width: 700px; /* New width */
            height: 550px; /* New height */
            padding: 30px 40px;
            position: relative;
            animation: fadeIn 0.4s ease;
            overflow-y: auto;
        }

        /* Custom scrollbar for the form */
        .application-form::-webkit-scrollbar {
            width: 8px;
        }

        .application-form::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        .application-form::-webkit-scrollbar-thumb {
            background: #ffc30f;
            border-radius: 10px;
        }

        .application-form::-webkit-scrollbar-thumb:hover {
            background: #ba8c00;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-header {
            text-align: center;
            margin-bottom: 25px;
            border-bottom: 3px solid #ffc30f;
            padding-bottom: 15px;
        }


        .form-header h2 {
            color: #333;
            font-family: 'Arial Black', sans-serif;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .form-header p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
            font-size: 15px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
            box-sizing: border-box; /* Add this to ensure padding doesn't affect width */
        }

        .form-control:focus {
            border-color: #ffc30f;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(255, 195, 15, 0.2);
            outline: none;
        }

        .form-group textarea {
            resize: vertical;
            width: 100%;
            min-height: 100px;
            font-family: Arial;
        }

    .form-buttons {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 30px;
    gap: 15px;
    width: 100%; /* Take full width of the parent */
}

.form-submit-btn,
.form-cancel-btn {
    padding: 18px 25px;
    border-radius: 30px;
    width: 100%; /* Full width of container */
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
    font-family: Arial;
    
    cursor: pointer;
    transition: all 0.3s ease;
    border: none;
}


.form-submit-btn {
    background-color: #ffc30f;
    color: #333;
}

.form-submit-btn:hover {
    background-color: #ba8c00;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(186, 140, 0, 0.3);
}

.form-cancel-btn {
    background-color:#e3e3e3;
    color: #555;
}

.form-cancel-btn:hover {
    background-color: #ddd;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}


        .close-btn {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 22px;
            background: none;
            border: none;
            cursor: pointer;
            color: #555;
            transition: all 0.3s ease;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .close-btn:hover {
            color: #ba8c00;
            background-color: #f5f5f5;
        }

        /* Success message styles */
.success-message {
    display: none;
    background-color: #f8fffa;
    border-left: 4px solid #28a745;
    padding: 25px;
    margin-bottom: 20px;
    color: #333;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 3px 15px rgba(0, 0, 0, 0.1);
    animation: fadeInUp 0.5s ease;
}

@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.success-message i {
    font-size: 48px;
    color: #28a745;
    margin-bottom: 15px;
    display: block;
}

.success-message h3 {
    color: #28a745;
    font-size: 22px;
    margin-bottom: 15px;
    font-family: 'Arial Black', sans-serif;
}

.success-message p {
    font-size: 16px;
    line-height: 1.6;
    margin-bottom: 20px;
}

.requirements-reminder {
    background-color: #fff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 20px;
    margin: 20px 0;
    text-align: left;
}

.requirements-reminder h4 {
    color: #ba8c00;
    font-size: 18px;
    margin-top: 0;
    margin-bottom: 10px;
    font-family: 'Arial Black', sans-serif;
}

.requirements-reminder ul {
    padding-left: 20px;
    margin-bottom: 15px;
}

.requirements-reminder li {
    margin-bottom: 8px;
    position: relative;
    padding-left: 5px;
}

.requirements-reminder li::before {
    content: '•';
    color: #ffc30f;
    font-weight: bold;
    display: inline-block;
    margin-right: 8px;
}

.success-message .form-submit-btn {
    margin-top: 15px;
    background-color: #ffc30f;
    color: #333;
    padding: 12px 30px;
    border-radius: 30px;
    font-weight: bold;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: uppercase;
    font-size: 16px;
}

.success-message .form-submit-btn:hover {
    background-color: #ba8c00;
    color: white;
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(186, 140, 0, 0.3);
}

        /* Required field indicator */
        .required::after {
            content: '*';
            color: #ff4136;
            margin-left: 4px;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 5px;
        }

        .form-row .form-group {
            flex: 1;
        }
        
        /* Form progress indicator */
        .form-progress {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            position: relative;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .form-progress::before {
            content: '';
            position: absolute;
            top: 14px;
            left: 0;
            height: 2px;
            width: 100%;
            background-color: #e0e0e0;
            z-index: 1;
        }
        
        .progress-step {
            position: relative;
            z-index: 2;
            text-align: center;
        }
        
        .step-icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555;
            font-weight: bold;
            margin: 0 auto 8px;
            transition: all 0.3s ease;
        }
        
        .step-label {
            font-size: 12px;
            color: #555;
            font-weight: 600;
        }
        
        .progress-step.active .step-icon {
            background-color: #ffc30f;
            color: #333;
        }
        
        .progress-step.active .step-label {
            color: #333;
        }
        
        /* Form section title */
        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
            border-left: 3px solid #ffc30f;
            padding-left: 10px;
        }
        
        /* Checkbox styling */
        .checkbox-wrapper {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .checkbox-wrapper input[type="checkbox"] {
            margin-right: 10px;
            width: 18px;
            height: 18px;
            accent-color: #ffc30f;
        }
        
        .checkbox-label {
            font-size: 14px;
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
            
            .section {
                flex-direction: column;
            }

            .map, .info {
                max-width: 100%;
                padding: 0;
                margin-bottom: 20px;
            }

            .info h3 {
                font-size: 18px;
            }

            .info p {
                font-size: 16px;
            }

            .header h1 {
                font-size: 40px;
            }

            .header p {
                font-size: 18px;
            }

            .activity-card {
                width: 100%;
                max-width: 450px;
            }
            
            .footer-column {
                flex: 0 0 100%;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
            
            .application-form {
                width: 95%;
                max-width: 600px;
                padding: 20px;
            }
        }

        @media (max-width: 576px) {
            .gallery {
                gap: 15px;
            }
            
            .activity-card {
                width: 100%;
                max-width: 100%;
            }
            
            .know-more-btn, .join-now-btn {
                padding: 12px 25px;
                font-size: 16px;
            }
            
            .header {
                padding: 60px 15px;
                min-height: 300px;
            }
            
            .header h1 {
                font-size: 30px;
            }
            
            .header p {
                font-size: 16px;
            }
            
            .activities h3 {
                font-size: 22px;
                margin-bottom: 30px;
            }
            
            .footer-logo-section, .footer-column {
                padding: 0 10px;
            }

            .application-form {
                padding: 15px;
                height: 450px;
            }

            .form-buttons {
                flex-direction: column;
                gap: 10px;
            }

            .form-submit-btn,
            .form-cancel-btn {
                width: 100%;
                margin: 0;
            }
            
            .form-progress {
                margin-bottom: 20px;
            }
            
            .step-label {
                font-size: 10px;
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
                    <li><a href="landingpage.aspx" class="active">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="program.aspx">Programs</a></li>
                    <li><a href="activity.aspx">Activities</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                    <li><a href="donation.aspx">Donate</a></li>
                   
                </ul>
            </div>
        </nav>

        <!-- Hero Banner -->
        <div class="header" data-aos-duration="1500">
            <h1>Joan of Arc Youth Organization:</h1>
            <p>Empowering the Youth,
                Igniting Purpose, and<br />
                Leading with Courage!</p>

            <button class="know-more-btn">
                KNOW MORE <span class="arrow">➡</span>
            </button>
        </div>

        <!-- Info Section -->
        <div class="section" id="joinNowSection">
            <div class="info" data-aos="fade-left" data-aos-duration="1000">
                <h3>ARE YOU A YOUNG LEADER READY TO MAKE A DIFFERENCE IN YOUR COMMUNITY?</h3>
                <p>You're in the right place! Our organization empowers youth with leadership opportunities, skill-building programs, and community initiatives to help you grow and make a real impact.</p>
                <button type="button" class="join-now-btn" id="joinNowBtn">
                    JOIN NOW <span class="arrow"></span>
                </button>
            </div>
            <img src="IMAGES/logo.bg.png" />
        </div>

        <!-- Activities Section -->
        <div class="activities" data-aos="zoom-in-up" data-aos-duration="1200">
            <h3>RECENTS ACTIVITIES</h3>
            <div class="gallery">
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/bingo.jpg" alt="Bingo Project" />
                    <p class="caption">Bingo Project</p>
                </div>
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/party.jpg" alt="Christmas Party" />
                    <p class="caption">Christmas Party</p>
                </div>
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
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
  <!-- Application Form Overlay -->
        <div class="overlay" id="applicationOverlay">
            <div class="application-form">
                <button type="button" class="close-btn" id="closeFormBtn">
                    <i class="fas fa-times"></i>
                </button>
                <div class="form-header">
                    <img src="IMAGES/logo.png" />
                    <h2>Join Joan of Arc Youth Organization</h2>
                    <p>Fill out this form to begin your journey with us</p>
                </div>

                <!-- Success Message HTML for Application Form -->
                <div class="success-message" id="successMessage" runat="server">
                    <i class="fas fa-check-circle"></i>
                    <h3>Application Submitted Successfully!</h3>
                    <p>Thank you for applying to the Joan of Arc Youth Organization. We've received your information and sent a confirmation email to <strong><span id="confirmationEmail"></span></strong>.</p>
                    
                    <div class="requirements-reminder">
                        <h4>Next Steps:</h4>
                        <p>Please bring the following requirements to our office to complete your application:</p>
                        <ul>
                            <li>Valid ID (School ID, Government ID, etc.)</li>
                            <li>1 recent 2x2 photo</li>
                            <li>Parent/Guardian consent form (for applicants under 18)</li>
                            <li>Brief resume or list of previous activities (if any)</li>
                        </ul>
                        <p><strong>Office Address:</strong> 673 Quirino Hwy, Novaliches, Quezon City<br/>
                        <strong>Office Hours:</strong> Monday to Friday, 9:00 AM - 5:00 PM</p>
                    </div>
                    
                    <button type="button" class="form-submit-btn" id="closeSuccessBtn">CLOSE</button>
                </div>

                <!-- Application Form Panel -->
                <asp:Panel ID="applicationFormPanel" runat="server">
                    <!-- Personal Information -->
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtFirstName" class="required">First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter your first name" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtLastName" class="required">Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" placeholder="Enter your last name" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Contact Information -->
                    <div class="form-row">
                        <div class="form-group">
                            <label for="txtEmail" class="required">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Enter your email" required="required"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone" class="required">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter your phone number" required="required"></asp:TextBox>
                        </div>
                    </div>

                    <!-- Age Group and Interest -->
                    <div class="form-row">
                        <div class="form-group">
                            <label for="ddlAge" class="required">Age Group</label>
                            <asp:DropDownList ID="ddlAge" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Text="-- Select Age Group --" Value="" />
                                <asp:ListItem Text="13-15 years" Value="13-15" />
                                <asp:ListItem Text="16-18 years" Value="16-18" />
                                <asp:ListItem Text="19-21 years" Value="19-21" />
                                <asp:ListItem Text="22-25 years" Value="22-25" />
                                <asp:ListItem Text="26+ years" Value="26+" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="ddlInterests" class="required">Areas of Interest</label>
                            <asp:DropDownList ID="ddlInterests" runat="server" CssClass="form-control" required="required">
                                <asp:ListItem Text="-- Select Area of Interest --" Value="" />
                                <asp:ListItem Text="Leadership Development" Value="Leadership" />
                                <asp:ListItem Text="Community Service" Value="Community" />
                                <asp:ListItem Text="Environmental Initiatives" Value="Environment" />
                                <asp:ListItem Text="Mentorship Programs" Value="Mentorship" />
                                <asp:ListItem Text="Social Events" Value="Social" />
                                <asp:ListItem Text="Multiple Interests" Value="Multiple" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
                    </div>

                    <!-- Motivation -->
                    <div class="form-group">
                        <label for="txtMotivation" class="required">Why do you want to join?</label>
                        <asp:TextBox ID="txtMotivation" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Tell us why you want to join and what you hope to achieve" Rows="4" required="required"></asp:TextBox>
                    </div>

                    <!-- Agreement Checkbox -->
                    <div class="form-group">
                        <label for="chkAgree" class="required">
                            <asp:CheckBox ID="chkAgree" runat="server" />
                            I agree to the terms and conditions and allow Joan of Arc Youth Organization to contact me.
                        </label>
                    </div>

                    <!-- Submit & Cancel Buttons -->
                    <div class="form-buttons">
                        <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT APPLICATION" CssClass="form-submit-btn" OnClick="btnSubmit_Click" OnClientClick="resetFormOnSubmit(); return true;" />
                       <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnClose_ServerClick" />

                    </div>
                </asp:Panel>
            </div>
        </div>


        <!-- Scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
        
        <script>
            // Initialize AOS animation library
            document.addEventListener('DOMContentLoaded', function () {
                AOS.init({
                    offset: 120,
                    delay: 100,
                    duration: 1000,
                    easing: 'ease',
                    once: true
                });

                // Mobile menu toggle
                const menuToggle = document.getElementById('menuToggle');
                const navLinks = document.getElementById('navLinks');

                if (menuToggle && navLinks) {
                    menuToggle.addEventListener('click', function () {
                        navLinks.classList.toggle('active');
                    });
                }

                // Form functionality
                const joinNowBtn = document.getElementById('joinNowBtn');
                const applicationOverlay = document.getElementById('applicationOverlay');
                const closeFormBtn = document.getElementById('closeFormBtn');
                const cancelFormBtn = document.getElementById('cancelFormBtn');
                const closeSuccessBtn = document.getElementById('closeSuccessBtn');
                const successMessage = document.getElementById('successMessage');
                const applicationFormPanel = document.getElementById('<%= applicationFormPanel.ClientID %>');

                // Function to close the application form overlay
                function closeApplicationForm() {
                    if (applicationOverlay) {
                        applicationOverlay.style.display = 'none';
                        document.body.style.overflow = 'auto'; // Re-enable scrolling
                        resetForm(); // Reset the form when closed
                    }
                }

                // Function to reset the form UI state
                function resetFormUI() {
                    if (successMessage && applicationFormPanel) {
                        successMessage.style.display = 'none';
                        applicationFormPanel.style.display = 'block';
                    }
                }

                // Function to reset all form fields
                function resetForm() {
                    setTimeout(function () {
                        // Reset text fields
                        const textInputs = document.querySelectorAll('.form-control');
                        textInputs.forEach(input => {
                            input.value = '';
                            input.style.borderColor = '#e0e0e0'; // Reset border color
                        });

                        // Reset dropdowns
                        const dropdowns = document.querySelectorAll('select.form-control');
                        dropdowns.forEach(dropdown => {
                            dropdown.selectedIndex = 0;
                        });

                        // Reset checkbox
                        const checkbox = document.getElementById('<%= chkAgree.ClientID %>');
                        if (checkbox) {
                            checkbox.checked = false;
                            checkbox.parentElement.style.color = '#333';
                        }

                        // Reset the form UI
                        resetFormUI();
                    }, 300); // Small delay to ensure proper reset
                }

                // Global function to be called from OnClientClick
                window.resetFormOnSubmit = function() {
                    // This function will be called before form submission
                    // The actual form reset will happen after server processing
                }
                
                // Event Listeners
                if (joinNowBtn) {
                    joinNowBtn.addEventListener('click', function () {
                        resetFormUI(); // Reset the form UI state
                        resetForm(); // Reset form fields
                        applicationOverlay.style.display = 'flex';
                        document.body.style.overflow = 'hidden'; // Prevent scrolling when overlay is open
                    });
                }

                if (closeFormBtn) {
                    closeFormBtn.addEventListener('click', closeApplicationForm);
                }

                if (cancelFormBtn) {
                    cancelFormBtn.addEventListener('click', closeApplicationForm);
                }

                if (closeSuccessBtn) {
                    closeSuccessBtn.addEventListener('click', closeApplicationForm);
                }

                // Close overlay when clicking outside the form
                if (applicationOverlay) {
                    applicationOverlay.addEventListener('click', function (e) {
                        if (e.target === applicationOverlay) {
                            closeApplicationForm();
                        }
                    });
                }

                // Form validation
                const formSubmitBtn = document.getElementById('<%= btnSubmit.ClientID %>');
                if (formSubmitBtn) {
                    formSubmitBtn.addEventListener('click', function (e) {
                        const requiredFields = document.querySelectorAll('[required]');
                        let isValid = true;

                        requiredFields.forEach(field => {
                            if (!field.value.trim()) {
                                field.style.borderColor = '#ff4136';
                                isValid = false;
                            } else {
                                field.style.borderColor = '#ddd';
                            }
                        });

                        const chkAgree = document.getElementById('<%= chkAgree.ClientID %>');
                        if (chkAgree && !chkAgree.checked) {
                            chkAgree.parentElement.style.color = '#ff4136';
                            isValid = false;
                        } else if (chkAgree) {
                            chkAgree.parentElement.style.color = '#333';
                        }

                        if (!isValid) {
                            alert('Please complete all required fields.');
                            e.preventDefault();
                        }
                    });
                }

                // Smooth scroll for "Know More" button
                const knowMoreBtn = document.querySelector('.know-more-btn');
                if (knowMoreBtn) {
                    knowMoreBtn.addEventListener('click', function () {
                        const activitiesSection = document.querySelector('.activities');
                        if (activitiesSection) {
                            activitiesSection.scrollIntoView({
                                behavior: 'smooth'
                            });
                        }
                    });
                }
            });

            window.onload = function () {
                const panel = document.getElementById('<%= applicationFormPanel.ClientID %>');
        
        document.addEventListener('click', function (event) {
            if (panel && !panel.contains(event.target)) {
                // Trigger a postback to clear the form
                __doPostBack('<%= btnCancel.UniqueID %>', '');
            }
        });
             };
        </script>
    </form>
</body>
</html>