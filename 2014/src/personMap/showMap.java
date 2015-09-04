package personMap;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class showMap extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	
	public showMap() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public class User
	{
		public String name;
		public String code;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		}
		
	}
	User user;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id=request.getParameter("id");
		user=new User();
		if(id!=null)
		{
			user.name=id;
		}
		System.out.print(id);
		request.setAttribute("user",user);
		
		//HttpSession session=request.getSession();
		//session.setAttribute("user", user);
		
		response.setContentType("text/html");
		request.getRequestDispatcher("/WEB-INF/PersonMapLogin.jsp").forward(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		//HttpSession ses=request.getSession();
		//User user=(User) ses.getAttribute("user");
		//User user=(User) request.getAttribute("user");
		out.print(request.getParameter("id"));
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		
	}

}
