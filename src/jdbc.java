

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;





public class jdbc  {
/*
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	
	static final String DB_URL = "jdbc:mysql://localhost:3306/wusiflyinfo?useUnicode=true&characterEncoding=utf-8";//?useUnicode=true&characterEncoding=utf-8
	static final String USER = "root";
	static final String PASS = "cyh223";
	*/
	static final String DB_URL = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/"+"app_zhusun";
	static final String USER = "j2m3mzx3wz";
	static final String PASS = "kyyxmz3ml252ky3miyxh5iyy0iizizk0i0mjmlih";
	
	Connection conn = null;
	Statement stmt = null;
	jdbc()
	{
		
		   
		      //STEP 2: Register JDBC driver
		    try 
		    {
				  Class.forName("com.mysql.jdbc.Driver");
				  System.out.println("Connecting to database...");
			      conn = DriverManager.getConnection(DB_URL,USER,PASS);

			      //STEP 4: Execute a query
			      System.out.println("Creating statement...");
			      
			      stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			      System.out.println("Creat ok");
			      
			      
			     
			} 
		    catch(SQLException se){
		        //Handle errors for JDBC
		        se.printStackTrace();
		     }catch(Exception e){
		        //Handle errors for Class.forName
		        e.printStackTrace();
		     }finally{
		        //finally block used to close resources
		        
		     }//end try

		      //STEP 3: Open a connection
		    System.out.println("OK!");
	}
	
