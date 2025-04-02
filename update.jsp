<%@ page import="java.sql.*" %>
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

<a href="edit.jsp">Back to Edit</a>
