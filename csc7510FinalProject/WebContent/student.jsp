<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="org.jfree.data.general.DefaultPieDataset"%>  
<%@ page import="org.jfree.data.category.CategoryDataset" %>  
<%@ page import="org.jfree.data.category.DefaultCategoryDataset" %>  
<%@ page import="org.jfree.chart.axis.DateAxis"%> 
<%@ page import="org.jfree.chart.axis.ValueAxis"%> 
<%@ page import="org.jfree.chart.JFreeChart"%>  
<%@ page import="org.jfree.chart.plot.PiePlot"%>  
<%@ page import="org.jfree.chart.ChartRenderingInfo"%>  
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>  
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>  
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>  
<%@ page import="org.jfree.chart.encoders.SunPNGEncoderAdapter"%>  
<%@ page import="org.jfree.chart.StandardChartTheme"%>  
<%@ page import="org.jfree.chart.ChartFactory"%>  
<%@ page import="org.jfree.chart.plot.CategoryPlot"%>  
<%@ page import="org.jfree.chart.plot.PlotOrientation"%>  
<%@ page import="org.jfree.chart.axis.CategoryAxis"%>  
<%@ page import="org.jfree.chart.renderer.category.BarRenderer"%>  
<%@ page import="org.jfree.chart.labels.StandardCategoryItemLabelGenerator"%>  
<%@ page import="java.awt.Font"%>  
<%@ page import="java.awt.Color"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	body{background:#F5F5F5;text-align:center;}
</style>
<script type="text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<script type="text/javascript" src = "wejs/jquery-2.1.1.min.js"></script>
</head>
<body>
<div class="container">
	  <center>
      <h1>Scholarship List</h1>  
      <table border="1" width="780" cellpadding="0" cellspacing="0" bordercolorlight="#BDBEBB" bordercolordark="#f9f9ec" style="border-style: fixed; border-collapse:collapse; border-color: #BDBEBB">
      <tr>
        <th class='c1'>ID</th>
        <th class='c2'>Name</th>
        <th class='c1'>Amount</th>
        <th class='c2'>Candidate</th>
        <th class='c2'>Applications</th>
        <th class='c2'>Quotas</th>
        <th class='c6'>-</th>
      </tr>
      </center>
<%
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
	String sql = "select * from scholarship;"; 
	result = stmt.executeQuery(sql);
	
    while (result.next()) {
	        %>
	        <tr>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("id") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("name") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("amount") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("candidate") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("application") %></td>
	        <td style="text-align:center;vertical-align:middle;"><%=result.getString("quota") %></td>
	        <td style="text-align:center;vertical-align:middle;"><a href='apply.jsp?pid=<%=result.getString("id") %>'>Apply</a>&nbsp;</td>
            </tr>
	        <%
	    }
%>
<br><br>
</table>  
</div> 
<div style="float:center">
         <a href="Login.html">Exit</a>
      </div> 
</body>
</html>