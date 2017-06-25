<%-- 
    Document   : cart
    Created on : 11 May, 2017, 7:33:26 PM
    Author     : Sudarshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>


<%@page import="com.google.gson.*" %>
<%--<%@page import="org.json.simple.*"%>--%>
<%@page import="org.json.JSONObject"%>

<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%
try
{int i=0;
    JSONObject json= new JSONObject(request.getParameter("cart"));
    Class.forName("com.mysql.jdbc.Driver");  
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs,rs2;
       String pname= json.get("ProductName").toString();
       double price= Double.parseDouble(json.get("Price").toString());      
       int q = Integer.parseInt(json.get("Quantity").toString());
       String uemail= json.get("uemail").toString();
       
       rs= st.executeQuery("Select uid from users where uemail= '"+uemail+"'");
       while(rs.next())
       {
       int uid= Integer.parseInt(rs.getString("uid"));
       
       rs2= st.executeQuery("Select * from cart"+uid+" where ProductName='"+pname+"'and order_history=0");
       while(rs2.next())
       {
               i= Integer.parseInt(rs2.getString("quantity"));
               i=i+q;
               String update= "Update cart"+uid+" set quantity="+i+" where ProductName='"+pname+"'";
               st.executeUpdate(update);  
           
       }
       
      
            
       
          
       if(!rs2.next())
       {
       String insert= "Insert into cart"+uid+" values('"+pname+"','',"+price+","+q+",'JUST_ADDED',0)";
       st.executeUpdate(insert);
       }
       }              
}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>
