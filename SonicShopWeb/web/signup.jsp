<%-- 
    Document   : signup
    Created on : 7 Apr, 2017, 1:56:58 PM
    Author     : Sudarshan
--%>

<%@page import="org.json.simple.parser.JSONParser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>


<%@page import="com.google.gson.*" %>
<%@page import="org.json.simple.*"%>
<%@page import="org.json.JSONObject"%>

<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>

<%
    try
    {
//        JSONObject inp=(JSONObject) JSONValue.parse(request.getParameter("param1"));
//         
       String s = request.getParameter("Json");
       //out.println(s);
               
        JSONObject jobject= new JSONObject(s);
        
        
        
    
    String upass= jobject.get("upassword").toString();
    String uemail= jobject.get("uemail").toString();
    String uname= jobject.get("uname").toString();
    
        
        
        
int uid=0;    
//int uid= Integer.parseInt(request.getParameter("Uid"));
//    String upass= request.getParameter("upassword");
//    String uname= request.getParameter("uname");
//    String uemail= request.getParameter("uemail");
    //users u = new users();
    
   
       
    
    Class.forName("com.mysql.jdbc.Driver");  
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs;
       String sql= "Select * from users";
       rs= st.executeQuery(sql);
    
          if(rs.next())
          {
          rs.last();
          uid= Integer.parseInt(rs.getString("uid"));
          
          uid++;
          }
          else
              uid=1;
          
          DatabaseMetaData d= con.getMetaData();
          ResultSet rs2;
          rs2= d.getTables(null,null,"cart"+uid,null);
          String create;
          if(!rs.next())
          {
              
       
       //out.println(uname+uemail+upass);
       create= "Create table cart" + uid +"(ProductName varchar(100), Picurl varchar(300), Price decimal(7,0), Quantity int(10)) ";
       st.executeUpdate(create);
          }
       String q= "Insert into users values("+uid+",'"+uname+"','"+uemail+"','"+upass+"');";
       st.executeUpdate(q);
    }
    catch(Exception e)
    {
       out.println(e.getMessage());
    }
    
    %>
