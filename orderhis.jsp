<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Little Lemon - Menu</title>
    <style>
    html, body {
        background-color: #000000;
        color: white;
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
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
        z-index: 1000;
    }

    .nav-links {
        display: flex;
        gap: 2rem;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    .nav-links a {
        color: #00ffff;
        text-decoration: none;
        font-size: 1rem;
        font-weight: 500;
        transition: all 0.3s ease;
        padding: 0.5rem 1rem;
        border-radius: 8px;
        text-shadow: 0 0 5px rgba(0, 255, 255, 0.5);
    }

    .nav-links a:hover {
        background: rgba(0, 255, 255, 0.1);
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.3);
    }

    .section-title {
        font-size: 1.5rem;
        margin-bottom: 1.5rem;
        text-transform: uppercase;
        letter-spacing: 2px;
        text-shadow: 0 0 10px cyan;
        animation: neonPulse 2s infinite alternate;
        
    }

    
    .order-box {
        background: linear-gradient(145deg, #1a1a1a, #202020);
        padding: 1rem;
        border-radius: 10px;
        box-shadow: 0 0 5px cyan, 0 0 10px cyan;
        display: flex;
        align-items: center;
        gap: 1rem;
        width: 450px; 
        margin: 1rem auto;
        text-align: center;
        font-size: 1.2rem;
        font-weight: bold;
        color: cyan;
        text-transform: uppercase;
        letter-spacing: 1px;
        justify-content: flex-start;
        
    }

    
    .order-box img {
        width: 80px;  
        height: 80px;
        border-radius: 10px;
        object-fit: cover; 
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
    }

    .order-box label {
        flex-grow: 1;
        text-align: left;
    }

    .game-card {
        background: linear-gradient(145deg, #1a1a1a, #202020);
        padding: 1rem;
        border-radius: 10px;
        box-shadow: 0 0 5px cyan, 0 0 10px cyan;
        display: flex;
        align-items: center;
        gap: 1rem;
        width: 400px;
        margin-bottom: 1rem;
    }

    .game-card img {
        width: 70px;
        height: 70px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
    }

    .game-card label {
        font-size: 1rem;
        font-weight: bold;
        color: cyan;
    }

    .search-bar {
        background-color: #2a2a2a;
        border: 2px solid cyan;
        padding: 0.75rem 1rem;
        color: white;
        border-radius: 8px;
        width: 300px;
        text-shadow: 0 0 10px cyan;
    }
</style>

</head>
<body>
    <header class="header">
        <img src="images/Logo.png" alt="Little Lemon Logo" style="width: 70px; height: 70px; border-radius: 8px;">
        <%-- <input type="text" class="search-bar" placeholder="Search menu..."> --%>
        <nav>
            <ul class="nav-links">
                <%-- <li><a href="home.jsp">Home</a></li> --%>
                <%-- <li><a href="about.jsp">About</a></li> --%>
                <%-- <li><a href="dupmenu.jsp">Menu</a></li> --%>
                <%-- <li><a href="book.jsp">Book</a></li> --%>
                <li><a href="dupmenu.jsp">Menu</a></li>
                <li><a href="login.html">Log Out</a></li>
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
                         <div class="order-box">
                            <img src="<%=rs.getString("image")%>" alt="<%=rs.getString("name")%>">
                            <label><%=rs.getString("name")%> : Order received</label>
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