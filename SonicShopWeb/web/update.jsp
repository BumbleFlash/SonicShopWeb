<%-- 
    Document   : update
    Created on : 4 Apr, 2017, 1:48:35 PM
    Author     : Sudarshan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="form.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <div class="container">   
    <form  id="contact"  method="POST">
      <h3>Data Entry Form</h3>
    <h4>Update Form</h4>
        
        <fieldset>
        <input type="text" name="pdname" id="pn" value="<%= request.getParameter("pname")%>" /><br>
        </fieldset>
        <fieldset>
        <input type="text" name="pdprice" id="pp" value="<%= request.getParameter("pprice")%>" /><br>
        </fieldset>
        <fieldset>
        <input type="text" name="pdurl" id="pu" value="<%= request.getParameter("purl")%>" /><br>
        </fieldset>
        <fieldset>
        <input type="text" name="pdcat" id="pc" value="<%= request.getParameter("pcat")%>" /><br>
        </fieldset>
        <Button type="submit" value=""  name="update">Update</button>
       <!--<input type="button" value="Clear" />-->
        <script>
//            function cl()
//            {
//           var inputElements = document.getElementsByTagName("input");
//for (var i=0; i < inputElements.length; i++) {
//    if (inputElements[i].type == 'text') {
//        inputElements[i].value = '';
//    }
//    }
//}
            </script>
    </form>
    <%
        String c= request.getParameter("cno");
        try
        {
            String name =request.getParameter("pdname");
         double price =Double.parseDouble(request.getParameter("pdprice"));
         String p= request.getParameter("pdprice");
                 String pic =request.getParameter("pdurl");
        String cat =request.getParameter("pdcat");
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
    </head>
    <body>
        
    </body>
</html>
