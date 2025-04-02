<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String img1 = images+request.getParameter("img1");
String img2 = images+request.getParameter("img2");
String name1 = request.getParameter("name1");
String des = request.getParameter("name2");
int rating = request.getParameter("rating");
int price = request.getParameter("price");
String link = https://www.youtube.com/embed/+request.getParameter("link");


String url = "jdbc:mysql://localhost:3306/littlelemon";
    String user = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);

        PreparedStatement ps = con.prepareStatement("INSERT INTO menu(name,description,price,image1,image2,rating,ytlink) VALUES(?,?,?,?,?,?,?)");

        ps.setString(1,name1);
        ps.setString(2,des);
        ps.setInt(3,price);
        ps.setString(4,img1);
        ps.setString(5,img2);
        ps.setInt(6,rating);
        ps.setString(7,link);
        int rs = ps.executeUpdate();

        if(rs>0)
        {
            out.println("<script>alert("sucessfully updated"); window.location.href="admin.html";</script>");

        }
        else{
            out.println("<script>alert("failed !try again"); window.location.href="admin.html";</script>");
        }
    ps.close();
    con.close();
    }catch(Exception e)
    {
        out.println("<h3>Error: " + e.getMessage() + "</h3>");
        e.printStackTrace();
    }
%>