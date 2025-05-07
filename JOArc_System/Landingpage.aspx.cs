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
                // Initialize dropdowns if needed
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
                    try
                    {
                        SendConfirmationEmail();
                    }
                    catch (Exception emailEx)
                    {
                        // Log email error but continue (application was saved)
                        System.Diagnostics.Debug.WriteLine("Email error: " + emailEx.Message);
                    }

                    // Show success message and hide form
                    successMessage.Visible = true;
                    applicationFormPanel.Visible = false;

                    // Register script to show success message and reset form
                    ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess",
                        "document.getElementById('successMessage').style.display = 'block';" +
                        "document.getElementById('applicationFormPanel').style.display = 'none';", true);

                    // Reset form for future use
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
                // Log the full exception details
                System.Diagnostics.Debug.WriteLine("Error in form submission: " + ex.ToString());
            }
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "validationError",
                "alert('" + message.Replace("'", "\\'") + "');", true);
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
                    // First check if the connection can be established
                    connection.Open();

                    // Use a regular INSERT query instead of a stored procedure if you have issues
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
                // Log the specific database error
                System.Diagnostics.Debug.WriteLine("MySQL Error: " + sqlEx.ToString());

                // Show more details in development environment
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
            try
            {
                string userEmail = txtEmail.Text.Trim();

                // Create the mail message
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("garabiag.arjay04@gmail.com", "Joan of Arc Youth Organization");
                mail.To.Add(userEmail); // Send to the user's email address
                mail.Subject = "Your Application to Joan of Arc Youth Organization";

                string body = $@"
<html>
<head>
    <style>
        body {{ font-family: Arial, sans-serif; line-height: 1.6; color: #333; }}
        .container {{ max-width: 600px; margin: 0 auto; padding: 20px; }}
        .header {{ background-color: #ffc30f; padding: 20px; text-align: center; }}
        .content {{ padding: 20px; background-color: #f9f9f9; }}
        .footer {{ padding: 20px; text-align: center; font-size: 12px; color: #777; }}
    </style>
</head>
<body>
    <div class='container'>
        <div class='header'>
            <h1>Thank You for Your Application!</h1>
        </div>
        <div class='content'>
            <p>Dear {txtFirstName.Text} {txtLastName.Text},</p>
            <p>Thank you for applying to join the Joan of Arc Youth Organization. We've received your application!</p>
            <ul>
                <li><strong>Email:</strong> {txtEmail.Text}</li>
                <li><strong>Phone:</strong> {txtPhone.Text}</li>
                <li><strong>Age Group:</strong> {ddlAge.SelectedItem.Text}</li>
                <li><strong>Interest:</strong> {ddlInterests.SelectedItem.Text}</li>
            </ul>
            <p>Our team will get back to you within 3–5 business days.</p>
            <p>Best regards,<br/>Joan of Arc Youth Team</p>
        </div>
        <div class='footer'>
            <p>673 Quirino Hwy, Novaliches, QC | info@joanarcyouth.org</p>
        </div>
    </div>
</body>
</html>";

                mail.Body = body;
                mail.IsBodyHtml = true;

                // Log the email for debugging
                System.Diagnostics.Debug.WriteLine("Sending email to: " + userEmail);
                System.Diagnostics.Debug.WriteLine("Email subject: " + mail.Subject);

                // Set up the SMTP client with your provided credentials
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential("garabiag.arjay04@gmail.com", "epxc wknm nalj esks");

                // Send the email
                smtpClient.Send(mail);

                System.Diagnostics.Debug.WriteLine("Email sent successfully");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Email error: " + ex.Message);
                // Log detailed error for debugging
                System.Diagnostics.Debug.WriteLine("Detailed email error: " + ex.ToString());

                // Instead of re-throwing, we'll just log the error
                // This prevents the application from failing if email sending fails
                // The user will still get a success message for their application
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
    }
}