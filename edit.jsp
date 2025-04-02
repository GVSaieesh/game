<%@ page import="java.sql.*" %>
<%
    String name1 = request.getParameter("name");  
    String name = "", description = "", img1 = "", img2 = "", link = "";
    double price = 0;
    int rating = 0;

    if (name1 != null && !name1.isEmpty()) {
        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/littlelemon", "root", "");

            // Fetch the existing menu item details
            String sql = "SELECT * FROM menu WHERE name = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, name1);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
                description = rs.getString("description");
                price = rs.getDouble("price");
                img1 = rs.getString("image");
                img2 = rs.getString("image1");
                rating = rs.getInt("rating");
                link = rs.getString("ytlink");
            }

            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Menu Item</title>
</head>
<body>
    <h2>Edit Menu Item</h2>

    <form method="get">
        <label>Enter name of the menu item:</label>
        <input type="text" name="name" required>
        <button type="submit">Fetch Data</button>
    </form>

    <br>

    <% if (name1 != null && !name1.isEmpty() && !name.isEmpty()) { %> 
    <form action="update.jsp" method="post">
        <input type="hidden" name="oldname" value="<%= name1 %>">
        <input type="hidden" name="oldimage" value="<%= img1 %>">
        <input type="hidden" name="oldimage1" value="<%= img2 %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required><br>

        <label>Description:</label>
        <input type="text" name="description" value="<%= description %>" required><br>

        <label>Price:</label>
        <input type="number" step="0.01" name="price" value="<%= price %>" required><br>

        <label>Menu Image (Current):</label>

        <input type="file" name="image"><br>

        <label>Item Image (Current):</label>
       
        <input type="file" name="image1"><br>

        <label>Rating:</label>
        <input type="number" name="rating" value="<%= rating %>" required><br>

        <label>Trailer Link:</label>
        <input type="text" name="link" value="<%= link %>" required><br>

        <button type="submit">Update</button>
    </form>
    <% } %>

</body>
</html>
