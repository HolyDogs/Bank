<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>BankAdmin</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/m.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">

function aclick(a){
	$("li").attr("class","");
	if(a==1){
		$("#li1").attr("class","selected");
		$("#divmain").load("admin/addadmin.jsp");
	}
	if(a==2){
		$("#li2").attr("class","selected");
		$("#divmain").load("admin/findadmin.jsp");
	}
	if(a==3){
		$("#li3").attr("class","selected");
		$("#divmain").load("admin/manageadmin.jsp");
	}
	if(a==4){
		$("#li4").attr("class","selected");
		$("#divmain").load("admin/recordadmin.jsp");
	}
};

</script>
</head>
<body>
<header>
  <div id="mnav">
    <div class="logo"><h3> ${sessionScope.nowuser["userName"] }| BankManager~~</h3>
	</div>
	<ul id="starlist">
 
		<li id="li1"><a id="add" href="javascript:void(0)" onclick="aclick(1)">添加用户</a></li> 
		 
		 
		<li id="li2"><a id="view" href="javascript:void(0)" onclick="aclick(2)">用户一览</a></li> 
		 
		 
		<li id="li3"><a id="manage" href="javascript:void(0)" onclick="aclick(3)">用户管理</a></li> 
		 
		 
		<li id="li4" ><a id="record" href="javascript:void(0)" onclick="aclick(4)">查询记录</a></li> 
		 
		 
		<li class=""><a id="logout" href="${pageContext.request.contextPath }/login!logout.action">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注销</a></li> 

    </ul>
  </div>
</header>
<div class="line46">

</div>
<div class="blank"></div>

<div  id="divmain">
	<article>
		<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					<small>-------点击右上角功能操作--------</small>
				</h1>
			</div>
		</div>
	</div>
</div>
	</article>
</div>
<footer>
  <p>Designed by ---<a href="/">@github(HolyDogs)</a>--- <a href="http://www.HolyDogs.github.io/" target="_blank">XFFFFF</a> ------<a href="http://www.HolyDogs.github.io/" target="_blank">NoID</a>-----<a href="http://www.HolyDogs.github.io/" target="_blank">WelCome~</a></p>
</footer>

</body>
</html>