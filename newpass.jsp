<%@ page import="java.io.*, java.sql.*" %>

<%
    String email = (String) session.getAttribute("email");
    String otp1 = request.getParameter("otp1");
    String password1 = request.getParameter("password1");

    
        String url = "jdbc:mysql://localhost:3306/littlelemon";
        String user = "root";
        String password = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            PreparedStatement ps = con.prepareStatement("UPDATE login SET password=? WHERE email=?");
            ps.setString(1, password1);
            ps.setString(2, email);

            int m = ps.executeUpdate();

            if (m > 0) {
                out.println("<script>alert('Password is updated'); window.location.href='login.html';</script>");
            } else {
                out.println("<script>alert('Error updating password'); window.location.href='newpass.html';</script>");
            }
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
   
%>
