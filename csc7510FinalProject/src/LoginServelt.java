

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServelt
 */
@WebServlet("/LoginServelt")
public class LoginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		final PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re = ""; 
        String regDomain = "@lsu.edu";
        String email = "";
        if(username == "" || username == null || username.length()>20){  
            try {  
                re = "Invalid username!";  
                request.setAttribute("message", re);  
                response.sendRedirect("Login.html");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
          
        if(password == "" || password == null || password.length() > 20){  
            try {  
                re = "Invalid password!";  
                request.setAttribute("message", re);  
                response.sendRedirect("Login.html");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        } 
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost:3306/testDB";
		String USER = "root";
		String PASS = "";
		Connection conn = null;
		Statement stmt = null;
		ResultSet result = null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
			 stmt = (Statement) conn.createStatement();
			 String sql = "";
			 if(username.contains(regDomain)){
				 email = username;
				 sql = "select * from user where email='"+email+"' and password= '"+password+"'";
			 } else {
				 sql = "select * from user where username='"+username+"' and password= '"+password+"'";
			 } 
			 result = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e){
			e.printStackTrace();
		}
		//HttpSession session = request.getSession();  
	    //session.setAttribute("username", username);  
	    //System.out.println("hello world!\n"); 
	    try {  
	        if(result.next()){     
	        	//stmt.close();
	        	//out.close();
	        	
	        	String rs = result.getString("id");
	        	if(rs.substring(0,2).equals("89")){
	        		response.sendRedirect("student.jsp") ;  
	        	} else if(rs.substring(0,2).equals("90")) {
	        		response.sendRedirect("manager.jsp") ; 
	        	}
	            
	            return;  
	        }else{  
	            //session.setAttribute("message", "This user does not exist!");  
	        	//stmt.close();
	        	//out.close();
	            return;  
	        }  
	          
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    } 
	}

}
