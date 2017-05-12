<%-- 
    Document   : getcart
    Created on : 11 May, 2017, 7:53:12 PM
    Author     : Sudarshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>


<%@page import="com.google.gson.*" %>
<%@page import="org.json.simple.*"%>
<%--<%@page import="org.json.JSONObject"%>--%>

<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%
PrintWriter outn= response.getWriter();
    try
{
    
    String email= request.getParameter("email");
    JSONArray jarray= new JSONArray();
    Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs,rs1;
       String uid="";
       out.println(email);
       rs= st.executeQuery("Select * from users where uemail='"+email+"'");
       
       if(rs.next())
       {
          uid=rs.getString("uid");
           
       }
      
       
       
       rs= st.executeQuery("Select * from cart"+uid);
       while(rs.next())
       {
           JSONObject json= new JSONObject();
           json.put("ProductName",rs.getString("ProductName"));
           json.put("Picurl",rs.getString("Picurl"));
           json.put("Price",rs.getString("Price"));
           json.put("Quantity",rs.getString("Quantity"));
           StringWriter out1 = new StringWriter();
        json.writeJSONString(out1);
        jarray.add(json);
       }
       outn.println(jarray.toString());
//       
}
catch(Exception e)
{
 
    outn.println(e.getMessage());
}
%>
