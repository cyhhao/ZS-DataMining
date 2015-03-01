<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
/*
String str=request.getParameter("zsadmin");
if(str==null||!str.equals("cyh"))
{
	response.setContentType("text/html; charset=utf-8");
	response.sendRedirect("../");
}
else
{


}
*/



 %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>竹笋|挖掘评优数据</title>
		<link rel="icon" href="images/favicon.ico">
		<link rel="shortcut icon" href="images/favicon.ico" />
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/camera.css">
		<link rel="stylesheet" href="css/form.css">
        <style type="text/css">


fieldset.search {
	padding: 0px;
	border: none;
	background:#e0e0e0;

}

fieldset.search:hover {
	background: #a8a8a8;
}
.search input, .search button {
	border: none;
	float: left;
	
}
.search input.box {
	height: 28px;
	width: 90%;
	margin-right: 0px;
	padding-right: 0px;
	background: #e0e0e0;
	margin: 1px;
	
	
	
}
.search input.box:focus {
	background: #e8e8e8 ;
	outline: none;
}
.search button.btn {
	border: none;
	width: 92px;
	height: 77px;
	margin: 0px auto;
	vertical-align:middle;
	
	
	background-image: url("images/f003.png");
}
.search button.btn:hover {
	background-image: url("images/f004.png");
}

a.socio_contact_twitter 
{

height: 50px;
width: 50px;
background-image:url('images/renren.png');
}

</style>

<style>
/* CHECKBOXES */
#check_frame {
  /*position: absolute;*/
  top: -75px; left: 0; right: 0; bottom: 0;
  width: 150px; height: 40px;
  padding: 10px; margin: auto;
  /*border: 1px solid #EEE;*/
}
#check_frame .checkbox { display: none; }
#check_frame  .trigger {
  cursor: pointer;
  position: relative;
  float: left;
  width: 30px; height: 20px;
  margin: 10px;
  background: #666;
  overflow: hidden;
  -webkit-transition: background .15s linear;
}
#check_frame .checkbox:checked + .trigger { background: #00C5FF; }
#check_frame .trigger:before {
  content: '';
  position: absolute;
  top: 0; left: 0; bottom: 0;
  width: 10px; height: 10px;
  margin: auto 5px;
  box-shadow: 0 0 0 100px hsla(0, 0%, 0%, .3);
  -webkit-transition: left .15s linear;
}
#check_frame .checkbox:checked + .trigger:before { left: 10px; }
/* RADIO BUTTONS */
#radio_frame {
  
  top: 75px; left: 0; right: 0; bottom: 0;
  width: 210px; height: 40px;
  padding: 10px; margin: auto;
  border-radius: 40px;
  border: 1px solid #EEE;
}
#radio_frame .radio { display: none; }
#radio_frame  .trigger {
  cursor: pointer;
  position: relative;
  float: left;
  width: 30px; height: 20px;
  margin: 10px;
  border-radius: 20px;
  background: #666;
  overflow: hidden;
  -webkit-transition: background .15s linear;
}
#radio_frame .radio:checked + .trigger { background: #00C5FF; }
#radio_frame .trigger:before {
  content: '';
  position: absolute;
  top: 0; left: 0; bottom: 0;
  width: 10px; height: 10px;
  margin: auto 5px;
  border-radius: 100%;
  box-shadow: 0 0 0 100px hsla(0, 0%, 0%, .3);
  -webkit-transition: left .15s linear;
}
#radio_frame .radio:checked + .trigger:before { left: 10px; }</style>
        
        
		<script src="js/jquery.js"></script>
		<script src="js/jquery-migrate-1.1.1.js"></script>
		<script src="js/superfish.js"></script>
		<script src="js/forms.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/jquery.equalheights.js"></script>
		<script src="js/jquery.easing.1.3.js"></script>
		<script src="js/jquery.ui.totop.js"></script>
		<script src="js/tms-0.4.1.js"></script>
		<script>
			$(document).ready(function(){
				$('.slider_wrapper')._TMS({
					show:0,
					pauseOnHover:false,
					prevBu:'.prev',
					nextBu:'.next',
					playBu:false,
					duration:800,
					preset:'fade',
					pagination:true,//'.pagination',true,'<ul></ul>'
					pagNums:false,
					slideshow:3000,
					numStatus:false,
					banners: 'fade',
					waitBannerAnimation:false,
					progressBar:false
				});
			refresh();
			});
			
			$(document).ready(aabb());
					function goToByScroll(id){
				$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');
				}
				$(document).ready(function(){
					$().UItoTop({ easingType: 'easeOutQuart' });
				});
				
				
