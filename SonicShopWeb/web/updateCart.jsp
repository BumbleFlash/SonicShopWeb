<%-- 
    Document   : updateCart
    Created on : 23 Jun, 2017, 1:30:49 PM
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
   {
      int uid=0;
       JSONObject json= new JSONObject(request.getParameter("Update"));
       Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs;
       String uemail= json.get("uemail").toString();
       rs= st.executeQuery("Select * from users where uemail='"+uemail+"'");
       String itemName= json.get("itemName").toString();
       int quantity= Integer.parseInt(json.get("quantity").toString());
       int choice= Integer.parseInt(json.get("choice").toString());
       while(rs.next())
       {
         uid= Integer.parseInt(rs.getString("uid"));
       if(choice==1)
       {
          st.executeUpdate("Update cart"+uid+" set Quantity="+quantity+ " where ProductName='"+itemName+"'");
       }
       else
           if(choice==2)
       {
           st.executeUpdate("Delete from cart"+uid+" where productName='"+itemName+"'");
       }
       }
       
   }
   catch(Exception e)
   {
       out.println(e.getMessage());
   }
    %>