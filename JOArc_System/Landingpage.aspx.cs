using System;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace JOArc_System
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page state
                successMessage.Visible = false;
                applicationFormPanel.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!ValidateForm())
                {
                    ShowErrorMessage("Please complete all required fields.");
                    return;
                }

                if (SaveApplicationToDatabase())
                {
                    string userEmail = txtEmail.Text.Trim();

                    try
                    {
                        SendConfirmationEmail();
                        System.Diagnostics.Debug.WriteLine("Confirmation email sent successfully to: " + userEmail);
                    }
                    catch (Exception emailEx)
                    {
                        System.Diagnostics.Debug.WriteLine("Email error: " + emailEx.Message);
                    }

                    successMessage.Visible = true;
                    applicationFormPanel.Visible = false;

                    ScriptManager.RegisterStartupScript(this, GetType(), "formSubmittedAlert",
                        "alert('Your application form has been submitted successfully. Please check your email for further instructions.');", true);

                    ScriptManager.RegisterStartupScript(this, GetType(), "scrollToTop",
                        "window.scrollTo(0, 0);", true);

                    ResetForm();
                }
                else
                {
                    ShowErrorMessage("There was an error saving your application. Please try again later.");
                }
            }
            catch (Exception ex)
            {
                ShowErrorMessage("Unexpected error: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("Error in form submission: " + ex.ToString());
            }
        }

        private void ShowErrorMessage(string message)
        {
            string safeMessage = message.Replace("'", "\\'");
            ScriptManager.RegisterStartupScript(this, GetType(), "validationError",
                "alert('" + safeMessage + "');", true);
        }

        private bool ValidateForm()
        {
            return
                !string.IsNullOrWhiteSpace(txtFirstName.Text) &&
                !string.IsNullOrWhiteSpace(txtLastName.Text) &&
                !string.IsNullOrWhiteSpace(txtEmail.Text) &&
                !string.IsNullOrWhiteSpace(txtPhone.Text) &&
                ddlAge.SelectedIndex > 0 &&
                ddlInterests.SelectedIndex > 0 &&
                !string.IsNullOrWhiteSpace(txtMotivation.Text) &&
                chkAgree.Checked;
        }

        private bool SaveApplicationToDatabase()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = @"INSERT INTO applications 
                    (FirstName, LastName, Email, Phone, AgeGroup, Interest, Address, Motivation, SubmissionDate, Status) 
                    VALUES 
                    (@FirstName, @LastName, @Email, @Phone, @AgeGroup, @Interest, @Address, @Motivation, @SubmissionDate, @Status)";

                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@AgeGroup", ddlAge.SelectedValue);
                        cmd.Parameters.AddWithValue("@Interest", ddlInterests.SelectedValue);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        cmd.Parameters.AddWithValue("@Motivation", txtMotivation.Text.Trim());
                        cmd.Parameters.AddWithValue("@SubmissionDate", DateTime.Now);
                        cmd.Parameters.AddWithValue("@Status", "Pending");

                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                }
            }
            catch (MySqlException sqlEx)
            {
                System.Diagnostics.Debug.WriteLine("MySQL Error: " + sqlEx.ToString());
                ShowErrorMessage("Database error: " + sqlEx.Message);
                return false;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("General Error: " + ex.ToString());
                return false;
            }
        }

        private void SendConfirmationEmail()
        {
            string userEmail = txtEmail.Text.Trim();
            string userName = $"{txtFirstName.Text.Trim()} {txtLastName.Text.Trim()}";

            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("garabiag.arjay04@gmail.com", "Joan of Arc Youth Organization");
                mail.To.Add(userEmail);
                mail.Subject = "Your Application to Joan of Arc Youth Organization";

                string body = $@"
<html>
<head>
    <style>
        body {{ font-family: Arial, sans-serif; line-height: 1.6; color: #333; }}
        .container {{ max-width: 600px; margin: 0 auto; padding: 20px; }}
        .header {{ background-color: #ffc30f; padding: 20px; text-align: center; }}
        .content {{ padding: 20px; background-color: #f9f9f9; }}
        .requirements {{ background-color: #fff; padding: 15px; border-left: 4px solid #ffc30f; margin: 20px 0; }}
        .requirements h3 {{ color: #ba8c00; margin-top: 0; }}
        .requirements ul {{ padding-left: 20px; }}
        .footer {{ padding: 20px; text-align: center; font-size: 12px; color: #777; }}
        .button {{ display: inline-block; background-color: #ffc30f; color: #333; padding: 10px 20px; 
                text-decoration: none; border-radius: 5px; font-weight: bold; margin-top: 15px; }}
        .button:hover {{ background-color: #ba8c00; color: #fff; }}
    </style>
</head>
<body>
    <div class='container'>
        <div class='header'>
            <h1>Thank You for Your Application!</h1>
        </div>
        <div class='content'>
            <p>Dear {txtFirstName.Text} {txtLastName.Text},</p>
            <p>Thank you for applying to join the Joan of Arc Youth Organization. We've received your application and are excited about your interest in our community!</p>
            
            <p>Here's a summary of your application details:</p>
            <ul>
                <li><strong>Name:</strong> {txtFirstName.Text} {txtLastName.Text}</li>
                <li><strong>Email:</strong> {txtEmail.Text}</li>
                <li><strong>Phone:</strong> {txtPhone.Text}</li>
                <li><strong>Age Group:</strong> {ddlAge.SelectedItem.Text}</li>
                <li><strong>Interest:</strong> {ddlInterests.SelectedItem.Text}</li>
            </ul>
            
            <div class='requirements'>
                <h3>Next Steps: Required Documents</h3>
                <p>To complete your application process, please bring the following documents to our office:</p>
                <ul>
                    <li>Valid ID (School ID, Government ID, etc.)</li>
                    <li>1 recent 2x2 photo</li>
                    <li>Parent/Guardian consent form (for applicants under 18)</li>
                    <li>Brief resume or list of previous activities/volunteer experience (if any)</li>
                </ul>
                <p>Office Address: 673 Quirino Hwy, Novaliches, Quezon City</p>
                <p>Office Hours: Monday to Friday, 9:00 AM - 5:00 PM</p>
            </div>
            
            <p>Our team will review your application and get back to you within 3–5 business days. If you have any questions, feel free to reply to this email or contact us directly.</p>
            
            <p>Best regards,<br/>Joan of Arc Youth Team</p>
        </div>
        <div class='footer'>
            <p>673 Quirino Hwy, Novaliches, QC | info@joanarcyouth.org | +63 123 456 7890</p>
            <p>This is an automated message. Please do not reply directly to this email.</p>
        </div>
    </div>
</body>
</html>";

                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential("garabiag.arjay04@gmail.com", "zxsm ynft otfl iyda");

                smtpClient.Send(mail);
                System.Diagnostics.Debug.WriteLine($"Confirmation email sent successfully to {userEmail}");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Failed to send email to {userEmail}: {ex.Message}");
                System.Diagnostics.Debug.WriteLine($"Detailed error: {ex}");
            }
        }

        private void ResetForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            ddlAge.SelectedIndex = 0;
            ddlInterests.SelectedIndex = 0;
            txtAddress.Text = "";
            txtMotivation.Text = "";
            chkAgree.Checked = false;
        }

        // ✅ NEW: Method for Close Button
        protected void btnClose_ServerClick(object sender, EventArgs e)
        {
            ResetForm(); // Clear all fields
            successMessage.Visible = false; // Hide success message
            applicationFormPanel.Visible = true; // Re-show the form
        }
    }
}
