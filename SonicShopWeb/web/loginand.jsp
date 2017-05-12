
<%--
    Document   : loginand
    Created on : 3 May, 2017, 8:13:10 PM
    Author     : Sudarshan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>

<%@page import="com.google.gson.*" %>
<%@page import="org.json.simple.*"%>

<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>
<%
  PrintWriter outn= response.getWriter();
    try
    {
        String uemail= request.getParameter("uemail");
        String upass= request.getParameter("upass");
        
        JSONArray jarray= new JSONArray();
       Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs;
       rs= st.executeQuery("Select * from users where uemail='"+uemail+"' and upassword='"+upass+"'");
       JSONObject json= new JSONObject();
       //rs.next();
       if(rs.next())
       {
           
           json.put("uname",rs.getString("uname"));
           json.put("uemail",rs.getString("uemail"));
           json.put("upass",rs.getString("upassword"));
           StringWriter w= new StringWriter();
           json.writeJSONString(w);
           
           outn.print(w.toString());
           
           
       }
      
           
       
    }
    catch (Exception e)
    {
        out.println(e.getMessage());
        
    }
    
    %>
    
