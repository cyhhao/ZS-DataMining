import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;






public class get_keywords extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public get_keywords() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		JSONArray jsonObj = new JSONArray();
		String value=request.getParameter("value");
		
		jdbc jdb=new jdbc();
		
		List<List<word>> list=new ArrayList<List<word>>();
		List<word> list1=new ArrayList<word>();
		List<word> list2=new ArrayList<word>();
		
		list=jdb.do_search_words();
		list1=list.get(0);
		list2=list.get(1);
		
		if(value.equals("word"))
		{
			for(int i=0;i<list1.size();i++)
			{
				word w=list1.get(i);
				Map map=new HashMap<String, String>();
				map.put("key",w.key);
				map.put("value", w.count);
				jsonObj.put(map);  
			}
		}
		else
		{
			for(int i=0;i<list2.size();i++)
			{
				word w=list2.get(i);
				Map map=new HashMap<String, String>();
				map.put("key",w.key);
				map.put("value", w.sear);
				jsonObj.put(map);
			}
		}
		
		System.out.println(jsonObj); 
		out.print(jsonObj);
        
      
        
		
		out.flush();
		out.close();
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
