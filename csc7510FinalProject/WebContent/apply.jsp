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
Class.forName("com.mysql.jdbc.Driver");
conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
stmt = (Statement) conn.createStatement();
String sql = "select * from scholarship where id = '" + origId + "';";
result = stmt.executeQuery(sql);

while (result.next()) {
        value1 = result.getString("id");
        value2 = result.getString("name");
        value3 = result.getString("amount");
        value4 = result.getString("candidate");
        value5 = result.getString("application");
        value6 = result.getString("quota");
        result.next();
    }
result.close();
stmt.close();
conn.close();
String s1 = request.getParameter("sub");
if(s1!=null){
    String Id = "";
    String Name = "";
    String Gender = "";
    String Marriage = "";
    String Education = "";
    String SId = "";
    String SName = "";
    for(int j = 0 ; j < 1 ; j++){
    	Id = origId;
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
        	if(Id.equals(result.getString("id"))){
        		Nm = result.getString("name");
        		Am = result.getString("amount");
        		Candidate = result.getString("candidate");
        		Applications = result.getString("application");
        		Quotas = result.getString("quota");
        		break;
        	} 
    	}
        //Applications = Integer.toString(Integer.parseInt(Applications) + 1);
        //Quotas = Integer.toString(Integer.parseInt(Quotas) - 1);
        sql = "update scholarship set id = '" + Id + "', name = '" + Nm + "', amount = '" + Am + "', candidate = '" +
                Candidate + "', application = '" + Applications +"', quota = '" + Quotas +"' where id = '" + Id + "';";
        int rt = stmt.executeUpdate(sql);
        
        if(request.getParameter("name")!=null){
            Name = request.getParameter("name");
            if(Name == ""){
                error = true;
                msg = "Invalid Name!";
                break;
            }
        }

        if(request.getParameter("gender")!=null){
            Gender = request.getParameter("gender");
            if(Gender == ""){
                error = true;
                msg = "Invalid Gender!";
                break;
            }
        }

        if(request.getParameter("marriage")!=null){
        	Marriage = request.getParameter("marriage");
            if(Marriage == ""){
                error = true;
                msg = "Invalid Marriage!";
                break;
            }
        }
        if(request.getParameter("education")!=null){
            Education = request.getParameter("education");
            if(Education == ""){
                error = true;
                msg = "Invalid Education!";
                break;
            }
        }
        if(request.getParameter("id")!=null){
            SId = request.getParameter("id");
            if(SId == ""){
                error = true;
                msg = "Invalid SId!";
                break;
            }
        }
        if(request.getParameter("scholar")!=null){
            SName = request.getParameter("scholar");
            if(SName == ""){
                error = true;
                msg = "Invalid SName!";
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
    sql = "INSERT INTO application (id, name, gender, marriage, education,scholar) VALUES ('"+ SId +"','"+ Name +"','"+ Gender +"','"+ Marriage +"','"+ Education +"','"+ SName +"')";
    int ret = stmt.executeUpdate(sql);
    if(ret > 0){
        msg = "Apply success!";
    }else{
        msg = "Apply Error!";
    }
    stmt.close();
    conn.close();
} 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scholarship Application</title>
<style type="text/css">
	body{background:#F5F5F5;text-align:center;}
</style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript" src = "wejs/jquery-2.1.1.min.js"></script>
</head>

<body>

<div class="container">
	<h1>Student Scholarship Application</h1>
	<center>
      <table border="1" width="780" cellpadding="0" cellspacing="0" bordercolorlight="#BDBEBB" bordercolordark="#f9f9ec" style="border-style: fixed; border-collapse:collapse; border-color: #BDBEBB">
      <tr>
        <th class='c1'>ID</th>
        <th class='c2'>Name</th>
        <th class='c3'>Gender</th>
        <th class='c4'>Marriage</th>
        <th class='c5'>Education</th>
        <th class='c6'>Scholarship</th>
        <th class='c7'>-</th>
      </tr>
    </center>
<%
	JDBC_DRIVER = "com.mysql.jdbc.Driver";
	DB_URL = "jdbc:mysql://localhost:3306/testDB";
	USER = "root";
	PASS = "";
	conn = null;
	stmt = null;
	result = null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
	stmt = (Statement) conn.createStatement();
	sql = "select * from application;"; 
	result = stmt.executeQuery(sql);
	
    while (result.next()) {
	        %>
	        <tr>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("id") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("name") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("gender") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("marriage") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("education") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("scholar") %></td>
	        <td style="text-align:center;vertical-align:middle;"><a href='deleteapp.jsp?pid=<%=result.getString("id") %>'>delete</a></td>
          	</tr>
	        <%
	    }
%>
</table>
<br><br>
    <form action="apply.jsp?pid=<%=origId %>" method="post" name="f">
    
           ID:<input name="id" type="text" />
        <br/><br/>
         Name:<input name="name" type="text"/>
        <br/><br/>
       <br />
        Gender:
        <select name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        </select>
        <br />
        <br/><br/>
          Marriage:<input name="marriage" type="text" />
        <br/><br/>
    Education:
        <br />
        <select name="education">
        <option value="PhD">PhD</option>
        <option value="Master">Master</option>
        <option value="Bachelor">Bachelor</option>
        </select>
        <br />
        <br />
      Scholar:<input name="scholar" type="text" value= "<%=value2%>" />
        <br/><br/>
    <input type="submit" name="sub" value="Apply"/>
    <input type="reset" name="rset" value="Reset"/>
    <br/><br/>
    </form><br/><br/>
    <p><%=msg %></p>
    <p><%=msg1 %></p>
    <a href='student.jsp'>Return</a>
</div> 
</body>
</html>