<%-- <%@ page import="java.sql.*" %>
<%
    Connection con = null;
    PreparedStatement pst = null;

    try {
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price")); 
        String img1 = request.getParameter("image");
        String img2 = request.getParameter("image1");
        int rating = Integer.parseInt(request.getParameter("rating")); 
        String link = request.getParameter("link");
        String oldname = request.getParameter("oldname");  
        String oldImg1 = request.getParameter("oldimage");
        String oldImg2 = request.getParameter("oldimage1");

     
        if (img1 == null || img1.isEmpty()) {
            img1 = oldImg1;
        }
        if (img2 == null || img2.isEmpty()) {
            img2 = oldImg2;
        }

        if (oldname != null && !oldname.isEmpty()) {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/littlelemon", "root", "");

          
            String updateSQL = "UPDATE menu SET name=?, description=?, price=?, image=?, image1=?, rating=?, ytlink=? WHERE name=?";
            pst = con.prepareStatement(updateSQL);

            
            pst.setString(1, name);
            pst.setString(2, description);
            pst.setDouble(3, price);
            pst.setString(4, img1);
            pst.setString(5, img2);
            pst.setInt(6, rating);
            pst.setString(7, link);
            pst.setString(8, oldname);

            
            int updated = pst.executeUpdate();
            if (updated > 0) {
                out.println("<p style='color: green;'>Data updated successfully!</p>");
            } else {
                out.println("<p style='color: red;'>Update failed! Item not found.</p>");
            }
        } else {
            out.println("<p style='color: red;'>Invalid request. No item name provided.</p>");
        }
    } catch (NumberFormatException e) {
        out.println("<p style='color: red;'>Invalid input for price or rating!</p>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Error updating data! " + e.getMessage() + "</p>");
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<a href="edit.jsp">Back to Edit</a> --%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Menu - Little Lemon</title>
    <style>
        body {
            background-color: #000000;
            color: white; 
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .message-box {
            padding: 15px 20px;
            margin: 20px auto;
            width: 50%;
            border-radius: 5px;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.2);
        }

        .success {
            background: #008000; /* Green */
            color: #fff;
            border-left: 5px solid #00ff00;
        }

        .error {
            background: #800000; /* Dark Red */
            color: #fff;
            border-left: 5px solid #ff0000;
        }

        .back-button {
            display: inline-block;
            text-align: center;
            margin-top: 20px;
            padding: 12px 18px;
            font-size: 1rem;
            color: #fff;
            background: #0074e4;
            text-decoration: none;
            border-radius: 5px;
            width: 220px;
            transition: background 0.3s;
            text-align: center;
        }

        .back-button:hover {
            background: #005bb5;
        }
    </style>
</head>
<body>

<%
    Connection con = null;
    PreparedStatement pst = null;

    try {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price")); 
        String img1 = request.getParameter("image");
        String img2 = request.getParameter("image1");
        int rating = Integer.parseInt(request.getParameter("rating")); 
        String link = request.getParameter("link");
        String oldname = request.getParameter("oldname");  
        String oldImg1 = request.getParameter("oldimage");
        String oldImg2 = request.getParameter("oldimage1");

        if (img1 == null || img1.isEmpty()) {
            img1 = oldImg1;
        }
        if (img2 == null || img2.isEmpty()) {
            img2 = oldImg2;
        }

        if (oldname != null && !oldname.isEmpty()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/littlelemon", "root", "");

            String updateSQL = "UPDATE menu SET name=?, description=?, price=?, image=?, image1=?, rating=?, ytlink=? WHERE name=?";
            pst = con.prepareStatement(updateSQL);

            pst.setString(1, name);
            pst.setString(2, description);
            pst.setDouble(3, price);
            pst.setString(4, img1);
            pst.setString(5, img2);
            pst.setInt(6, rating);
            pst.setString(7, link);
            pst.setString(8, oldname);

            int updated = pst.executeUpdate();
            if (updated > 0) {
%>
                <div class="message-box success">Data updated successfully!</div>
<%
            } else {
%>
                <div class="message-box error">Update failed! Item not found.</div>
<%
            }
        } else {
%>
            <div class="message-box error">Invalid request. No item name provided.</div>
<%
        }
    } catch (NumberFormatException e) {
%>
        <div class="message-box error">Invalid input for price or rating!</div>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
        <div class="message-box error">Error updating data! <%= e.getMessage() %></div>
<%
    } finally {
        try {
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<a href="edit.jsp" class="back-button">Back to Edit</a>

</body>
</html>