function aabb(){
try{
				!function(){
			var map=[]
			 ,names=[]
			 ,win=$(window)
			 ,header=$('header')
			 ,currClass;
			$('.content').each(function(n){
			 map[n]=this.offsetTop;
			 names[n]=$(this).attr('id');
			});
			win
			 .on('scroll',function(){
				var i=0;
				while(map[i++]<=win.scrollTop());
				if(currClass!==names[i-2])
				currClass=names[i-2];
				header.removeAttr("class").addClass(names[i-2]);
			 });
			
			}(); 
}
catch(err)
  {
  txt="本页有一个错误。\n\n";
  txt+="错误描述：" + err.message + "\n\n";
  txt+="点击确定继续。\n\n";
  alert(txt);
  }  
				
}
				
		</script>
		<!--[if lt IE 8]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
					<img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
				</a>
			</div>
		<![endif]-->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.js"></script>
			<link rel="stylesheet" media="screen" href="css/ie.css">
		<![endif]-->
	</head>
	<body class="">
<!--==============================header=================================-->
		<header class="page1">
			<div class="container_12">
				<div class="grid_12">
					<h1><a href="http://page.renren.com/601875589"><img src="images/logo.png" alt="进入人人主页"></a></h1>
					<div class="menu_block">
						<nav class="">
							<ul class="sf-menu">
								<li class="current men"><a onClick="goToByScroll('page1'); " href="#"><b>数据？数据！</b> </a> <strong class="hover"></strong></li>
								<li class="men1"><a onClick="goToByScroll('page2'); " href="#"><b>一起来挖关键词</b></a><strong class="hover"></strong></li>
								<li class=" men2"><a onClick="goToByScroll('page3'); " href="#" ><b>最热关键词</b></a> <strong class="hover"></strong></li>
								<li class=" men3"><a onClick="goToByScroll('page4'); " href="#"><b>你的见解</b></a> <strong class="hover"></strong></li>
								<li class=" men4"><a onClick="goToByScroll('page5'); " href="#"><b>我们是『竹笋』</b></a> <strong class="hover"></strong></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
        <div class="copyrights">Collect from </div>
<!--=======content================================-->
		<div id="page1" class="content">
			<div class="ic"></div>
			<div class="container_12">
				<div class="grid_12">
					<div class="slider_wrapper">
						<ul class="items">
							<li>
								<img src="images/spacer.gif" alt="">
								<div class="caption banner">
                                    <a target="_blank" href="../"><img src="images/page_pic1.jpg"></img></a>
								</div>
							</li>
							<li>
								<img src="images/spacer.gif" alt="">
								<div class="caption banner">
									<a target="_blank" href="../"><img src="images/page_pic2.jpg"></img></a>
								</div>
							</li>
							<li>
								<img src="images/spacer.gif" alt="">
								<div class="caption banner">
									<a target="_blank" href="../"><img src="images/page_pic3.jpg"></img></a>
								</div>
							</li>
							<li>
								<img src="images/spacer.gif" alt="">
								<div class="caption banner">
									<a target="_blank" href="../"><img src="images/page_pic4.jpg"></img></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="page2" class="content">
			<div class="container_12">
          <div style="width:100%">
<script type="text/javascript">
function keyLogin(){
  if (event.keyCode==13)   //回车键的键值为13
     document.getElementById("search").click();  //调用登录按钮的登录事件
}


</script>

	<fieldset class="search" >
		 <input onkeydown="keyLogin();" style="vertical-align:middle;font-size:22px;font-family:'楷体'" type="text" class="box" name="nana" id="s" class="inputText" placeholder="搜索你喜欢的关键词" x-webkit-speech>
		  <button onclick="onLogin(); " class="btn" title="SEARCH" id="search"> </button>
	</fieldset>
	<script src="js/Un.js"></script>
	<ppp id="nono"></ppp>
