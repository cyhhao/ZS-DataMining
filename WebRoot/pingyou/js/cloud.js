
var fill = d3.scale.category10();

var w = 960,
    h = 600;

var words = [],
    max,
    scale = 1,
    complete = 0,
    keyword = "",
    tags,
    fontSize,
    maxLength = 30,
    fetcher;
    //statusText = d3.select("@@status");

var layout = d3.layout.cloud()
    .timeInterval(10)
    .size([w, h])
    .fontSize(function(d) { return fontSize(+d.value); })
    .text(function(d) { return d.key; })
    .on("word", progress)
    .on("end", draw);

var background;
//d3.select(window).on("hashchange", hashchange);



function createXmlHttpRequest(){  
    if(window.ActiveXObject){ //如果是IE浏览器  
        return new ActiveXObject("Microsoft.XMLHTTP");  
    }else if(window.XMLHttpRequest){ //非IE浏览器  
        return new XMLHttpRequest();  
    }  
}  
  
function getrequst(tag){    
	if(!document.getElementById("word0"))
	{
		var svg = d3.select("cloud").append("svg")
		.attr("id","word0")
	    .attr("width", w)
	    .attr("height", h);

		background = svg.append("g"),
	    vis = svg.append("g")
	    .attr("transform", "translate(" + [w >> 1, h >> 1] + ")");
	}
	
    
	if(tag=="word")
	{
		document.getElementById("trtr").innerHTML="字越大，表示被提及越多次<br>字的大小反应了热度";
	}
	else
	{
		document.getElementById("trtr").innerHTML="字越大，表示被搜索越多次<br>字的大小反应了热度";
	}
	
    var url = "../servlet/get_keywords?value="+tag;
          //drw(10);
    //1.创建XMLHttpRequest组建  
    xmlHttpRequest = createXmlHttpRequest();  
      
    //2.设置回调函数  
    xmlHttpRequest.onreadystatechange = getit;  
      
    //3.初始化XMLHttpRequest组建  
    xmlHttpRequest.open("GET",url,true);  
      
    //4.发送请求  
    xmlHttpRequest.send(null);  
    
      
}     

function remov()
{
	document.getElementById("trtr").innerHTML="点击以下按钮，开启";
	var self=document.getElementById("word0");
	if(self)
	{
		var par=self.parentNode;
		par.removeChild(self);
	}
	document.getElementById("blank1").setAttribute("style","height:200px");
}

	




function getit()
{
	var aaaa=[{"key":"qqq","value":"50"},{"key":"www","value":"50"}];
	if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200){  
        var b = xmlHttpRequest.responseText;  
        var json='{"it":'+b+'}';
        var obj=eval('(' + json + ')');
        var aaaa=obj.it;
        generate(aaaa); 
        
	}
	document.getElementById("blank1").setAttribute("style","height:0px");


//d3.select("@text").property("value")
}
//layout.start();

// From Jonathan Feinberg's cue.language, see lib/cue.language/license.txt.
var punctuation = new RegExp("[" + unicodePunctuationRe + "]", "g"),
    wordSeparators = /[\s\u3031-\u3035\u309b\u309c\u30a0\u30fc\uff70]+/g,
    htmlTags = /(<[^>]*?>|<script.*?<\/script>|<style.*?<\/style>|<head.*?><\/head>)/g,
    matchTwitter = /^https?:\/\/([^\.]*\.)?twitter\.com/;



function parseHTML(d) {
  parseText(d.replace(htmlTags, " ").replace(/&#(x?)([\dA-Fa-f]{1,4});/g, function(d, hex, m) {
    return String.fromCharCode(+((hex ? "0x" : "") + m));
  }).replace(/&\w+;/g, " "));
}

function getURL(url, callback) {
  //statusText.text("Fetching鈥�");

  if (matchTwitter.test(url)) {
    var iframe = d3.select("body").append("iframe").style("display", "none");
    d3.select(window).on("message", function() {
      var json = JSON.parse(d3.event.data);
      callback((Array.isArray(json) ? json : json.results).map(function(d) { return d.text; }).join("\n\n"));
      iframe.remove();
    });
    iframe.attr("src", "http://jsonp.jasondavies.com/?" + encodeURIComponent(url));
    return;
  }

  try {
    d3.text(url, function(text) {
      if (text == null) proxy(url, callback);
      else callback(text);
    });
  } catch(e) {
    proxy(url, callback);
  }
}

function proxy(url, callback) {
  d3.text("//www.jasondavies.com/xhr?url=" + encodeURIComponent(url), callback);
}

function flatten(o, k) {
  if (typeof o === "string") return o;
  var text = [];
  for (k in o) {
    var v = flatten(o[k], k);
    if (v) text.push(v);
  }
  return text.join(" ");
}

function parseText(abc) {
	/*
  tags = {};
  var cases = {};
  
  text.split(false ? /\n/g : wordSeparators).forEach(
  function(word) {
	  
    //if (discard.test(word)) return;
    
    word = word.replace(punctuation, "");
    
    //if (stopWords.test(word.toLowerCase())) return;
    document.getElementById("trtr").innerHTML=word;
    word = word.substr(0, maxLength);
    cases[word.toLowerCase()] = word;
    tags[word = word.toLowerCase()] = (tags[word] || 0) + 1;
  });
  
  tags = d3.entries(tags).sort(function(a, b) { return b.value - a.value; });
  tags.forEach(function(d) { d.key = cases[d.key]; });
  */
	
  generate(abc);
}

