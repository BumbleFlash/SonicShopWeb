<%-- 
    Document   : index
    Created on : 31 Mar, 2017, 7:26:03 PM
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
<!--        <h1>Hello World!</h1>-->
        <form>
           
           Enter Product Name:  <input type="text" name="pname" value="" /><br>
           Enter Pic url:       <input type="text" name="picurl" value="" /><br>
           Enter Price:         <input type="text" name="price" value="" /><br>
           Category:            <select name="category">
               <option> Computer Science</option>
               <option> Biology</option>
               <option> Electrical</option>
               <option> Physics</option>
           </select><br>
           <input type="submit" value="Submit" name="submit" />
           <br><br>
           
        </form>
        <%
         try
         {
             
             String pname= request.getParameter("pname");
             Double price= Double.parseDouble(request.getParameter("price"));
             String picurl= request.getParameter("picurl");
             String cname= request.getParameter("category");
             int i=0;
             ResultSet rs;
             Class.forName("com.mysql.jdbc.Driver");
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             rs= s.executeQuery("Select * from product");
             while (rs.next()==true)
             {
             i++;
             }
             i++;
             
             String q="INSERT INTO PRODUCT VALUES('"+pname+"',"+i+",'"+picurl+"',"+price+",'"+cname+"');";
             
             s.executeUpdate(q);
             out.println("Inserted");
             
         }
         catch(Exception e){
         }
            %>
            <form action="show.jsp">
                <input type="submit" value="Edit" name="edit"/>
            </form>
    </body>
</html>
