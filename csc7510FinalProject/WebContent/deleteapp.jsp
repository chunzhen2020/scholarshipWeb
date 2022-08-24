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

String Id = "";
String Name = "";
String Scholar = "";
for(int j = 0 ; j < 1 ; j++){
	Id = origId;
    Name = "";
    JDBC_DRIVER = "com.mysql.jdbc.Driver";
    DB_URL = "jdbc:mysql://localhost:3306/testDB";
    USER = "root";
    PASS = "";
    conn = null;
    stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
    stmt = (Statement) conn.createStatement();
    String sql = "select * from application;";
    result = stmt.executeQuery(sql);

    stmt.close();
    conn.close();
    JDBC_DRIVER = "com.mysql.jdbc.Driver";
    DB_URL = "jdbc:mysql://localhost:3306/testDB";
    USER = "root";
    PASS = "";
    conn = null;
    stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
    stmt = (Statement) conn.createStatement();
    sql = "select * from scholarship;"; 
	result = stmt.executeQuery(sql);
	String Nm = "";
	String Am = "";
	String Candidate = "";
	String Applications = "";
	String Quotas = "";
    while (result.next()) {
    	if(Scholar.equals(result.getString("name"))){
    		Id = result.getString("id");
    		Nm = result.getString("name");
    		Am = result.getString("amount");
    		Candidate = result.getString("candidate");
    		Applications = result.getString("application");
    		Quotas = result.getString("quota");
    		break;
    	} 
	}

    sql = "update scholar set id = '" + Id + "', name = '" + Nm + "', amount = '" + Am + "', candidate = '" +
            Candidate + "', application = '" + Applications +"', quota = '" + Quotas +"' where id = '" + Id + "';";
    int rt = stmt.executeUpdate(sql);
    stmt.close();
    conn.close(); 
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
String sql = "delete from application where id = '" + Id +"';";
int ret = stmt.executeUpdate(sql);
if(ret > 0){
    msg = "Delete success!";
}else{
    msg = "Delete Error!";
}
stmt.close();
conn.close(); 
response.sendRedirect("apply.jsp");  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scholarship Deletion</title>
 <style>
      a:link,a:visited {color:blue}
      .container{  
        margin:0 auto; 
        width:500px;  
        text-align:center;  
      } 
   </style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript" src = "wejs/jquery-2.1.1.min.js"></script>
</head>
<body>

</body>
</html>