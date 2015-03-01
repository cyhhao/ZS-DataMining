import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;


public class words extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public words() {
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
		
		response.setContentType("text/html ; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//new String(request.getParameter("search").getBytes("ISO-8859-1"),"utf-8");
		String sear=request.getParameter("search");
		jdbc jdb=new jdbc();
		
		//sear=URLDecoder.decode(sear,"GBK");
		
		int perint=jdb.do_serch_personinfo(sear);
		 
		int reint=jdb.do_serch_review(sear);
		
		
		
		jdb.do_savewords(sear, reint+perint);
		System.out.print(sear);
		
		System.out.println("GET");
		
		List<personinfo> list=jdb.do_serch_review_toperson(0,"","",sear);
		JSONArray json=new JSONArray();
		for(int i=0;i<list.size();i++)
		{
			personinfo it=list.get(i);
			Map<String,String> map=new HashMap<String,String>();
			map.put("name",it.name);
			map.put("type",it.type);
			map.put("count",""+it.key);
			map.put("url",it.fly_id);
			json.put(map);
		}
		
		out.print(""+perint+"|"+reint+"|"+json);
		
		//out.print(sear);
		//System.out.println(""+list.size()+json);
		
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

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("lalalal");
		String str=request.getParameter("usr");
		String name=URLDecoder.decode(str,"utf-8"); 
		System.out.println(name+"00");
		
		str=request.getParameter("msg");
		String msg=URLDecoder.decode(str,"utf-8"); 
		System.out.println(msg+"00");
		
		String type=request.getParameter("type");
		System.out.println(type+"00");
		out.print("true");
		int t=Integer.valueOf(type);
		jdbc jdb=new jdbc();
		jdb.do_write_review(name, msg, t,"201404241411");
		
		
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
