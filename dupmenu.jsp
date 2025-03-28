<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Little Lemon - Menu</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body {
            background-color: #121212;
            color: white;
        }

        .header {
            background-color: #202020;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .search-bar {
            background-color: #2a2a2a;
            border: none;
            padding: 0.75rem 1rem;
            color: white;
            border-radius: 4px;
            width: 300px;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            color: #ccc;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .featured {
            padding: 2rem;
        }

        .section-title {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .menu-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .menu-card {
            background-color: #202020;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s;
            width: 23%;
        }

        .menu-card:hover {
            transform: translateY(-4px);
        }

        .menu-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .menu-content {
            padding: 1rem;
        }

        .menu-title {
            font-size: 1.1rem;
            margin-bottom: 0.5rem;
        }

        .price-tag {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .current-price {
            font-size: 1.2rem;
            font-weight: bold;
        }

        .buy-button {
            display: inline-block;
            background-color: #0074e4;
            color: white;
            text-decoration: none;
            padding: 0.75rem 1.5rem;
            border-radius: 4px;
            margin-top: 1rem;
            transition: background-color 0.2s;
        }

        .buy-button:hover {
            background-color: #0066cc;
        }
    </style>
</head>
<body>
    <header class="header">
        <img src="images/Logo.png" alt="Little Lemon Logo" style="width: 70px; height: 70px; border-radius: 8px;">
        <input type="text" class="search-bar" placeholder="Search menu...">
        <nav>
            <ul class="nav-links">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="dupmenu.jsp">Menu</a></li>
                <li><a href="book.jsp">Book</a></li>
                <li><a href="orderhis.jsp">Order-History</a></li>
            </ul>
        </nav>
    </header>

    <main class="featured">
        <div class="section-title">
            <h2>Featured Menu Items</h2>
        </div>

        <div class="menu-grid">
            <%
                try {
                    String email = (String) session.getAttribute("uemail");
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/littlelemon", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM menu");

                    int count = 0;
                    while (rs.next()) {
                        String gname = rs.getString("name");
                        String gimage = rs.getString("image1");
                        int gprice = rs.getInt("price");

                        if (count % 4 == 0 && count != 0) { 
            %>
            </div><div class="menu-grid">
            <%
                        }
            %>
                <div class="menu-card">
                    <img src="<%= gimage %>" alt="<%= gname %>" class="menu-image">
                    <div class="menu-content">
                        <h3 class="menu-title"><%= gname %></h3>
                        <div class="price-tag">
                            <span class="current-price">$<%= gprice %></span>
                        </div>
                        <%
                          PreparedStatement pst = con.prepareStatement("SELECT name FROM orders WHERE email=?");
                          pst.setString(1, email);
                          ResultSet rst = pst.executeQuery();
                          boolean alreadyBought = false;

                          while (rst.next()) {
                              String mname = rst.getString("name");
                              if (mname.equals(gname)) {
                                  alreadyBought = true;
                                  break;
                              }
                          }
                          
                        %>
                        <a href="item.jsp?mname=<%= gname %>&alreadyBought=<%= alreadyBought %>" 
                            class="buy-button">
                            <%= alreadyBought ? "Already bought" : "Order Now" %>
                         </a>
                         
                    </div>
                </div>
            <%
                        count++;
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </main>
</body>
</html>
