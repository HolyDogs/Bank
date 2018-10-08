<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnx").click(function(){
		$("#divx").hide();
	});
});
</script>
<title>ERROR</title>
</head>
<body>
<div class="container" id="divx">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="alert alert-success alert-dismissable">
				 <button type="button" class="close" data-dismiss="alert" id="btnx" aria-hidden="true">×</button>
				<h4>
					注意!
				</h4> <strong>Warning!</strong> 当你登陆失败或其他原因就会来到这个页面~ <a href="${pageContext.request.contextPath }/login.jsp" class="alert-link">重新登陆</a>
			</div>
		</div>
	</div>
</div>
NOTHING.
</body>
</html>