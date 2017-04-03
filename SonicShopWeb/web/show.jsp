<%-- 
    Document   : show
    Created on : 3 Apr, 2017, 10:34:06 AM
    Author     : Sudarshan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="0">
            <thead>
                <tr>
                    <th>Productid</th>
                    <th>ProductName</th>
                    <th>Price</th>
                    <th>Picurl</th>
                    <th>Category</th>
                </tr>
            </thead>
            <%
                try
                {
               Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             ResultSet rs;
             rs= s.executeQuery("Select * from product");
             while(rs.next())
             {
                %>
            <tbody>
                
                <tr>
                    <td><%= rs.getString("Product_id")%></td>
                    <td><%= rs.getString("ProdutName")%></td>
                    <td><%= rs.getString("Price")%></td>
                    <td><%= rs.getString("Picurl")%></td>
                    <td><%= rs.getString("Category")%></td>
                </tr>
                <%
             }
                }
                catch(Exception e)
                {
                    out.println("Fag");
                }
                %>
            </tbody>
        </table>
            <form>
                <input type="text" name="p_id" value="" />
            </form>
            
            <input type="button" value="Update" name="update" />
            
            
    </body>
</html>
