<%@ page import="java.util.*, java.sql.*, javax.mail.*, javax.mail.internet.*" %>
<%
    String email = request.getParameter("email"); 
    String url = "jdbc:mysql://localhost:3306/littlelemon";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = con.prepareStatement("SELECT COUNT(email) FROM login WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        //int count = 0;
        if (rs.next()) {
            count = rs.getInt(1);  
        }

        if (count > 0) {
            String senderEmail = "littlelemonmf@gmail.com";
            String senderPassword = "fiwuvisggfwenuso";  
            String recipient = email;

            int randomNumber = 1000 + (int) (Math.random() * 9000);
            String subject = "Forgot Password";
            String messageText = "Your OTP is: " + randomNumber;

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

                // Store OTP and email in session
                session.setAttribute("otp", String.valueOf(randomNumber));
                session.setAttribute("email", email);

                // Show success message
                out.println("<script>alert('OTP Sent Successfully to your email!');window.location.href='enter_otp.jsp';</script>");

           

            } catch (MessagingException e) {
                out.println("<h3>Error sending email: " + e.getMessage() + "</h3>");
                e.printStackTrace();
            }
        } else {
            out.println("<script>alert('Email not found!'); window.location.href='forgot.html';</script>");
        }

        con.close();
    } catch (Exception e) {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>
