<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; utf-8">
<title>manageUser</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){

	$("#btnsub").click(function(){
		var xmlhttp,emaila,userId,passWord,userName;
		$("#btnsub").attr("disabled",true);
		emaila=$("#email1").val();
		userId=$("#userId").val();
		passWord=$("#passWord").val();
		userName=$("#userName").val();
		var str="emaila="+emaila+"&userId="+userId+"&password="+passWord+"&userName="+userName;
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
		    }
		  }
		xmlhttp.open("POST","ajax!updateUser.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		xmlhttp.send(str);
	});
});
</script>

</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form role="form" target="_parent">
				<div class="form-group">
					 <label for="exampleInputPassword1">UserId</label><input type="text" class="form-control" id="userId" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">UserName</label><input type="text" class="form-control" id="userName" />
				</div>
				<div class="form-group">
					 <label for="exampleInputEmail1">Email address</label><input type="email" class="form-control" id="email1" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">Password</label><input type="password" class="form-control" id="passWord" />
				</div>
				
				<button id="btnsub" class="btn btn-default">修改</button>
			</form>
		</div>
	</div>
</div>
<div id="myDiv" style="margin-bottom:50px;"></div>
</body>
</html> 