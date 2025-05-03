using System;
using System.Web.UI;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace JOArc_System
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is already logged in
            if (Session["UserID"] != null)
            {
                Response.Redirect("Landingpage.aspx");
            }

            if (!IsPostBack)
            {
                // Clear any error messages
                lblMessage.Text = string.Empty;

                // Check if there's a return URL
                if (Request.QueryString["ReturnUrl"] != null)
                {
                    lblMessage.Text = "Please log in to access that page.";
                    lblMessage.CssClass = "text-danger";
                }

                // Check for any registration success message
                if (Session["RegistrationSuccess"] != null)
                {
                    lblMessage.Text = Session["RegistrationSuccess"].ToString();
                    lblMessage.CssClass = "text-success";
                    Session.Remove("RegistrationSuccess");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string email = txtEmail.Text.Trim();
                    string password = txtPassword.Text;

                    // Hash the password for comparison
                    string hashedPassword = HashPassword(password);

                    // Get connection string from web.config
                    string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    using (MySqlConnection conn = new MySqlConnection(connStr))
                    {
                        string query = @"SELECT UserID, FirstName, LastName, Email, UserType 
                                         FROM Users 
                                         WHERE Email = @Email AND Password = @Password";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", hashedPassword);

                            conn.Open();

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    // User found, create session
                                    int userId = Convert.ToInt32(reader["UserID"]);
                                    string firstName = reader["FirstName"].ToString();
                                    string lastName = reader["LastName"].ToString();
                                    string userType = reader["UserType"].ToString();

                                    // Store user info in session
                                    Session["UserID"] = userId;
                                    Session["FirstName"] = firstName;
                                    Session["LastName"] = lastName;
                                    Session["Email"] = email;
                                    Session["UserType"] = userType;

                                    // Set authentication cookie if "Remember Me" is checked
                                    if (chkRememberMe.Checked)
                                    {
                                        HttpCookie authCookie = new HttpCookie("JOArcAuth");
                                        authCookie.Values["Email"] = email;
                                        authCookie.Expires = DateTime.Now.AddDays(30); // Cookie expires in 30 days
                                        Response.Cookies.Add(authCookie);
                                    }

                                    // Redirect to landing page or the requested URL
                                    string returnUrl = Request.QueryString["ReturnUrl"];
                                    if (!string.IsNullOrEmpty(returnUrl) && returnUrl.StartsWith("/"))
                                    {
                                        Response.Redirect(returnUrl);
                                    }
                                    else
                                    {
                                        Response.Redirect("Landingpage.aspx");
                                    }
                                }
                                else
                                {
                                    // Invalid login
                                    lblMessage.Text = "Invalid email or password. Please try again.";
                                    lblMessage.CssClass = "text-danger";
                                }
                            }
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                    lblMessage.CssClass = "text-danger";
                }
            }
        }

        // Use the same hashing method as in the Registration page
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                StringBuilder sb = new StringBuilder();
                foreach (byte b in hash)
                {
                    sb.Append(b.ToString("x2"));
                }
                return sb.ToString();
            }
        }
    }
}