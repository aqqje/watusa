<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!-- 页面头部 -->
<header class="main-header">
	<!-- Logo -->
	<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
		<!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>菜单</b></span>
		<!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>企业</b>权限管理</span>
	</a>


	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
			<span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="${pageContext.request.contextPath}/img/user/user2-160x160.jpg" class="user-image" alt="User Image">
						<span class="hidden-xs">张猿猿</span>
					</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header">${pageContext.request.contextPath}
							<img src="${pageContext.request.contextPath}/img/user/user2-160x160.jpg" class="img-circle" alt="User Image">

							<p>
								张猿猿 - 数据管理员
								<small>最后登录 11:20AM</small>
							</p>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="#" class="btn btn-default btn-flat">修改密码</a>
							</div>
							<div class="pull-right">
								<a href="${ctx}/logout.do" class="btn btn-default btn-flat">注销</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>
<!-- 页面头部 /-->