<script type="text/javascript">
    var xmlHttpRequest;  
      
      
    //XmlHttpRequest对象  
    function createXmlHttpRequest(){  
        if(window.ActiveXObject){ //如果是IE浏览器  
            return new ActiveXObject("Microsoft.XMLHTTP");  
        }else if(window.XMLHttpRequest){ //非IE浏览器  
            return new XMLHttpRequest();  
        }  
    }  
      
    function onLogin(){    
        var sear=document.getElementById("s").value;
        
        if(sear.length<2) document.getElementById("s").value="请输入大于等于两个字";
        else
        {
        	var url = "../servlet/words?search="+encodeURI(sear);
              //drw(10);
        //1.创建XMLHttpRequest组建  
        xmlHttpRequest = createXmlHttpRequest();  
          
        //2.设置回调函数  
        xmlHttpRequest.onreadystatechange = zswFun;  
          
        //3.初始化XMLHttpRequest组建  
        xmlHttpRequest.open("GET",url,true);  
          
        //4.发送请求  
        xmlHttpRequest.send(null);  
        }
          
    }     


    //回调函数  
    function zswFun(){  
        if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){  
            var b = xmlHttpRequest.responseText;  
          	var abc=b.split('|');
          	var cao=parseInt(abc[0])+parseInt(abc[1]);
          	var self=document.getElementById("p1");
			if(self)
			{
				var par=self.parentNode;
				par.removeChild(self);
			}
			
			var para=document.createElement("p");
			para.setAttribute("id", "p1");
			para.setAttribute("style","font-family: 'Microsoft YaHei';font-size:26px; line-height:35px");
			
			//var node=document.createTextNode("关键词:"+document.getElementById("s").value+" 有<b>"+abc[0]+"</b>人在自己的故事里提到，有"+abc[1]+"人这样评论别人");
			
			//para.appendChild(node);
			var json='{"it":'+abc[2]+'}';
			var obj=eval('(' + json + ')');  
			
			var element=document.getElementById("nono");
			element.appendChild(para);
			
			document.getElementById("p1").innerHTML="<br>关键词:<b style=\"font-family:'华文楷体'; font-size:50px ;color:#F30\">"+document.getElementById("s").value+"</b>"+
			
			"<br>有<b style=\"font-family:'华文楷体'; font-size:50px ;color:#F30\">"+abc[0]+"</b>人在自己的故事里提到 <br>有<b style=\"font-family:'华文楷体'; font-size:50px ;color:#F30\">"
			+abc[1]+"</b>人这样评价别人";
			
			//document.getElementById("p1").innerHTML=obj.it[0].name;
			
				var str="";
				var i=0;
				var l=(obj.it).length;
				
for(i=0;i<l;i++)
{
	
	var html="<div class=\"grid_3\">"+
					"<div class=\"box maxheight\" style=\"font-family: 'Microsoft YaHei';width:214;height: 283px;\">"+
						"<img src=\""+"pic/"+obj.it[i].url+".jpg\" >"+
						"<div class=\"text1\" style=\"font-family: 'Microsoft YaHei'; font-size: 25px\"><a target=\"_blank\" href=\""+"http://my.nuaa.edu.cn/plugin.php?id=evaluation:evaluation&a=show&uid="+obj.it[i].url+"\">"+obj.it[i].name+"</a></div><br>"+obj.it[i].type+
						"<div style=\"font-family: 'Microsoft YaHei'; font-size: 23px; \">"+
							"<br> 有<b  style=\"font-size: 23px; color:red\">"+obj.it[i].count+"</b>人这样评价Ta"+
						"</div>"+
					"</div>"+
				"</div>";
	str+=html;

}
document.getElementById("pic").innerHTML=str;
document.getElementById("tip1").innerHTML="<b style=\"font-size: 50px; color:red\">Top "+l+"</b>";
//document.getElementById("pic").innerHTML=l;
			
          	if(cao>=600) cao=600;
            drw(cao+1,obj);   
            
            document.getElementById("tip_k").innerHTML="“名副其实”排行榜";
            
        }
}

    