function generate(abc) {
	
  var tags=abc;//[{"key":"qqq","value":"1"},{"key":"www","value":"55"}];
  layout
      .font("微软雅黑")
      .spiral("archimedean");
  fontSize = d3.scale["log"]().range([10, 100]);
  if (tags.length) fontSize.domain([+tags[tags.length - 1].value || 1, +tags[0].value]);
  complete = 0;
 // statusText.style("display", null);
  words = [];
  
  layout.stop().words(tags.slice(0, max = Math.min(tags.length, +100))).start();   //tags.slice(0, max = Math.min(tags.length, +100))
  var tex=tags;
  document.getElementById("print").innerHTML=tags[0].key;

}

function progress(d) {
 // statusText.text(++complete + "/" + max);
}

function draw(data, bounds) {
 // statusText.style("display", "none");
  scale = bounds ? Math.min(
      w / Math.abs(bounds[1].x - w / 2),
      w / Math.abs(bounds[0].x - w / 2),
      h / Math.abs(bounds[1].y - h / 2),
      h / Math.abs(bounds[0].y - h / 2)) / 2 : 1;
  words = data;
  var text = vis.selectAll("text")
      .data(words, function(d) { return d.text.toLowerCase(); });
  text.transition()
      .duration(1000)
      .attr("transform", function(d) { return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")"; })
      .style("font-size", function(d) { return d.size + "px"; });
  text.enter().append("text")
      .attr("text-anchor", "middle")
      .attr("transform", function(d) { return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")"; })
      .style("font-size", function(d) { return d.size + "px"; })
      .style("opacity", 1e-6)
    .transition()
      .duration(1000)
      .style("opacity", 1);
  text.style("font-family", function(d) { return d.font; })
      .style("fill", function(d) { return fill(d.text.toLowerCase()); })
      .text(function(d) { return d.text; });
  var exitGroup = background.append("g")
      .attr("transform", vis.attr("transform"));
  var exitGroupNode = exitGroup.node();
  text.exit().each(function() {
    exitGroupNode.appendChild(this);
  });
  exitGroup.transition()
      .duration(1000)
      .style("opacity", 1e-6)
      .remove();
  vis.transition()
      .delay(1000)
      .duration(750)
      .attr("transform", "translate(" + [w >> 1, h >> 1] + ")scale(" + scale + ")");
}

// Converts a given word cloud to image/png.


function hashchange(fallback) {
  var h = location.hash;
  if (h && h.length > 1) {
    h = decodeURIComponent(h.substr(1));
    if (h !== fetcher) load(h);
  } else if (fallback) load(fallback);
}

function load(abc) {
  /*
	fetcher = f;
  var h = /^https?:\/\//.test(fetcher)
      ? "#" + encodeURIComponent(fetcher)
      : "";

  if (location.hash !== h) location.hash = h;
  if (h) getURL(fetcher, parseHTML);
  else if (fetcher) */
  parseText(abc);
}



(function() {
  var r = 40.5,
      px = 35,
      py = 20;

  getAngles();

  function getAngles() {
    count = 1;
    from =-60// Math.max(-90, Math.min(90, 0));
    to =60// Math.max(-90, Math.min(90, 0));
    update();
  }

  function update() {
    scale.domain([0, count - 1]).range([from, to]);
    var step = (to - from) / count;

    var path = angles.selectAll("path.angle")
        .data([{startAngle: from * radians, endAngle: to * radians}]);
    path.enter().insert("path", "circle")
        .attr("class", "angle")
        .style("fill", "#fc0");
    path.attr("d", arc);

    var line = angles.selectAll("line.angle")
        .data(d3.range(count).map(scale));
    line.enter().append("line")
        .attr("class", "angle");
    line.exit().remove();
    line.attr("transform", function(d) { return "rotate(" + (90 + d) + ")"; })
        .attr("x2", function(d, i) { return !i || i === count - 1 ? -r - 5 : -r; });

    var drag = angles.selectAll("path.drag")
        .data([from, to]);
    drag.enter().append("path")
        .attr("class", "drag")
        .attr("d", "M-9.5,0L-3,3.5L-3,-3.5Z")
        .call(d3.behavior.drag()
          .on("drag", function(d, i) {
            d = (i ? to : from) + 90;
            var start = [-r * Math.cos(d * radians), -r * Math.sin(d * radians)],
                m = [d3.event.x, d3.event.y],
                delta = ~~(Math.atan2(cross(start, m), dot(start, m)) / radians);
            d = Math.max(-90, Math.min(90, d + delta - 90)); // remove this for 360掳
            delta = to - from;
            if (i) {
              to = d;
              if (delta > 360) from += delta - 360;
              else if (delta < 0) from = to;
            } else {
              from = d;
              if (delta > 360) to += 360 - delta;
              else if (delta < 0) to = from;
            }
            update();
          })
          .on("dragend", generate));
    drag.attr("transform", function(d) { return "rotate(" + (d + 90) + ")translate(-" + r + ")"; });
    layout.rotate(function() {
      return scale(~~(Math.random() * count));
    });
    
  }

  function cross(a, b) { return a[0] * b[1] - a[1] * b[0]; }
  function dot(a, b) { return a[0] * b[0] + a[1] * b[1]; }
})();
