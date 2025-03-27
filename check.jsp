
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
 
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String cpassword = request.getParameter("cpassword");

   String url = "jdbc:mysql://localhost:3306/littlelemon";
   String user = "root";
   String dbpassword ="";
    
   if(!password.equals(cpassword))
   {
    out.println("<script>alert('confirm password is not same as password!'); window.location.href='signup.jsp';</script>");
    return;
   }
 
   try
   {
     Class.forName("com.mysql.cj.jdbc.Driver");
     Connection con = DriverManager.getConnection(url,user,dbpassword);

     PreparedStatement ps = con.prepareStatement("INSERT INTO login(email,password) VALUES(?,?)");
     ps.setString(1,email);
     ps.setString(2,password);

     int m= ps.executeUpdate();
     if(m>0)
     {
       
         out.println("<script>alert('Registered!'); window.location.href='login.jsp';</script>");
     }

 
     
     else{
         out.println("<script>alert('Email not registered!'); window.location.href='signup.jsp';</script>");

     }
    
     ps.close();
     con.close();
 
   }
   catch (Exception e) {
     out.println("Error: " + e.getMessage());
 }
 %>