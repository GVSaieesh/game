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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Menu Item - RedMaskGames</title>
    <style>
   
        html {
            background-color: #000000;
        }

        body {
            background-color: #000000;
            color: white; 
            margin: 0; 
            padding: 20px;
            min-height: 100vh;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header {
            background: linear-gradient(180deg, #202020, #151515);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            gap: 2rem;
            box-shadow: 0 2px 10px rgba(0, 255, 255, 0.2);
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        h2 {
            font-size: 2.5rem;
            margin: 80px 0 40px;
            text-align: center;
            letter-spacing: 3px;
        }

        .search-form {
            background: linear-gradient(145deg, #1a1a1a, #202020);
            padding: 2rem;
            border-radius: 15px;
            width: 100%;
            max-width: 500px;
            margin-bottom: 2rem;
            box-shadow: 0 0 5px #0ff, 0 0 10px #0ff, 0 0 20px #0ff;
        }

        .edit-form {
            background: linear-gradient(145deg, #1a1a1a, #202020);
            padding: 2rem;
            border-radius: 15px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 0 5px #0ff, 0 0 10px #0ff, 0 0 20px #0ff;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #0ff;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #0ff;
            border-radius: 8px;
            background: rgba(0, 255, 255, 0.05);
            color: white;
            font-size: 1rem;
            
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            outline: none;
            border-color: #0074e4;
            box-shadow: 0 0 15px rgba(0, 116, 228, 0.3);
        }

        input[type="file"] {
            width: 100%;
            padding: 0.5rem;
            margin-top: 0.5rem;
            background: rgba(0, 255, 255, 0.05);
            border-radius: 8px;
            color: white;
        }

        button {
            background: linear-gradient(45deg, #0074e4, #00c6ff);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            width: 100%;
            margin-top: 1rem;
        }

        button:hover {
            box-shadow: 0 0 20px rgba(0, 198, 255, 0.5);
        }

        .current-image {
            margin-top: 0.5rem;
            font-size: 0.8rem;
            color: #0ff;
        }
    </style>
</head>
<body>
    <header style="display: flex; justify-content: space-between; align-items: center; padding: 0 20px; background-color: #121212;" class="header">
    <div style="display: flex; align-items: center; gap: 15px;">
        <img src="images/Logo.png" alt="Little Lemon Logo" style="width: 80px; height: 80px; border-radius: 8px; box-shadow: 0 0 1px #0ff, 0 0 30px rgba(255, 0, 0, 0.3);
">
        <img src="images/red.png" alt="Red Mask Games" style="width: 180px; height: 80px; border-radius: 8px;">
    </div>

    <nav>
        <ul class="nav-links" style="display: flex; align-items: center; gap: 40px; list-style: none; margin-right: 20px;">
            <li><a style="font-weight: bold;text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);color: #00ffff; text-decoration: none;" href="about.html">About</a></li>
            <li><a style="font-weight: bold;text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);color: #00ffff; text-decoration: none;" href="admin.html">Admin</a></li>
            <li><a style="border: 1px solid #0074e4; padding: 10px 20px; background-color: #0074e4; color: #00ffff;color: white; border-radius: 10px;box-shadow: 0 0 5px rgba(0, 255, 255, 0.5); text-decoration: none;" href="login.html">Log Out</a></li>
        </ul>
    </nav>
</header>
    <h2>EDIT MENU ITEM</h2>

    <form method="get" class="search-form">
        <div class="form-group">
            <label>Enter name of the menu item:</label>
            <input type="text" name="name" required>
        </div>
        <button type="submit">Fetch Data</button>
    </form>

    <% if (name1 != null && !name1.isEmpty() && !name.isEmpty()) { %> 
    <form action="update.jsp" method="post" class="edit-form">
        <input type="hidden" name="oldname" value="<%= name1 %>">
        <input type="hidden" name="oldimage" value="<%= img1 %>">
        <input type="hidden" name="oldimage1" value="<%= img2 %>">

        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" value="<%= name %>" required>
        </div>

        <div class="form-group">
            <label>Description:</label>
            <input type="text" name="description" value="<%= description %>" required>
        </div>

        <div class="form-group">
            <label>Price:</label>
            <input type="number" step="0.01" name="price" value="<%= price %>" required>
        </div>

        <div class="form-group">
            <label>Menu Image:</label>
            <div class="current-image">Current: <%= img1 %></div>
            <input type="file" name="image">
        </div>

        <div class="form-group">
            <label>Item Image:</label>
            <div class="current-image">Current: <%= img2 %></div>
            <input type="file" name="image1">
        </div>

        <div class="form-group">
            <label>Rating:</label>
            <input type="number" name="rating" value="<%= rating %>" required>
        </div>

        <div class="form-group">
            <label>Trailer Link:</label>
            <input type="text" name="link" value="<%= link %>" required>
        </div>

        <button type="submit">Update Item</button>
    </form>
    <% } %>
</body>
</html>
