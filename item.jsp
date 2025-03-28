<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Items</title>
</head>

<style>
html {
    background-color: #000000;
}

body {
    background-color: #000000;
    color: white; 
    margin: 0; 
    padding: 0; 
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.gamedet{
    display: flex;
    gap: 30px;
    border-radius: 10px;
}
.description {
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* Align content to the left */
    text-align: left; /* Ensure text aligns to the left */
    padding: 20px;
}

.header {
        background-color: #202020;
        padding: 1rem 2rem;
        display: flex;
        align-items: center;
        gap: 2rem;
    }
/* 
        .search-bar {
            background-color: #2a2a2a;
            border: none;
            padding: 0.75rem 1rem;
            color: white;
            border-radius: 4px;
            width: 300px;
        } */

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
    .gamedet{
    margin: 100px;
    background-color: #202020;
    color: white;
        /* display: flex; */
    padding: 20px;
    justify-content: center;
    align-items: center;
    text-align: center;
    }
    .btnn {
    display: inline-block;
    background-color: #0074e4;
    color: white;
    text-decoration: none;
    padding: 0.75rem 1.5rem;
    border-radius: 10px;
    border: 1px solid #0074e4;
    margin-top: 1rem;
    transition: background-color 0.2s;
    align-self: flex-start;
    font-size: 1.2rem; 
    font-weight: bold; 
}


.pht img {
    width: 300px;
    height: 400px;
    border: 10px solid white;
}

</style>

<body >
    <header class="header">
        <img src="images/Logo.png" alt="Little Lemon Logo" style="width: 65px; height: 70px; border-radius: 8px;">
        <!-- <input type="text" class="search-bar" placeholder="Search menu..."> -->
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

    <div class="gamedet">
         
                <!-- <h1>MARVEL SPIDER-MAN 2</h1> -->

        <%
               
        
        String name1 = request.getParameter("mname");
        boolean alreadyBought = Boolean.parseBoolean(request.getParameter("alreadyBought"));
        
    

                String url="jdbc:mysql://localhost:3306/littlelemon";
                String user="root";
                String password="";

                try
                {
                      Class.forName("com.mysql.cj.jdbc.Driver");
                      Connection con = DriverManager.getConnection(url,user,password);
                      PreparedStatement ps= con.prepareStatement("SELECT * FROM menu WHERE name=?");
                      ps.setString(1,name1);
                      ResultSet rs = ps.executeQuery();
                      while(rs.next()){
        %>
                        <div class="pht">
                            <img style="width:300px;height:400px;border-radius: 20px; border: 5px solid #202020;" src="<%=rs.getString("image")%>" alt="">
                         </div>
                         <div class="description">
                           
                            <p><%=rs.getString("description")%></p>
                             <p>Price:$<%=rs.getString("price")%></p>
                        <% 
                           if(!alreadyBought)
                           {
                            %>
                            <input class="btnn" type="button" value="Order Now" onclick="Order()">
                            <%
                           }
                           else
                           {

                           }
                         %>
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
                
                  
             
    </div>
    <script>
        function Order() {
            let n1 = "<%= name1 %>";
            window.location.href = "order.jsp?name=" + encodeURIComponent(n1);
        }
    </script>
</body>
</html>