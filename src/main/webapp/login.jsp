<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; utf-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</head>
<body style="background: linear-gradient(to bottom, #323232 0%, #3F3F3F 40%, #1C1C1C 150%), linear-gradient(to top, rgba(255,255,255,0.40) 0%, rgba(0,0,0,0.25) 200%); background-blend-mode: multiply;">
<div class="container" style="background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);" >
	<div class="row clearfix" >
		<div class="col-md-12 column">
			<div class="page-header">
				<h1>
					The Bank
				</h1>
			</div>
			<form method="post" action="${pageContext.request.contextPath }/login!check.action" class="form-horizontal" role="form">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">userId</label>
					<div class="col-sm-10">
						<input type="text" name="userId" class="form-control" id="inputEmail3" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" name="password" class="form-control" id="inputPassword3"  />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox" />Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">登陆</button>
						 <a type="button" href="${pageContext.request.contextPath }/login!register.action" class="btn btn-default btn-warning" style="margin-left:30px;">注册</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>