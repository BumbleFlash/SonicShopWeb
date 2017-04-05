<%-- 
    Document   : del
    Created on : 5 Apr, 2017, 10:36:17 AM
    Author     : Sudarshan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="form.css">

</head>
<body>
<div class="container">  
  <form id="contact" action="" method="post">
    <h3>Are You Sure</h3>
    <fieldset>
    <button name="Yes" type="submit" id="contact-submit">Yes</button>
    
    </fieldset>
   
    <fieldset>
    <button name="NO" type="submit" id="contact-submit" onclick="javascrpit:window.location.href='table.jsp';return false;">No</button>
    </fieldset>
    
  </form>
     <%
        String c= request.getParameter("cno1");
        Class.forName("com.mysql.jdbc.Driver");
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             
             String up= "Delete from product where product_id="+c;
             PreparedStatement prs= con.prepareStatement(up);
             out.println(up);
             prs.executeUpdate();
             response.sendRedirect("table.jsp");
        %>
</div>

</body>
</html>
