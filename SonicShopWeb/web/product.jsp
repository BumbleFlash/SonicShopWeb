<%-- 
    Document   : product
    Created on : 6 Apr, 2017, 10:18:56 AM
    Author     : Sudarshan
--%>
`<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.swing.JTextField" %>

<%@page import="com.google.gson.*" %>
<%@page import="org.json.simple.*"%>

<%@page import="java.io.*,java.util.*,javax.servlet.*,java.text.*,java.io.PrintWriter" %>

<%
    PrintWriter outn= response.getWriter();
    try
    {
        String cat= request.getParameter("cat");
        JSONArray jarray= new JSONArray();
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/products?" + "user=root&password=pammas");
       Statement st= con.createStatement();
       ResultSet rs;
       rs= st.executeQuery("Select * from product where category= '"+ cat+"'");
      while(rs.next())
       {
                   JSONObject json= new JSONObject();

           json.put("ProductID",rs.getString("product_id"));
           json.put("ProductName",rs.getString("ProdutName"));
           json.put("Picurl",rs.getString("Picurl"));
           json.put("Price",rs.getString("Price"));
           
            StringWriter out1 = new StringWriter();
        json.writeJSONString(out1);
        jarray.add(json);
       // String jsonText = out1.toString();
        //outn.print(jsonText);
        // jarray.add(json);
           
       }
      outn.print(jarray.toString());
//       {
//           outn.println(0);
//       }
      
        
        
    }
    catch(Exception e)
    {
        outn.println(e);
    }
    %>
