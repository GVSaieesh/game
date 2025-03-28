<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

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
            
            justify-content: space-between;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .menu-card {
            background-color: #202020;
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s;
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

        .discount {
            background-color: #0074e4;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.9rem;
        }

        .original-price {
            color: #999;
            text-decoration: line-through;
            font-size: 0.9rem;
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
    <%
               
                String uemail=(String) session.getAttribute("uemail");
                
                String url="jdbc:mysql://localhost:3306/littlelemon";
                String user="root";
                String password="";

                try
                {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      Connection con = DriverManager.getConnection(url,user,password);
                      PreparedStatement ps= con.prepareStatement("SELECT m.image,m.name FROM orders o,menu m WHERE o.name=m.name and email=?;");
                      ps.setString(1,uemail);
                      ResultSet rs = ps.executeQuery();
                      while(rs.next()){
        %>             
                       <div class="section-title">
                         <div>
                           <img src="<%=rs.getString("image")%>" alt="<%=rs.getString("name")%>" style="width: 70px; height: 70px; border-radius: 8px;" />
                           <label><%=rs.getString("name")%></label>
                           <label>:-Order recived </label>
                         </div>
                       </div>
                        
                <%
                      }
                      rs.close();
                      ps.close();
                      con.close();
                }catch(Exception e)
                {
                    out.println("error:"+e.getMessage());
                }
            %>
       
    
</body>
</html>