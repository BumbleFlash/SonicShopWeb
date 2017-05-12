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
{
    JSONObject json= new JSONObject(request.getParameter("cart"));
    Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs;
       String pname= json.get("ProductName").toString();
       double price= Double.parseDouble(json.get("Price").toString());      
       int q = Integer.parseInt(json.get("Quantity").toString());
       String uemail= json.get("uemail").toString();
       rs= st.executeQuery("Select uid from users where uemail= '"+uemail+"'");
       while(rs.next())
       {
       int uid= Integer.parseInt(rs.getString("uid"));
       
      
       String insert= "Insert into cart"+uid+" values('"+pname+"','',"+price+","+q+")";
       out.println(insert);
       st.executeUpdate(insert);
       String inser2= "Insert into temp values('"+uid+"')";
       st.executeUpdate(inser2);
       }
       
       
}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>
