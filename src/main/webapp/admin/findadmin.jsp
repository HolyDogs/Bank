<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; utf-8">
<title>addUser</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function(){
	function doappend(list){
		var tbody="";
		for(i in list){
			tbody+="<tr><td>"+list[i].userId+"</td><td>"+list[i].userName+"</td><td>"+list[i].email+"</td><td>"+list[i].password+"</td><td>"+list[i].cards+"</td><td><a href=\"#\">修改</a>&nbsp;&nbsp;<a href=\"#\">删除</a></td></tr>";
		}
 		document.getElementById("divtable").innerHTML=tbody;
	};

	$("#btnSend").click(function(){
		$(this).attr("disabled",true);
		var pag=document.getElementById("thepage").innerText;
		$.ajax({
			type:"POST",
			url:"ajax!findall.action",
			data:{"page":pag},
			dataType:"text",
			success:function(data){
				var a=eval('('+data+')');
				var am=a.aMap;
				var list=am.user;
				doappend(list);

			}
		});
	});
	
});

</script>
<script type="text/javascript">
function doappend(list){
	var tbody="";
	for(i in list){
		tbody+="<tr><td>"+list[i].userId+"</td><td>"+list[i].userName+"</td><td>"+list[i].email+"</td><td>"+list[i].password+"</td><td>"+list[i].cards+"</td><td><a href=\"#\">修改</a>&nbsp;&nbsp;<a href=\"#\">删除</a></td></tr>";
	}
		document.getElementById("divtable").innerHTML=tbody;
};

function aaclick(a){
	var pag=document.getElementById("thepage").innerText;
	if(a==1){
		if(pag==1){return false;};
		document.getElementById("thepage").innerText=eval(pag-1);
		pag=eval(pag-1);
	}
	if(a==2){
		pag=eval(parseInt(pag)+1);
		var h=1;
		document.getElementById("thepage").innerText=pag;
	}
	$.ajax({
		type:"POST",
		url:"ajax!findall.action",
		data:{"page":pag},
		dataType:"text",
		success:function(data){
			var a=eval('('+data+')');
			var am=a.aMap;
			var list=am.user;
			doappend(list);
		}
	});
};

</script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<input type="button" style="margin-top:20px;margin-bottom:20px;"; class="btn btn-default btn-inverse btn-block active" class="form-control" id="btnSend" value="查询数据"/>
			<table class="table">
				<thead>
					<tr>
						<th>
							UserId
						</th>
						<th>
							用户名
						</th>
						<th>
							Email
						</th>
						<th>
							密码
						</th>
						<th>
							绑定的银行卡
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody id="divtable">
					<tr>
						<td>
							ExampleID123
						</td>
						<td>
							EXAMNAME:TOM
						</td>
						<td>
							XXXXX@XXX.COM
						</td>
						<td>
							XXXXXX
						</td>
						<td>
							XXXXX XXXX
						</td>
						<td>
							<div><a href="#">修改</a>&nbsp;&nbsp;<a href="#">删除</a></div>
						</td>
					</tr>
				</tbody>

			</table>
			<ul class="pagination paghnation-lg">
				<li>
					 <a id="a1" href="javascript:void(0)" onclick="aaclick(1)">上一页</a>
				</li>
				<li>
					 当前页数:
				</li>
				<li>
					 <code id="thepage">1</code>
				</li>
				<li>
					 <a id="a2" href="javascript:void(0)" onclick="aaclick(2)">下一页</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>