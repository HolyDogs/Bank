<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; utf-8">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnSend").click(function(){
		$(this).attr("disabled",true);
		var xmlhttp;
		var str=$("#email1").val();
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
		xmlhttp.open("GET","ajax!sendEmail.action?theEmail="+str,true);
		xmlhttp.send();
	});
	
	$("#btnsub").click(function(){
		$(this).attr("disabled",true);
		var xmlhttp,emaila,charnum,userId,passWord,userName;
		emaila=$("#email1").val();
		charnum=$("#charnum").val();
		userId=$("#userId").val();
		passWord=$("#passWord").val();
		userName=$("#userName").val();
		var str="emaila="+emaila+"&charnum="+charnum+"&userId="+userId+"&password="+passWord+"&userName="+userName;
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
		    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		    }
		  }
		xmlhttp.open("POST","ajax!register.action",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		xmlhttp.send(str);
	});

	$("#check").click(function(){
	var aaa = $("#check").prop("checked");
	if(aaa){
	    $("#btnsub").attr("disabled",false);
	 }else{
		$("#btnsub").attr("disabled",true);
	 }});
});
</script>

</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="jumbotron">
				<h1>
					欢迎加入我们
				</h1>
				<p>
					请认真填写下面的内容并保证自己的信息安全。
				</p>
			</div>
			<form role="form">
				<div class="form-group">
					 <label for="exampleInputEmail1">Email address</label><input type="email" class="form-control" id="email1" />
				</div>
				<div class="form-group">
					 <input type="button" class="btn btn-default btn-inverse btn-block active" class="form-control" id="btnSend" value="发送验证码"/>
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">验证码：</label><input type="text" class="form-control" id="charnum" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">UserId</label><input type="text" class="form-control" id="userId" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">Password</label><input type="password" class="form-control" id="passWord" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">UserName</label><input type="text" class="form-control" id="userName" />
				</div>
				<a class="" href="#">《Bank用户条款说明》</a>
				<div class="checkbox">
					 <label><input id="check" type="checkbox" />我同意客户条款</label>
				</div> <button id="btnsub" disabled="true" class="btn btn-default">注册</button>
			</form>
		</div>
	</div>
</div>
<div id="myDiv" style="margin-bottom:50px;"></div>
</body>
</html>