function drw(b,obj)
{
	var self=document.getElementById("svg1");
	if(self)
	{
		var par=self.parentNode;
		par.removeChild(self);
	}
	

	
	var width = 1024,
    height = 700;

var nodes = d3.range(b).map(function() { return {radius: Math.random()*50+2}; }),
    root = nodes[0],
    color = d3.scale.category10();
	
root.radius = 0;
root.fixed = true;

var force = d3.layout.force()
    .gravity(0.05)
    .charge(function(d, i) { return i ? 0 : -2000; })
    .nodes(nodes)
    .size([width, height]);

force.start();

var svg = d3.select("ppp").append("svg")
	.attr("id","svg1")
    .attr("width", width)
    .attr("height", height);
    

svg.selectAll("circle")
    .data(nodes.slice(1))
  .enter().append("circle")
    .attr("r", function(d) { return d.radius; })
    .style("fill", function(d, i) { return color(i % 3); })
	
	;

force.on("tick", function(e) {
  var q = d3.geom.quadtree(nodes),
      i = 0,
      n = nodes.length;

  while (++i < n) q.visit(collide(nodes[i]));

  svg.selectAll("circle")
      .attr("cx", function(d) { return d.x; })
      .attr("cy", function(d) { return d.y; });
});

svg.on("mousemove", function() {
  var p1 = d3.mouse(this);
  root.px = p1[0];
  root.py = p1[1];
  force.resume();
});

function collide(node) {
  var r = node.radius + 16,
      nx1 = node.x - r,
      nx2 = node.x + r,
      ny1 = node.y - r,
      ny2 = node.y + r;
  return function(quad, x1, y1, x2, y2) {
    if (quad.point && (quad.point !== node)) {
      var x = node.x - quad.point.x,
          y = node.y - quad.point.y,
          l = Math.sqrt(x * x + y * y),
          r = node.radius + quad.point.radius;
      if (l < r) {
        l = (l - r) / l * .5;
        node.x -= x *= l;
        node.y -= y *= l;
        quad.point.x += x;
        quad.point.y += y;
      }
    }
    return x1 > nx2 || x2 < nx1 || y1 > ny2 || y2 < ny1;
  };
};
aabb();
}

</script>
</div>

 
				<div class="grid_12">
					<div class="slogan">
						<h3 id="tip_k" style="font-family: 'Microsoft YaHei';line-height:68px">敲出你最想知道的<b style="font-size:60px ; color:#F30">关键词</b></h3>
						<div id="tip1" class="text1" style="font-family: 'Microsoft YaHei';">
							点击“搜索”后显示球数的多少代表了该关键词的热度
						</div>
					</div>
				</div>
<picshow id="pic">
				</picshow>
			</div>
		</div>
		

		<div id="page3" class="content">
			<div class="container_12">
				<div class="grid_12">
					<h3 style="font-size:80px"><b>最热关键词<br><br></b></h3>
				</div>
		

<p id="trtr" style="font-family:'Microsoft YaHei';font-size:20px;line-height: 30px">点击以下按钮，开启</p>


<section id="radio_frame">

<input id="radio_1" class="radio" name="radio" type="radio" onclick="remov();aabb();" checked>
<label for="radio_1" class="trigger" style="min-height:1px;width:50px;font-family:'Microsoft YaHei'">关闭</label>

<input id="radio_2" class="radio" name="radio" type="radio" onclick="getrequst('word');aabb();">
<label for="radio_2" class="trigger" style="min-height:1px;width:50px;font-family:'Microsoft YaHei'">被提及</label>

<input id="radio_3" class="radio" name="radio" type="radio" onclick="getrequst('sear');aabb();">
<label for="radio_3" class="trigger" style="min-height:1px;width:50px;font-family:'Microsoft YaHei'">被搜索</label>
</section>

<cloud id="cloud">
				
		</cloud>
