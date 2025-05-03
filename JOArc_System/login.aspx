<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JOArc_System.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Joan Arc Youth Organization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jQuery and jQuery Validation references -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validation-unobtrusive/3.2.12/jquery.validate.unobtrusive.min.js"></script>
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    
    <style>
        /* Enhanced base styles to match register page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffc30f 0%, #ba8c00 100%);
            margin: 0;
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            perspective: 1000px; /* For 3D flip effect */
        }

        .container {
            width: 100%;
            max-width: 1500px;
            height: auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
            display: flex;
            overflow: hidden;
            transform-style: preserve-3d;
            transition: transform 0.8s;
        }
        
        .left-panel {
            width: 400px;
            background-color: #555555;
            padding: 40px 20px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        
        .panel-logo {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #ffc30f;
        }
        
        .panel-image {
            width: 100px;
            height: 100px;
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .panel-image i {
            font-size: 50px;
            color: #ffc30f;
        }

        .form-container {
            width: 550px;
            flex: 1;
            padding: 40px;
        }

        .form-header {
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #444;
        }

        .input-control {
            width: 100%;
            padding: 12px 18px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .input-control:focus {
            border-color: #ffc30f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 195, 15, 0.2);
        }

        .button {
            padding: 14px 24px;
            background-color: #ffc30f;
            color: #333;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-top: 20px;
            display: inline-block;
            text-align: center;
            text-decoration: none;
        }

        .button:hover {
            background-color: #ba8c00;
            color: white;
        }

        .button.secondary {
            background-color: #f5f5f5;
            color: #333;
            border: 1px solid #ddd;
            margin-top: 10px;
        }

        .button.secondary:hover {
            background-color: #e0e0e0;
            color: #333;
        }

        .text-danger {
            color: #dc3545;
            font-size: 13px;
            margin-top: 6px;
            display: block;
        }

        .text-success {
            color: #28a745;
            font-size: 14px;
            margin-top: 8px;
            font-weight: 500;
            text-align: center;
        }

        .required::after {
            content: " *";
            color: #dc3545;
        }

        .form-footer {
            margin-top: 25px;
            text-align: center;
            font-size: 14px;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 14px;
            color: #999;
        }

        .input-with-icon .input-control {
            padding-left: 45px;
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 10px;
        }
        
        .forgot-password a {
            color: #666;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.3s;
        }
        
        .forgot-password a:hover {
            color: #ba8c00;
            text-decoration: underline;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        
        .remember-me input {
            margin-right: 8px;
        }

        /* Animation classes */
        .flip {
            transform: rotateY(180deg);
        }
        
        .return-home {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .return-home:hover {
            color: #ffc30f;
        }
        
        .return-home i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                max-width: 500px;
            }
            
            .left-panel {
                width: 100%;
                padding: 25px;
            }
        }

        @media (max-width: 600px) {
            body {
                padding: 0;
                background: white;
            }
            
            .container {
                border-radius: 0;
                box-shadow: none;
            }
            
            .form-container {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="loginContainer">
            <!-- Left Panel -->
            <div class="left-panel">
                <div class="panel-logo">Joan of Arc Youth</div>
                <div class="panel-image">
                    <i class="fas fa-user-lock"></i>
                </div>
                <p>Welcome back! Login to access your account.</p>
            </div>
            
            <!-- Form Content -->
            <div class="form-container">
                <div class="form-header">
                    <h2>Login to Your Account</h2>
                    <p>Enter your credentials to continue</p>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="txtEmail" class="required">Email Address</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email address is required." 
                        CssClass="text-danger" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                
                <!-- Password -->
                <div class="form-group">
                    <label for="txtPassword" class="required">Password</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" 
                        ErrorMessage="Password is required." 
                        CssClass="text-danger" 
                        Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </div>
                
                <div class="form-group remember-me">
                    <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" />
                </div>
                
                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="button" OnClick="btnLogin_Click" />
                
                <div class="form-footer">
                    <p>
                        Don't have an account? <a href="Register.aspx" id="goToRegister" style="color: #ba8c00; text-decoration: none; font-weight: 500;">Register Now</a>
                    </p>
                </div>
                
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        
        <a href="Landingpage.aspx" class="return-home">
            <i class="fas fa-arrow-left"></i> Return to Home
        </a>
    </form>

    <script type="text/javascript">
        $(document).ready(function () {
            // Card flip animation when clicking on register link
            $("#goToRegister").on('click', function (e) {
                e.preventDefault();
                $("#loginContainer").addClass("flip");

                // Redirect after animation completes
                setTimeout(function () {
                    window.location.href = "Register.aspx";
                }, 600);
            });

            // Check if we're coming from register page (using URL parameter)
            if (window.location.href.indexOf('fromRegister=true') > -1) {
                $("#loginContainer").addClass("flip");
                setTimeout(function () {
                    $("#loginContainer").removeClass("flip");
                }, 10);
            }
        });
    </script>
</body>
</html>