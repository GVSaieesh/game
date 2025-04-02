<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  String email1 = request.getParameter("email");
  String password1 = request.getParameter("password");
  String admin = "littlelemonmf@gmail.com";
  String url = "jdbc:mysql://localhost:3306/littlelemon";
          String user = "root";
          String password ="";

          try
          {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url,user,password);

            PreparedStatement ps = con.prepareStatement("SELECT password FROM login WHERE email=?");
            ps.setString(1,email1);

            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {
              String Stpassword=rs.getString("password");
              if(password1.equals(Stpassword) && email1.equals(admin))
              {
                 
                  response.sendRedirect("admin.html");
              }
              else if(password1.equals(Stpassword))
              {
                 session.setAttribute("uemail", email1);
                response.sendRedirect("dupmenu.jsp");
              }
              else
              {
                out.println("<script>alert('Wrong password!'); window.location.href='login.html';</script>");
              }

        
            }
            else{
                out.println("<script>alert('Email not registered!'); window.location.href='login.html';</script>");

            }
            rs.close();
            ps.close();
            con.close();
        
          }
          catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    %>