<p id="blank1" style="width:100px;height:200px">
<script src="js/Un.js"></script>
<script src="js/unicode.js"></script>
<script src="js/d3.layout.cloud.js"></script>
<script src="js/cloud.js"></script>

				
				
			</div>
		</div>
		<div id="page4" class="content">
			<div id="cont" class="container_12">
				<div class="grid_12">
					<h3 style="font-family: 'Microsoft YaHei'; line-height:68px; font-size:70px"><b>想赞？想吐槽？</b></h3>
					<p style="font-size:20px;line-height:30px;"><b style="color:#ff00ff">评优</b>的热潮刚刚褪去，没有盼来<b style="color:#0000ff">空调</b>的我们却盼来了<b style="color:#ffff00">小学期</b>。<br>五四评优、小学期、空调…… <br>不知道还有多少<b style="color:#ff0000">赞点</b>和<b style="color:#000000">槽点</b>将伴我们走过这一学期……
					<br>你可以写下你的心声，让历史记住这一刻，共同谱写我们的『学期热门』</p>
					<div class="btns"><a onclick="showre();aabb();">写评论</a><a onclick="refresh();">刷新</a></div>
					<div class="btns"></div>
				</div>
				
				<form id="form" name="itemsub" style="display:none">
						
						
						<label class="name">
						<input id="nikename" type="text" value="昵称:" name="name">
						<br class="clear">
						<span class="empty error-empty">*不能为空</span> </label>
						<script type="text/javascript">
						function imgce(a,b,c)
						{
							var bace="images/box1_img";
							var style0="width:50px;margin:10px;";
							var style1="width:50px;margin:10px;background:rgba(0, 0, 0, 0.20);";
							document.getElementById("imgradio").setAttribute("name",""+a);
							document.getElementById("imgradio").getElementsByTagName("img")[a].src=bace+a+"_p.png";
				
							document.getElementById("imgradio").getElementsByTagName("img")[b].src=bace+b+".png";

							document.getElementById("imgradio").getElementsByTagName("img")[c].src=bace+c+".png";

						}
						
						
						
						</script>
						
						<div id="imgradio" name="nn">
							<a ><img style="width:50px;margin:10px" src="images/box1_img0.png"  onclick="imgce(0,1,2);" class="off">评论</a>
							<a ><img style="width:50px;margin:10px" src="images/box1_img1.png"  onclick="imgce(1,0,2);" class="off">吐槽</a>
							<a ><img style="width:50px;margin:10px" src="images/box1_img2.png"  onclick="imgce(2,0,1);" class="off">点赞</a>
						</div>
						
						
						<label class="message">
						<textarea id="msg" name="msg" type="text">内容:</textarea>
						<br class="clear">
						<span class="error">*评论字数请在 5~140范围内</span> <span class="empty">*不能为空</span> </label>
						<div class="clear"></div>
						
						<div class="btns"><a onclick="post_review()">发送</a>
						<div class="clear"></div>
						</div>
				</form>
				
<script type="text/javascript">

function showre()
{
	var t=document.getElementById("form").getAttribute("style");

	if(t=="display:none") 
	{
		document.getElementById("form").setAttribute("style","display:show");
	}
	else
	{
		document.getElementById("form").setAttribute("style","display:none");
	}
	


}
function post_review(){  
try{
		var nikename=document.getElementById("nikename").value;
		var msg=document.getElementById("msg").value;
		var type=document.getElementById("imgradio").getAttribute("name");
		//document.getElementById("wq").innerHTML=type;
		if(type!="nn" && nikename!="昵称:" && msg!="内容:" && msg.length>=5 && msg.length<=140 )
		{
			
			var url = "../servlet/words";//?usr="+encodeURI(encodeURI(nikename))     
        	//var params = "usr=123";
        	//1.创建XMLHttpRequest组建  
        	xmlHttpRequest = createXmlHttpRequest();  
        	//2.设置回调函数  
        	xmlHttpRequest.onreadystatechange = callback;  
        	//3.初始化XMLHttpRequest组建  
        	xmlHttpRequest.open("POST",url,true);  
        	xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
          
        	//4.发送请求  
        	xmlHttpRequest.send("usr="+encodeURI(encodeURI(nikename))+"&msg="+encodeURI(encodeURI(msg))+"&type="+type);     
		}
		else if(msg.length>140)
		{
			alert("字数超过限制了哦~");
		}
		else if(type=="nn")
		{
			alert("请先选择“评论”or“吐槽”or“点赞”");
		}
		
}
catch(err)
  {
  txt="本页有一个错误。\n\n";
  txt+="错误描述：" + err.message + "\n\n";
  txt+="点击确定继续。\n\n";
  alert(txt);
  }  
		  
}     
function callback(){  
        if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200)//&& xmlHttpRequest.status == 200)
        {  
            var b = xmlHttpRequest.responseText;
            if(b == "true")
            {  
                alert("评论成功！");  
                
		
				var self=document.getElementById("form");
				if(self)
				{
					var par=self.parentNode;
					par.removeChild(self);
				}
                
            }
            else
            {  
                alert("评论失败！"+b);  
            }         
        }  
    }

