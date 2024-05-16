package Model;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtility {

    public static void sendEmail(String fromEmail, String toEmails, String subject, String text) {
    	// Environment variables for email username and password
        final String username = System.getenv("your email address");
        final String password = System.getenv("your email password");
        
        // SMTP server configuration properties
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); // SMTP host
        prop.put("mail.smtp.port", "465"); // SMTP port
        prop.put("mail.smtp.auth", "true"); // Enable SMTP authentication
        prop.put("mail.smtp.socketFactory.port", "465"); // Port for SSL
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // SSL factory class

        // Creates a Session object with the SMTP server properties and an Authenticator that provides the username and password for SMTP authentication.
        Session session = Session.getInstance(prop, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                // Return the authentication details
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail)); // Set the "from" email address
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmails)); // Set the "to" email addresses
            message.setSubject(subject); // Set the email subject
            message.setText(text); // Set the email body text

            // Send the email
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            System.out.println("Failed to send email");
            e.printStackTrace();
        }
    }
}