	public void do_userinfo(int key,String imgurl,String name,String num,String type,String yijuhua,String Njuhua,String fly_id)
	{
	
		String query = "INSERT INTO personinfo (id,fly_id,name,yijuhua,Njuhua,num_id,type,img_url) VALUES ("+
								key+",'"+fly_id+"','"+name+"','"+yijuhua+"','"+Njuhua+"','"+num+"','"+type+"','"+imgurl+ 
										"')";
	      try 
	      {
			stmt.execute(query);
			System.out.println("wirte_ok");
	      } 
	      catch (SQLException e) 
	      {
			// TODO Auto-generated catch block
			e.printStackTrace();
	      }
		
	}
	public void do_review(int rekey,int key,String rename,String renum,String retext,int k)
	{
		String query = "INSERT INTO review (id,info_id,name,num_id,text,now_i) VALUES ("+
				rekey+","+key+",'"+rename+"','"+renum+"','"+retext+"',"+k+ 
						")";
		try 
		{
			stmt.execute(query);
			System.out.println("re_wirte_ok");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<personinfo> do_serch_personinfo(int id,String num_id,String name,String fly_id,String keyword)
	{
		//personinfo info=new personinfo();
		String query="";
		if(id!=0) query="SELECT * FROM personinfo WHERE id="+id;
		else if(!num_id.isEmpty()) query="SELECT * FROM personinfo WHERE num_id='"+num_id+"'";
		else if(!name.isEmpty()) query="SELECT * FROM personinfo WHERE name='"+name+"'";
		else if(!fly_id.isEmpty()) query="SELECT * FROM personinfo WHERE fly_id='"+fly_id+"'";
		else if(!keyword.isEmpty()) query="SELECT * FROM personinfo WHERE yijuhua LIKE '%"+keyword+"%'"
				+" OR "+"Njuhua LIKE '%"+keyword+"%'";
		else query="SELECT * FROM personinfo";
		ResultSet rs;
		List<personinfo> list=new ArrayList<personinfo>();
		try 
		{
			rs = stmt.executeQuery(query);
			
			while(rs.next())
			{
				personinfo info=new personinfo();
				info.key=rs.getInt("id");
				info.fly_id=rs.getString("fly_id");
				info.name=rs.getString("name");
				info.imgurl=rs.getString("img_url");
				info.yijuhua=rs.getString("yijuhua");
				info.Njuhua=rs.getString("Njuhua");
				info.num=rs.getString("num_id");
				info.type=rs.getString("type");
				list.add(info);
				
				//System.out.println(""+rs.getString("name"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//if(list.isEmpty()) list.add(new personinfo());
		return list;
	}
	public int do_serch_personinfo(String keyword)
	{
		//personinfo info=new personinfo();
		String query="";
		int size=0;
		if(!keyword.isEmpty()) query="SELECT * FROM personinfo WHERE yijuhua LIKE '%"+keyword+"%'"
				+" OR "+"Njuhua LIKE '%"+keyword+"%'";
		else query="SELECT * FROM personinfo";
		ResultSet rs;
		try 
		{
			rs = stmt.executeQuery(query);
			rs.last();
			size=rs.getRow();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return size;
	}
	
	public List<personinfo> do_serch_review_toperson(int info_id,String name,String num_id,String keyword)
	{
		String query="";
		if(info_id!=0) query="SELECT * FROM review WHERE info_id="+info_id;
		else if(!num_id.isEmpty()) query="SELECT * FROM review WHERE num_id='"+num_id+"'";
		else if(!name.isEmpty()) query="SELECT * FROM review WHERE name='"+name+"'";
		else if(!keyword.isEmpty()) query="SELECT * FROM review WHERE text LIKE '%"+keyword+"%'";
		else query="SELECT * FROM review";
		ResultSet rs;
		
		
		int count[]=new int[1200];
		List<personinfo> list=new ArrayList<personinfo>();
		try 
		{
			rs = stmt.executeQuery(query);
			int cnt=0;
			while(rs.next())
			{
				reviewinfo info=new reviewinfo();
				info.key=rs.getInt("info_id");
				info.rekey=rs.getInt("id");
				info.rename=rs.getString("name");
				info.renum=rs.getString("num_id");
				info.retext=rs.getString("text");
				
				count[info.key]++;
				if(count[info.key]==1)cnt++;
				
				//list.add(info);
				//System.out.println(""+rs.getString("name"));
			}
			rs.close();
			if(cnt>8) cnt=8;
			int cmp[]=new int [10];
			int k=0,max;
			int geshu[]=new int [10];
			for(int j=1;j<=cnt;j++)
			{
				max=0;
				for(int i=1;i<=1100;i++)
				{
					if(count[i]>max) {max=count[i];k=i;}
				}
				cmp[j]=k;
				geshu[j]=max;
				count[k]=0;
			}
			
			for(int i=1;i<=cnt;i++)
			{
				int j=cmp[i];
				List<personinfo> in=do_serch_personinfo(j,"","","","");
				personinfo it=in.get(0);
				it.key=geshu[i];
				list.add(it);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public int do_serch_review(String keyword)
	{
		String query="";
		if(!keyword.isEmpty()) query="SELECT * FROM review WHERE text LIKE '%"+keyword+"%'";
		else query="SELECT * FROM review";
		ResultSet rs;
		int size=0;
		try 
		{
			rs = stmt.executeQuery(query);
			rs.last();
			size=rs.getRow();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return size;
	}
	
	public void do_savewords(String keyword,int count)
	{
		String query="";
		query="SELECT * FROM wordcount" ;
		int key=0;
		ResultSet rs;
		try 
		{
			rs = stmt.executeQuery(query);
			rs.last();
			key=rs.getRow();
			
			query="SELECT * FROM wordcount WHERE word='"+keyword+"'";
			rs = stmt.executeQuery(query);
			if(rs.next())
			{
				int t=rs.getInt("sear")+1;
				rs.updateInt("sear",t);
				rs.updateRow();
			}
			else
			{
				key++;
				query = "INSERT INTO wordcount (id,word,count,sear) VALUES ("+
						key+",'"+keyword+"',"+count+","+1+
								")";
				stmt.execute(query);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		key++;
		
		
		
	}
	
	public List<List<word>> do_search_words()
	{
		String query="";
		
		List<word> list1=new ArrayList<word>();
		List<word> list2=new ArrayList<word>();
		ResultSet rs;
		try 
		{
			query="SELECT * FROM wordcount ORDER BY count DESC" ;
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				word w=new word();
				w.count=rs.getInt("count");
				w.key=rs.getString("word");
				w.sear=rs.getInt("sear");
				list1.add(w);
			}
			query="SELECT * FROM wordcount ORDER BY sear DESC" ;
			rs = stmt.executeQuery(query);
			while(rs.next())
			{
				word w=new word();
				w.count=rs.getInt("count");
				w.key=rs.getString("word");
				w.sear=rs.getInt("sear");
				list2.add(w);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<List<word>> list=new ArrayList<List<word>>();
		list.add(list1);
		list.add(list2);
		return list;
	}
	
	public void do_write_review(String name,String msg,int type,String date)
	{
		String query="SELECT * FROM zsreview" ;
		try 
		{
			ResultSet rs = stmt.executeQuery(query);
			rs.last();
			int count=rs.getRow();
			int id=count+1;
			query = "INSERT INTO zsreview (id,name,msg,type,date) VALUES ("+
					id+",'"+name+"','"+msg+"',"+type+",'"+date+"'"+
							")";
			stmt.execute(query);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<zsreview> do_search_zsreview(int num)
	{
		List<zsreview> list=new ArrayList<zsreview>();
		String query="SELECT * FROM zsreview ORDER BY id DESC LIMIT "+num ;
		try 
		{
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				zsreview it=new zsreview();
				it.name=rs.getString("name");
				it.msg=rs.getString("msg");
				it.type=rs.getInt("type");
				it.date=rs.getString("date");
				it.id=rs.getInt("id");
				list.add(it);
			}
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	protected void finalize()
	{
		try{
	        if(stmt!=null)
	           stmt.close();
	     }catch(SQLException se2){
	     }// nothing we can do
	     try{
	        if(conn!=null)
	           conn.close();
	     }catch(SQLException se){
	        se.printStackTrace();
	     }//end finally try
	}
	
}

