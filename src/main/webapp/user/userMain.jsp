<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; utf-8">
<title>userMain</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/bootstrap.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<div class="page-header">
						<h1>
							===------WELCOME------===<small>当前用户:${sessionScope.nowuser.userName}</small>
						</h1>
					</div>
				</div>


				<div class="col-md-6 column">
					<div class="row clearfix">
						<div class="col-md-12 column">
						</div>
					</div>
					<div class="row clearfix">
						<div class="col-md-4 column">
						</div>
						<div class="col-md-4 column">
							
						</div>
						<div class="col-md-4 column">
							 <a type="button" href="login!logout.action" class="btn btn-default btn-danger">退出</a> <a type="button" href="#" class="btn btn-default btn-info">修改密码</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="page-header">
						<h1>
							我的银行卡:
						</h1>
					</div>
					<div class="panel-group" id="panel-190688">

						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title" data-toggle="collapse" data-parent="#panel-190688" href="#panel-element-50840">-----------我 的 银 行 卡-----------</a>
							</div>
							<div id="panel-element-50840" class="panel-collapse collapse in">
							<s:iterator value="cardList" var="str">
								<div class="panel-body">
									<a href="/Bank/user!cardManage.action?cardid=${str}"><p>卡号:${str}</p><img alt="--CARD--" src="image/c.png" style="width:300px;height:30px"></a>
								</div>
							</s:iterator>
							</div>
						</div>

						<div class="panel panel-default">
							<div class="panel-heading">
								 <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-190688" href="#panel-element-137095">----------- 注 意 事 项 -----------</a>
							</div>
							<div id="panel-element-137095" class="panel-collapse collapse">
								<div class="panel-body">
									1.-------------

								</div>
								<div class="panel-body">
									2.-------------
								</div>
								<div class="panel-body">
									3.-------------
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			 <a id="modal-478100" href="#modal-container-478100" role="button" class="btn" data-toggle="modal">-----------添 加 银 行 卡-----------</a>
			
			<div class="modal fade" id="modal-container-478100" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">
								取消
							</h4>
						</div>
						<form action="user!addcard.action" method="post">
						<div class="modal-body">
							卡号:<input name="newcard" />
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit" class="btn btn-primary">创建</button>
						</div></form>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
		</div>
	</div>
</div>
</body>
</html>