
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%

String name1 = request.getParameter("name1");



String url = "jdbc:mysql://localhost:3306/littlelemon";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = con.prepareStatement("DELETE from menu where name=?");

        ps.setString(1,name1);
       
        int rs = ps.executeUpdate();

        if(rs>0)
        {
            out.println("<script>alert('sucessfully deleted'); window.location.href='index.html';</script>");

        }
        else{
            out.println("<script>alert('failed !try again'); window.location.href='admindel.html';</script>");
        }
    ps.close();
    con.close();
    }catch(Exception e)
    {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>