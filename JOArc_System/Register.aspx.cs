using System;
using System.Web.UI;
using System.Configuration;
using System.Text;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;

namespace JOArc_System
{
    public partial class Register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any previous messages
                lblMessage.Text = string.Empty;

                // Initialize dropdown if needed
                if (ddlUserType.Items.Count == 0)
                {
                    ddlUserType.Items.Add(new ListItem("-- Select User Type --", ""));
                    ddlUserType.Items.Add(new ListItem("Student", "Student"));
                    ddlUserType.Items.Add(new ListItem("Volunteer", "Volunteer"));
                    ddlUserType.Items.Add(new ListItem("Staff", "Staff"));
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                    using (MySqlConnection conn = new MySqlConnection(connStr))
                    {
                        // Check if email already exists
                        bool emailExists = CheckIfEmailExists(txtEmail.Text.Trim(), conn);

                        if (emailExists)
                        {
                            lblMessage.CssClass = "text-danger";
                            lblMessage.Text = "An account with this email already exists. Please use a different email or try to login.";
                            return;
                        }

                        string hashedPassword = HashPassword(txtPassword.Text);

                        // Modified query to remove FirstName, LastName, PhoneNumber, Address
                        string query = @"INSERT INTO Users 
                                       (Email, Password, UserType, CreatedDate)
                                       VALUES 
                                       (@Email, @Password, @UserType, @CreatedDate)";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {
                            // Removed parameters for FirstName, LastName, PhoneNumber, Address
                            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@Password", hashedPassword);
                            cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
                            cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }

                        // Store registration success message in session for display on login page
                        Session["RegistrationSuccess"] = "Registration successful! You can now login with your credentials.";

                        // Redirect to login page
                        Response.Redirect("Login.aspx");
                    }
                }
                catch (MySqlException ex)
                {
                    lblMessage.CssClass = "text-danger";
                    lblMessage.Text = "Database error: " + ex.Message;
                    // Log error (in production, use a proper logging framework)
                }
                catch (Exception ex)
                {
                    lblMessage.CssClass = "text-danger";
                    lblMessage.Text = "An error occurred during registration. Please try again later.";
                    // Log error (in production, use a proper logging framework)
                }
            }
        }

        private bool CheckIfEmailExists(string email, MySqlConnection conn)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

            using (MySqlCommand cmd = new MySqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();

                return count > 0;
            }
        }

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

        private void ClearForm()
        {
            // Removed clearing for firstName, lastName, phoneNumber, address
            txtEmail.Text = txtPassword.Text = txtConfirmPassword.Text = string.Empty;
            ddlUserType.ClearSelection();
            chkTerms.Checked = false;
            lblMessage.Text = string.Empty;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void cvTerms_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = chkTerms.Checked;
        }
    }
}