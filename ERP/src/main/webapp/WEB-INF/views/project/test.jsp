<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
// banner_roll("div태그 id", 배너1개높이, 딜레이, 1칸이동속도, 0);
function banner_roll(div_id, banner_height, banner_delay, banner_speed, this_height){
	
	var div_tag = document.getElementById(div_id);
	var a_tag, i;
	
	this_height ++;
	if(this_height < banner_height) {
		div_tag.style.top = -this_height;
		setTimeout("banner_roll('" + div_id + "', " + banner_height + ", " + banner_delay + ", " + banner_speed + ", " + this_height + ");", banner_speed);
	} else {
		a_tag = div_tag.getElementsByTagName("A");
		div_tag.appendChild(a_tag[0]);
		div_tag.style.top = 0;
		setTimeout("banner_roll('" + div_id + "', " + banner_height + ", " + banner_delay + ", " + banner_speed + ", 0);", banner_delay);
	}

	return true;
}
</script>
</head>
<body>

<!-- 구글 세계시간 시작 -->

<SCRIPT src="http://www.clocklink.com/embed.js"></SCRIPT>
<SCRIPT language=JavaScript type=text/javascript>obj=new Object;obj.clockfile="world001-gray.swf";obj.TimeZone="GMT0900";obj.width=570;obj.height=200;obj.wmode="transparent";showClock(obj);</SCRIPT>

</body>
</html>