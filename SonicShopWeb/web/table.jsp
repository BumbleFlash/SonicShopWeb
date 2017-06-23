<%-- 
    Document   : table
    Created on : 3 Apr, 2017, 3:25:35 PM
    Author     : Sudarshan
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Table Style</title>
    <link rel="stylesheet" type="text/css" href="table.css">
    
	<meta name="viewport" content="initial-scale=1.0; maximum-scale=1.0; width=device-width;">
</head>

<body>
<div class="table-title">
<h3>Data Table</h3>
</div>
   
<table class="table-fill" id="table" style="cursor: pointer;">
<thead>
<tr>
<th class="text-left">Product Id</th>
<th class="text-left">Product Name</th>
<th class="text-left">Price</th>
<th class="text-left">Picture URL</th>
<th class="text-left">Category</th>
</tr>
</thead>
 <%
                try
                {
               Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             ResultSet rs,rs1;
             String admin="";
             rs1=s.executeQuery("Select * from temp");
             if(rs1.next())
                 admin=rs1.getString("admin");
             rs= s.executeQuery("Select * from product where admin_name='"+admin+"'");
             while(rs.next())
             {
                %>
<tbody class="table-hover">
<tr>
<td class="text-left"><%= rs.getString("Product_id")%></td>
<td class="text-left"><%= rs.getString("ProdutName")%></td>
<td class="text-left"><%= rs.getString("Price")%></td>
<td class="text-left"><%= rs.getString("Picurl")%></td>
<td class="text-left"><%= rs.getString("Category")%></td>


</tr>
    <%
             }
             
                }
                catch(Exception e)
                {
                    out.println(e.getMessage());
                }
                %>
</tbody>
</table>

<form action="table.jsp" method="POST">
    Enter Column no. <input type="text" id="column" name="column" value="" /><br>
</form>



<%
                
                
                String cno=new String();
       if((request.getParameter("column")!=null))
               {
                   cno =request.getParameter("column");
                   
               }
       
                %>
                
 
             



<%
       try
       {
           
           if(cno!=null)
           {
               out.println(cno);
           Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             ResultSet rs;
             rs =s.executeQuery("Select * from product where product_id = "+ cno);
             while(rs.next())   
             {
                 String name= rs.getString("ProdutName");
             Double price= Double.parseDouble(rs.getString("Price"));
             String url= rs.getString("Picurl");
             String category= rs.getString("Category");
       %>
       <form id="contact" action="update.jsp">  
      <input  type="text" name="cno" id="pn" value="<%=cno%>" style="display:none"/>   
<input  type="text" name="pname" id="pn" value="<%=name%>" style="display:none"/>
<input type="text" name="pprice" id="pp" value="<%=price%>" style="display:none"/>
<input type="text" name="purl" id= "pu" value="<%=url%>" style="display:none"/>
<input type="text" name="pcat" id= "pc" value="<%=category%>" style="display:none"/>




  <button name="Update" style="padding:20" style="padding-left:40" style="padding-right:40" style="margin-right:20" type="submit">Update</button>
       </form>
<form id= "contact" action= "del.jsp" method="post">
<!--    <input type="text" name="temp" id= "t"  style=""/>-->
<input  type="text" name="cno1" id="pno" value="<%=cno%>" style="display:none"/>  
<button name="Delete"  style="padding:20" style="padding-left:40" style="padding-right:40" type="submit" >Delete</button> 


</form>
  
       <%   }

           }
       }
       catch(Exception e)
       {
           
       }
       %>
     

  </body>
</html>