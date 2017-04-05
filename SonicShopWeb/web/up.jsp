<%-- 
    Document   : up
    Created on : 5 Apr, 2017, 11:02:04 AM
    Author     : Sudarshan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="form.css">
<div class="container">  
  <form id="contact" method="post">
    <h3>Data Entry Form</h3>
    <h4>Enter data for books</h4>
    <fieldset>
      <h4>Book's Name</h4>
      <input placeholder="Book name" name="pdn" type="text" tabindex="1" value="<%= request.getParameter("pname")%>" required/>
    </fieldset>
    <fieldset>
    <h4>Picture URL</h4>
      <input placeholder="Picture URL" name="pdp" type="text" value="<%= request.getParameter("purl")%>" tabindex="2"/>
    </fieldset>
    <fieldset>
    <h4>Price</h4>
      <input placeholder="Price" type="text" name="pdu" tabindex="3" value="<%= request.getParameter("pprice")%>" required/>
    </fieldset>
    <fieldset>
    <h4>Category</h4>
    <input placeholder="Category" type="text" name="pdc"  tabindex="4" value="<%= request.getParameter("pcat")%>" required/>
    
    </fieldset>
    
   <Button type="submit" value=""  name="update">Update</button>
    
    
    
  </form>

</head>

    <%
        String c= request.getParameter("cno");
        try
        {
            String name =request.getParameter("pdn");
         double price =Double.parseDouble(request.getParameter("pdp"));
         String p= request.getParameter("pdp");
                 String pic =request.getParameter("pdu");
        String cat =request.getParameter("pdc");
              Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
                
//                if(name.equals("")&&p.equals("")&&pic.equals("")&&cat.equals(""))
//                {
//                    PreparedStatement prs1= con.prepareStatement("Delete from product where product_id="+c);
//                    prs1.executeUpdate();
//                    //s.executeUpdate("Delete from product where product_id="+c);
//                    response.sendRedirect("table.jsp"); 
//                }
//             else
//                {
                String up= "UPDATE PRODUCT SET PRODUTNAME= '"+name+"',price="+price+",picurl='"+pic+"', Category='"+cat+"' where product_id="+c+";" ;
             PreparedStatement prs= con.prepareStatement(up);
             out.println(up);
             prs.executeUpdate();
            response.sendRedirect("table.jsp"); 
             
            
        }
        catch(Exception e)
        {
            
            
        }
           
         

        %>
</div>
<body>

</body>
</html>
