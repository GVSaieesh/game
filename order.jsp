<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.mail.*, javax.mail.internet.*, java.util.Properties" %>

<%
    String name = request.getParameter("name");
    if (name != null) name = name.trim();

    String uemail = (String) session.getAttribute("uemail");

    // Debugging: Print values to check if they are null
    System.out.println("DEBUG: name = " + name);
    System.out.println("DEBUG: uemail = " + uemail);

    

    String url = "jdbc:mysql://localhost:3306/littlelemon";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = con.prepareStatement("INSERT INTO orders(email, name) VALUES(?, ?)");
        ps.setString(1, uemail);
        ps.setString(2, name);

        int rs = ps.executeUpdate();
        if (rs > 0) {
            // Email Configuration
            String senderEmail = "littlelemonmf@gmail.com";
            String senderPassword = "fiwuvisggfwenuso";  
            String recipient = uemail;
            String subject = "Game Order";
            String messageText = "Your game " + name + " has been received.";

            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");

            Session mailSession = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

            try {
                Message message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(senderEmail));
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
                message.setSubject(subject);
                message.setText(messageText);
                Transport.send(message);

                out.println("<script>alert('Order successfully placed. Confirmation email sent.'); window.location.href='dupmenu.jsp';</script>");

            } catch (MessagingException e) {
                out.println("<script>alert('Error sending email. Please check your order history.');</script>");
                e.printStackTrace();
            }
        } else {
            out.println("<script>alert('Order failed! Please try again.'); window.location.href='dupmenu.jsp';</script>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