function refresh()
{

	var num=document.getElementById("review_show").getAttribute("name");
	var url = "../servlet/review?type=1&num="+num;
        	//1.创建XMLHttpRequest组建  
        	xmlHttpRequest = createXmlHttpRequest();  

        	//2.设置回调函数  
        	xmlHttpRequest.onreadystatechange = ref;  
          
        	//3.初始化XMLHttpRequest组建  
        	xmlHttpRequest.open("Get",url,true);  
          
        	//4.发送请求  
        	xmlHttpRequest.send(null);

}
function ref()
{
try{
	if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200)
	{
		var b = xmlHttpRequest.responseText;
		//var json='{"it":'+abc[2]+'}';
		var obj=eval('(' + b + ')');  
		var html="";
		var zan="#E93853";
		var fuck="#000000";
		var fine="#1272D6";
		
		
		for(var i=0;i<obj.length;i++)
		{
			var se=zan;
			if(obj[i].type-0==0) se=fine;
			if(obj[i].type-0==1) se=fuck;
			html+="<div class=\"grid_3\">"+
					"<div class=\"box maxheight1\" style=\"height: 381px;\"><div class=\"box_inner\">"+
					"<p>"+(obj[i].id)+"楼"+"</p>"+
						"<img src=\"images/box1_img"+obj[i].type+".png\" style=\"width:80px"+";background-color:"+se+";border-color:"+se+"\">"+
						"<div class=\"text1\">"+obj[i].name+"</div>"+obj[i].msg+
					"</div></div></div>";
		}
		//html+="<div class=\"btns\"><a style=\"width:50%\">加载更多</a>";
		
		document.getElementById("review_show").innerHTML=html;
		
		var self=document.getElementById("btn_load");
		if(self)
		{
			var par=self.parentNode;
			par.removeChild(self);
		}
		
		document.getElementById("pagefor").innerHTML+="<div id=\"btn_load\" class=\"btns\"><a onclick=\"load_more();\" style=\"width:60%\">加载更多</a></div>";
		//document.getElementById("page4").innerHTML+=""
		aabb();
		$('#form').forms(); //靠！只是为了解决刷新后不能提示字符
	}
	}
catch(err)
  {
  txt="本页有一个错误。\n\n";
  txt+="错误描述：" + err.message + "\n\n";
  txt+="点击确定继续。\n\n";
  alert(txt);
  } 
}
function load_more()
{
	var num=document.getElementById("review_show").getAttribute("name");
	num=num-0;
	num+=4;
	document.getElementById("review_show").setAttribute("name",num);
	refresh();
}

				</script>
				
				<div class="companies" id="review_show" name="8">
					
					
				</div>
				
			</div>
			<div id="pagefor"></div>
		</div>
		<div id="page5" class="content">
			<div class="container_12">
				<div class="grid_12">
					<div class="slogan">
						<h3 style="margin-top:70px;font-size:60px">我们是『竹笋』</h3>
						<div class="text1" style="line-height: 40px">
							<br>
							『竹笋』是一个致力于开发创新互联网产品的团队。
							<br>
							<br>
							
							还记得吗？我们的上一个产品是“五四评优”投票助手，曾帮助许多人便捷地投票。
							<br>
							那么，竹笋的下一个产品会是什么呢？
							<br>
							<img src="images/1.jpg"></img>
							<br>
							我们会不定期地发布新的产品，更多精彩请关注我们的<a style="color: #A49DFF" href="http://page.renren.com/601875589">人人公共主页</a>
							<br>
						</div>
						
					</div>
				</div>
				<div class="clear"></div>
				
				<div class="map">
					<div class="grid_3">
						<div class="text1">联系方式</div>
						<address>
							<dl>
								<dd>电&nbsp;&nbsp;&nbsp;&nbsp;话: 13222773758</dd>
								<dd>主&nbsp;&nbsp;&nbsp;&nbsp;页: <a href="../" class="link-1">zhusun.duapp.com</a></dd>
								<dd>E-mail: <a href="#" class="link-1">zhusun.nuaa@gmail.com</a></dd>
								<dd>人人主页: <a href="http://page.renren.com/601875589" class="link-1">竹笋</a></dd>
							</dl>
						</address>
					</div>
					<div class="grid_3">
						<div class="text1">&nbsp;</div>
						
					</div>
					<div class="grid_5 prefix_1">
						<div class="text1">关注我们的平台</div>
						<a  href="http://page.renren.com/601875589" target="_blank" ><img src="images/renren.png" style="max-width: 20%;"></img></a>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
<!--==============================footer=================================-->
		<footer>
			<div class="container_12">
				<div class="grid_12">
					<div class="copy">
						<a onClick="goToByScroll('page1'); " href="#"><img src="images/footer_logo.png" alt=""></a>  &copy; 2014  <br> designed by zhusun
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</footer>
	</body>
</html>

 
 
 
 
