<%@page import="com.me.service.CardService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.me.domain.BankCard"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
				<div class="col-md-2 column">
					<div class="page-header">
						<h1>
							存/取款
						</h1>
					</div>
					 <a id="modal-795953" href="#modal-container-795953" role="button" class="btn" data-toggle="modal">--存款--</a>
					
					<div class="modal fade" id="modal-container-795953" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										取消
									</h4>
								</div>
								<form action="card!cunMoney.action" method="post">
								<div class="modal-body">
									<input name="cunMoney"/>
								</div>
								<div class="modal-footer">
									 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit" class="btn btn-primary">存</button>
								</div></form>
							</div>
							
						</div>
						
					</div>
					
					 <a id="modal-747360" href="#modal-container-747360" role="button" class="btn" data-toggle="modal">--取款--</a>
					
					<div class="modal fade" id="modal-container-747360" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">
										取消
									</h4>
								</div>
								<form action="card!qnMoney.action" method="post">
								<div class="modal-body">
									<input name="quMoney"/>
								</div>
								<div class="modal-footer">
									 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="submit" class="btn btn-primary">取</button>
								</div></form>
							</div>
							
						</div>
						
					</div>
					
				</div>
				<div class="col-md-6 column">
					<div class="page-header">
						<h1>
							转账
						</h1>
					</div>
					<form class="form-horizontal" action="card!tran.action" method="post">
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-2 control-label">目标卡号:</label>
							<div class="col-sm-10">
								<input type="text" name="toCardId" class="form-control" id="inputEmail3" />
							</div>
						</div>
						<div class="form-group">
							 <label for="inputEmail3" class="col-sm-2 control-label">转账金额:</label>
							<div class="col-sm-10">
								<input type="text" name="tranMoney" class="form-control" id="inputE" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="submit" class="btn btn-default btn-danger">转账</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-4 column">
					<div class="page-header">
						<h1>
							历史记录
						</h1>
					</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									时间
								</th>
								<th>
									记录
								</th>
							</tr>
						</thead>
						<tbody>
						<s:iterator value="cRecords" var="reco">
							<tr>
								<td>
									<s:property value="#reco.date"/>
								</td>
								<td>
									<s:property value="#reco.record"/>
								</td>
							</tr>
						</s:iterator>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>