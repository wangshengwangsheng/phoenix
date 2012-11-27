<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="http://www.dianping.com/phoenix/console"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<jsp:useBean id="ctx" type="com.dianping.phoenix.console.page.deploy2.Context" scope="request" />
<jsp:useBean id="payload" type="com.dianping.phoenix.console.page.deploy2.Payload" scope="request" />
<jsp:useBean id="model" type="com.dianping.phoenix.console.page.deploy2.Model" scope="request" />

<a:layout>
	
	<div class="row-fluid">
		<div class="span4">
			<div class="page-header">
				<strong style="font-size: medium;">${model.name}</strong>：[<font color="blue">${model.plan.version}</font>, 方式：1->1->1->1, 错误：终断后续发布]
			</div>
			<div class="row-fluid">
				<div class="span12 thumbnail" style="height: 440px; overflow: auto;">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th width="90">Machine</th>
								<th>Progress</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="host" items="${model.hosts}">
								<tr>
									<td>${host}</td>
									<td>
										<div class="progress">
											<div class="bar" style="width: 60%;"></div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row" style="margin-top: 5px;">
				<p class="pull-right">
					<span class="label label-todo">pending&nbsp;&nbsp;&nbsp;</span> <span class="label label-doing">doing&nbsp;&nbsp;</span> <span
						class="label label-success">success</span> <span class="label label-warning">warning</span> <span class="label label-failed">failed&nbsp;</span>
				</p>
			</div>

			<div id="result" style="display: none"></div>
		</div>
		<div class="span8">
			<div class="row-fluid">
				<div class="page-header">
					<h4>Remote Deploy Logs</h4>
				</div>
				<div id="status" data-spy="scroll" data-offset="0" class="terminal-like"
					style="height: 508px; line-height: 20px; overflow: auto;">
					<span id="offset--1" class="terminal-like"> \${model.quotedLog} </span>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="offset" name="offset" value="\${model.offset}">
	<input type="hidden" id="plan" name="plan" value="\${payload.plan}">

	<res:useJs value="${res.js.local.deploy_js}" target="deploy-js" />
	<res:useJs value="${res.js.local.TypingText_js}" target="deploy-js" />
	<res:jsSlot id="deploy-js" />
	<res:useCss value='${res.css.local.deploy_css}' target="head-css" />
	<res:cssSlot id="deploy-css" />
</a:layout>