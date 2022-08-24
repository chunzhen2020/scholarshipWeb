

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String regDomain = "@lsu.edu";
        String password = request.getParameter("password");
        String re = ""; 
        
        System.out.println("Connecting to database...");
        
        if(id == "" || id == null || id.length()>20){  
            try {  
                re = "Invalid ID!";  
                request.setAttribute("message", re);  
                response.sendRedirect("Register.html");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        } else if(!(id.substring(0,2).equals("89") || id.substring(0,2).equals("90"))){
        	try {  
                re = "ID starts 89 or 90!";  
                request.setAttribute("message", re);  
                response.sendRedirect("Register.html");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            } 
        }
        if(username == "" || username == null || username.length()>20){  
            try {  
                re = "Invalid username!";  
                request.setAttribute("message", re);  
                response.sendRedirect("Register.html");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }                  
	}	if(password == "" || password == null || password.length() > 20){  
        try {  
            re = "Invalid password!";  
            request.setAttribute("message", re);  
            response.sendRedirect("Register.html");  
            return;  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    } 
    if(email == "" || email == null || email.length()>20 || !email.contains(regDomain)){  
        try { 
            response.sendRedirect("Register.html");  
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
	try {
		 Class.forName("com.mysql.jdbc.Driver");
		 conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
		 stmt = (Statement) conn.createStatement();
		 String sql = "INSERT INTO user (username, id, email, password) VALUES ('"+ username +"','"+ id +"','"+email+"','"+ password +"')";
		 int result = stmt.executeUpdate(sql);
		 response.sendRedirect("Login.html") ; 
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e){
		e.printStackTrace();
	}
    
}

}
