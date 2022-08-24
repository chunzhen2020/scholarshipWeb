<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
request.setCharacterEncoding("utf-8");
String msg="";
String msg1="";
boolean error=false;
String origId = request.getParameter("pid");
String value1 = null;
String value2 = null;
String value3 = null;
String value4 = null;
String value5 = null;
String value6 = null;

String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/testDB";
String USER = "root";
String PASS = "";
Connection conn = null;
Statement stmt = null;
ResultSet result = null;
String sql = "";
String s1 = request.getParameter("sub");
if(s1!=null){
    String Id = "";
    String Name = "";
    String Amount = "";
    String Candidate = "";
    String Applications = "";
    String Quotas = "";
    for(int j = 0 ; j < 1 ; j++){
    	Id = "";
        Name = "";
        Amount = "";
        Candidate = "";
        Applications = "";
        Quotas = "";

        if(request.getParameter("id")!=null){
            Id = request.getParameter("id");
            if(Id == ""){
                error = true;
                msg = "Invalid ID!";
                break;
            }
        }

        if(request.getParameter("name")!=null){
            Name = request.getParameter("name");
            if(Name == ""){
                error = true;
                msg = "Invalid Name!";
                break;
            }
        }

        if(request.getParameter("amount")!=null){
            Amount = request.getParameter("amount");
            if(Amount == ""){
                error = true;
                msg = "Invalid Amount!";
                break;
            }
        }
		
        if(request.getParameter("candidate")!=null){
            Candidate = request.getParameter("candidate");
            if(Candidate == ""){
                error = true;
                msg = "Invalid Candidate!";
                break;
            }
        }
        if(request.getParameter("application")!=null){
            Applications = request.getParameter("application");
            if(Applications == ""){
                error = true;
                msg = "Invalid Applications!";
                break;
            }
        }
        if(request.getParameter("quota")!=null){
            Quotas = request.getParameter("quota");
            if(Quotas == ""){
                error = true;
                msg = "Invalid Quotas!";
                break;
            }
        }
    }
    
    JDBC_DRIVER = "com.mysql.jdbc.Driver";
    DB_URL = "jdbc:mysql://localhost:3306/testDB";
    USER = "root";
    PASS = "";
    conn = null;
    stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
    stmt = (Statement) conn.createStatement();
    sql = "INSERT INTO scholarship (id, name, amount, candidate,application,quota) VALUES ('"+ Id +"','"+ Name +"','"+ Amount +"','"+ Candidate +"','"+ Applications +"','"+ Quotas +"')";
    int ret = stmt.executeUpdate(sql);
    if(ret > 0){
        msg = "Add success!";
    }else{
        msg = "Add Error!";
    }
    stmt.close();
    conn.close();
    response.sendRedirect("manager.jsp");  
} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scholarship Adding</title>
 <style>
      a:link,a:visited {color:blue}
      .container{  
        margin:0 auto; 
        width:500px;  
        text-align:center;  
      } 
   </style>
   <style type="text/css">
	body{background:#F5F5F5;text-align:center;}
</style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript" src = "wejs/jquery-2.1.1.min.js"></script>
</head>
<body>

<div class="container">
	<h1>Scholarship Adding</h1>
    <form action="add.jsp?pid=<%=origId %>" method="post" name="f">
       ID:<input name="id" type="text" />
        <br/><br/>
        Name:<input name="name" type="text" />
        <br/><br/>
       Amount:<input name="amount" type="text"  />
        <br/><br/>
       Candidates:
        <br />
        <select name="candidate">
        <option value="PhD">PhD</option>
        <option value="Master">Master</option>
        <option value="Bachelor">Bachelor</option>
        </select>
        <br />
        <br />
        Applications:<input name="application" type="text"/>
        <br/><br/>
        Quotas:<input name="quota" type="text" />
        <br/><br/>
    <input type="submit" name="sub" value="Add"/>
    <input type="reset" name="rset" value="Reset"/>
    <br/><br/>
    </form><br/><br/>
    <p><%=msg %></p>
    <p><%=msg1 %></p>
    <a href='manager.jsp'>Return</a>
</div> 
</body>
</html>