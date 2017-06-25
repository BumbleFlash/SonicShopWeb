<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="form.css">

</head>
<body>
<div class="container">  
  <form id="contact" action="" method="post">
    <h3>Data Entry Form</h3>
    <h4>Enter data for books</h4>
    <fieldset>
      <h4>Book's Name</h4>
      <input placeholder="Book name" type="text" tabindex="1" name="pname" required>
    </fieldset>
    <fieldset>
    <h4>Picture URL</h4>
      <input placeholder="Picture URL" type="text" name= "picurl" tabindex="2">
    </fieldset>
    <fieldset>
    <h4>Price</h4>
      <input placeholder="Price" type="text" name = "price" tabindex="3" required>
    </fieldset>
    <fieldset>
    <h4>Category</h4>
    <select  style="border-color:#ccc" style="background-color:#FFF" name="category" required>
    <option value="Computer Science">Computer Science</option>
    <option value="Physics">Physics</option>
    <option value="Electrical">Electrical</option>
    <option value="Biology">Biology</option>
    </select>
    </fieldset>
    <fieldset>
    <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
    </fieldset>
    
    <fieldset>
    <button name="submit" type="submit" id="contact-submit" data-submit="...Sending" onclick="javascrpit:window.location.href='selection.jsp';return false;">Home</button>
    </fieldset>
    
  </form>

  <% try
         {
             
             String pname= request.getParameter("pname");
             Double price= Double.parseDouble(request.getParameter("price"));
             String picurl= request.getParameter("picurl");
             String cname= request.getParameter("category");
             String admin="";
             int i=0;
             ResultSet rs,rs1;
             Class.forName("com.mysql.jdbc.Driver");
             Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/products","root","pammas");
             Statement s= con.createStatement();
             rs= s.executeQuery("Select * from product");
//             while (rs.next()==true)
//             {
//             i++;
//             }
//             i++;
             rs.last();
             if(rs.last())
             i=Integer.parseInt(rs.getString("product_id"));
             i++;
             rs1=s.executeQuery("Select * from temp");
             if(rs1.next())
             {
                 admin= rs1.getString("admin");
             }
             String q="INSERT INTO PRODUCT VALUES('"+pname+"',"+i+",'"+picurl+"',"+price+",'"+cname+"','"+admin+"');";
             
             s.executeUpdate(q);
             out.println("Inserted");
             
         }
         catch(Exception e){
         }
            %>
</div>
    
       

</body>
</html>