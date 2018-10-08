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

	$("#btnsub").click(function(){
		var xmlhttp,cardId,date;
		cardId=$("#cardId").val();
		date=$("#date").val();

		var str="cardId="+cardId+"&date="+date;
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
		xmlhttp.open("POST","ajax!findRecord.action",true);
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
					 <label for="exampleInputPassword1">查询:BankCardId</label><input type="text" class="form-control" id="cardId" />
				</div>
				<div class="form-group">
					 <label for="exampleInputPassword1">日期(格式xxxx-xx-xx):date</label><input type="text" class="form-control" id="date" />
				</div>
				<button id="btnsub" class="btn btn-default">查询</button>
			</form>
		</div>
	</div>
</div>
<div id="myDiv" style="margin-bottom:50px;"></div>
</body>
</html>