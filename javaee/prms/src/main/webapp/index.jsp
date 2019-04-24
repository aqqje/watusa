<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>企业权限管理</title>
    <meta name="description" content="企业权限管理">
    <meta name="keywords" content="企业权限管理">
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="plugins/ionicons/css/ionicons.min.css">

    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/header.jsp" />
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="${pageContext.request.contextPath}/pages/aside.jsp" />
    <!-- 导航侧栏 /-->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                企业权限管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content" >

            <img class="indexBg" src="img/bg/index.png">

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    </div>


</div>


<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>

<script src="plugins/adminLTE/js/app.min.js"></script>
</body>

</html>
<!---->