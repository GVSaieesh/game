<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Little Lemon - Menu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            /* position: fixed; */
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .search-bar {
            background-color:rgb(40, 34, 34);
            border: none;
            padding: 0.75rem 1rem;
            color: white;
            border-radius: 10px;
            width: 500px;
            height: 50px;
            font-size:20px;
        }

        .nav-links {
            display: flex;
            right: 0;
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
            /* margin-left:20px;margin-right:20px; */
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
            margin-bottom:15px;
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

        .checked{
            color:orange;
        }
    </style>
</head>
<body>
<header style="display: flex; justify-content: space-between; align-items: center; padding: 0 20px; background-color: #121212;" class="header">
    <div style="display: flex; align-items: center; gap: 15px;">
        <img src="images/Logo.png" alt="Little Lemon Logo" style="width: 80px; height: 80px; border-radius: 8px;">
        <img src="images/red.png" alt="Red Mask Games" style="width: 180px; height: 80px; border-radius: 8px;">
        <input type="text" id="search" class="search-bar" placeholder="Search menu..." style="margin-left: 20px;">
    </div>

    <nav>
        <ul class="nav-links" style="display: flex; align-items: center; gap: 40px; list-style: none; margin-right: 20px;">
            <li><a href="about.jsp">About</a></li>
            <li><a href="dupmenu.jsp">Menu</a></li>
            <li><a href="orderhis.jsp">Order-History</a></li>
            <li><a style="border: 1px solid #0074e4; padding: 10px 20px; background-color: #0074e4; color: white; border-radius: 10px;" href="login.html">Log Out</a></li>
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
                        <div style="display: flex; align-items:center;align-content:center; gap:50px;">
                          <a href="item.jsp?mname=<%= gname %>&alreadyBought=<%= alreadyBought %>" 
                            class="buy-button">
                            <%= alreadyBought ? "Already bought" : "Order Now" %>
                         </a>
                         <div>

                    <!-- while(count>0)
                    {
                        if(rating==rs.getInt(rating))
                        {
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        }
                        else
                        {
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                        }
                    } -->
                         </div>
                        </div>
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

    
   <script>
    document.getElementById("search").addEventListener("keyup", function (e) {
    const searchData = e.target.value.toLowerCase();
    const menuCards = document.querySelectorAll(".menu-card");

    for (let i = 0; i < menuCards.length; i++) {
        const title = menuCards[i].querySelector(".menu-title").textContent.toLowerCase();
        
        if (title.includes(searchData)) {
            menuCards[i].style.display = "block";
        } else {
            menuCards[i].style.display = "none";
        }
    }
});

</script>
</body>
</html>
