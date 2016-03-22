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
<table>
<tr>
<td width="200px" height="120px">
배너 돌리기 1<br />
<div style=":absolute; width:200px; height:60px; overflow:hidden;">
<div style=":relative;" id="banner_1">
<a href="#" style="display:block; height:60px;">테스트1</a>
<a href="#" style="display:block; height:60px;">테스트2(이미지도 OK)</a>
<a href="#" style="display:block; height:60px;">테스트3</a>
<a href="#" style="display:block; height:60px;">테스트4</a>
<a href="#" style="display:block; height:60px;">테스트5</a>
</div>
</div>
</td>
<td width="200px">
배너 돌리기 2<br />
<div style=":absolute; width:200px; height:120px; overflow:hidden;">
<div style=":relative;" id="banner_2">
<a href="#" style="display:block; height:120px;">테스트1</a>
<a href="#" style="display:block; height:120px;">테스트2</a>
<a href="#" style="display:block; height:120px;">테스트3</a>
<a href="#" style="display:block; height:120px;">테스트4</a>
<a href="#" style="display:block; height:120px;">테스트5</a>
<a href="#" style="display:block; height:120px;">테스트6</a>
<a href="#" style="display:block; height:120px;">테스트7</a>
</div>
</div>
</td>
</tr>
</table>
<script>
banner_roll("banner_1", 60, 2000, 20, 0);
</script>
</body>
</html>