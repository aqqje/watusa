<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- iCheck -->
    <!-- Morris chart -->
    <!-- jvectormap -->
    <!-- Date Picker -->
    <!-- Daterange picker -->
    <!-- Bootstrap time Picker -->
    <!--<link rel="stylesheet" href="../../../plugins/timepicker/bootstrap-timepicker.min.css">-->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--数据表格-->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- Bootstrap Color Picker -->
    <!-- bootstrap wysihtml5 - text editor -->
    <!--bootstrap-markdown-->
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <!-- Ion Slider -->
    <!-- ion slider Nice -->
    <!-- bootstrap slider -->
    <!-- bootstrap-datetimepicker -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->








    <!-- jQuery 2.2.3 -->
    <!-- jQuery UI 1.11.4 -->
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <!-- Bootstrap 3.3.6 -->
    <!-- Morris.js charts -->
    <!-- Sparkline -->
    <!-- jvectormap -->
    <!-- jQuery Knob Chart -->
    <!-- daterangepicker -->
    <!-- datepicker -->
    <!-- Bootstrap WYSIHTML5 -->
    <!-- Slimscroll -->
    <!-- FastClick -->
    <!-- iCheck -->
    <!-- AdminLTE App -->
    <!-- 表格树 -->
    <!-- select2 -->
    <!-- bootstrap color picker -->
    <!-- bootstrap time picker -->
    <!--<script src="../../../plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
    <!-- Bootstrap WYSIHTML5 -->
    <!--bootstrap-markdown-->
    <!-- CK Editor -->
    <!-- InputMask -->
    <!-- DataTables -->
    <!-- ChartJS 1.0.1 -->
    <!-- FLOT CHARTS -->
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
    <!-- jQuery Knob -->
    <!-- Sparkline -->
    <!-- Morris.js charts -->
    <!-- Ion Slider -->
    <!-- Bootstrap slider -->
    <!-- bootstrap-datetimepicker -->
    <!-- 页面meta /-->

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

    <div class="wrapper">

        <!-- 页面头部 -->
        <header class="main-header">


            <!-- Logo -->
            <a href="../all-admin-index.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>数据</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>数据</b>后台管理</span>
            </a>


            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>

                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success">4</span>
                    </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有4个邮件</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/user/user2-160x160.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    系统消息
                                                    <small><i class="fa fa-clock-o"></i> 5 分钟前</small>
                                                </h4>
                                                <p>欢迎登录系统?</p>
                                            </a>
                                        </li>
                                        <!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    团队消息
                                                    <small><i class="fa fa-clock-o"></i> 2 小时前</small>
                                                </h4>
                                                <p>你有新的任务了</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Developers
                                                    <small><i class="fa fa-clock-o"></i> Today</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Sales Department
                                                    <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    Reviewers
                                                    <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有10个新消息</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                    </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                        <i class="fa fa-warning text-yellow"></i> Very long description here that may not
                                        fit into the page and may cause design problems
                                    </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                        <i class="fa fa-users text-red"></i> 5 new members joined
                                    </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                        <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                    </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                        <i class="fa fa-user text-red"></i> You changed your username
                                    </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">View all</a></li>
                            </ul>
                        </li>
                        <!-- Tasks: style can be found in dropdown.less -->
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">9</span>
                    </a>
                            <ul class="dropdown-menu">
                                <li class="header">你有9个新任务</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                        <li>
                                            <!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress xs">
                                                    <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="../img/user/user2-160x160.jpg" class="user-image" alt="User Image">
                        <span class="hidden-xs">张猿猿</span>
                    </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <img src="../img/user/user2-160x160.jpg" class="img-circle" alt="User Image">

                                    <p>
                                        张猿猿 - 数据管理员
                                        <small>最后登录 11:20AM</small>
                                    </p>
                                </li>
                                <!-- Menu Body 
                        <li class="user-body">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <a href="#">Followers</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Sales</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Friends</a>
                                </div>
                            </div>
                        </li>-->
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">修改密码</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">注销</a>
                                    </div>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </header>
        <!-- 页面头部 /-->

        <!-- 导航侧栏 -->
        <aside class="main-sidebar">
            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar user panel -->
                <div class="user-panel">
                    <div class="pull-left image">
                        <img src="../img/user/user2-160x160.jpg" class="img-circle" alt="User Image">
                    </div>
                    <div class="pull-left info">
                        <p>张猿猿</p>
                        <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                    </div>
                </div>
                <!-- search form -->
                <!--<form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="搜索...">
                <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
            </div>
        </form>-->
                <!-- /.search form -->


                <!-- sidebar menu: : style can be found in sidebar.less -->
                <ul class="sidebar-menu">
                    <li class="header">菜单</li>

                    <li id="admin-index"><a href="../all-admin-index.html"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

                    <!-- 菜单 -->



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-folder"></i> <span>后台通用页面</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="admin-login">
                                <a href="all-admin-login.html">
                            <i class="fa fa-circle-o"></i> 登录
                        </a>
                            </li>

                            <li id="admin-register">
                                <a href="all-admin-register.html">
                            <i class="fa fa-circle-o"></i> 注册
                        </a>
                            </li>

                            <li id="admin-404">
                                <a href="all-admin-404.html">
                            <i class="fa fa-circle-o"></i> 404页
                        </a>
                            </li>

                            <li id="admin-500">
                                <a href="all-admin-500.html">
                            <i class="fa fa-circle-o"></i> 500页
                        </a>
                            </li>

                            <li id="admin-blank">
                                <a href="all-admin-blank.html">
                            <i class="fa fa-circle-o"></i> 空白页
                        </a>
                            </li>

                            <li id="admin-datalist">
                                <a href="all-admin-datalist.html">
                            <i class="fa fa-circle-o"></i> 数据列表页
                        </a>
                            </li>

                            <li id="admin-dataform">
                                <a href="all-admin-dataform.html">
                            <i class="fa fa-circle-o"></i> 表单页
                        </a>
                            </li>

                            <li id="admin-profile">
                                <a href="all-admin-profile.html">
                            <i class="fa fa-circle-o"></i> 个人中心
                        </a>
                            </li>

                            <li id="admin-invoice">
                                <a href="all-admin-invoice.html">
                            <i class="fa fa-circle-o"></i> 发票
                        </a>
                            </li>

                            <li id="admin-invoice-print">
                                <a href="all-admin-invoice-print.html">
                            <i class="fa fa-circle-o"></i> 发票打印
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>图表Charts</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="charts-chartjs">
                                <a href="all-charts-chartjs.html">
                            <i class="fa fa-circle-o"></i> ChartJS
                        </a>
                            </li>

                            <li id="charts-morris">
                                <a href="all-charts-morris.html">
                            <i class="fa fa-circle-o"></i> Morris Charts
                        </a>
                            </li>

                            <li id="charts-flot">
                                <a href="all-charts-flot.html">
                            <i class="fa fa-circle-o"></i> Flot Charts
                        </a>
                            </li>

                            <li id="charts-inline">
                                <a href="all-charts-inline.html">
                            <i class="fa fa-circle-o"></i> Inline Charts
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-laptop"></i> <span>UI界面元素</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="elements-general">
                                <a href="all-elements-general.html">
                            <i class="fa fa-circle-o"></i> 标准 General
                        </a>
                            </li>

                            <li id="elements-icons">
                                <a href="all-elements-icons.html">
                            <i class="fa fa-circle-o"></i> 图标 Icons
                        </a>
                            </li>

                            <li id="elements-buttons">
                                <a href="all-elements-buttons.html">
                            <i class="fa fa-circle-o"></i> 按钮 Buttons
                        </a>
                            </li>

                            <li id="elements-sliders">
                                <a href="all-elements-sliders.html">
                            <i class="fa fa-circle-o"></i> 滑块 Sliders
                        </a>
                            </li>

                            <li id="elements-timeline">
                                <a href="all-elements-timeline.html">
                            <i class="fa fa-circle-o"></i> 时间线 Timeline
                        </a>
                            </li>

                            <li id="elements-modals">
                                <a href="all-elements-modals.html">
                            <i class="fa fa-circle-o"></i> 对话框样式 Modals
                        </a>
                            </li>

                            <li id="elements-widgets">
                                <a href="all-elements-widgets.html">
                            <i class="fa fa-circle-o"></i> 窗体小部件 widgets
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-edit"></i> <span>表单 Forms</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="form-general">
                                <a href="all-form-general.html">
                            <i class="fa fa-circle-o"></i> 基础表单元素
                        </a>
                            </li>

                            <li id="form-advanced">
                                <a href="all-form-advanced.html">
                            <i class="fa fa-circle-o"></i> 高级表单元素
                        </a>
                            </li>

                            <li id="form-editors">
                                <a href="all-form-editors.html">
                            <i class="fa fa-circle-o"></i> 编辑器
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-table"></i> <span>表格 tables</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="tables-simple">
                                <a href="all-tables-simple.html">
                            <i class="fa fa-circle-o"></i> 简单表格
                        </a>
                            </li>

                            <li id="tables-data">
                                <a href="all-tables-data.html">
                            <i class="fa fa-circle-o"></i> 数据表格
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-cube"></i> <span>样例-订单管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="order-manage">
                                <a href="all-order-manage-list.html">
                            <i class="fa fa-circle-o"></i> 全部订单
                        </a>
                            </li>

                            <li id="order-cancel">
                                <a href="all-order-cancel-list.html">
                            <i class="fa fa-circle-o"></i> 退款
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-book"></i> <span>样例-游记管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="travellog-manage">
                                <a href="all-travellog-manage-list.html">
                            <i class="fa fa-circle-o"></i> 游记列表
                        </a>
                            </li>

                            <li id="travellog-review">
                                <a href="all-travellog-review-list.html">
                            <i class="fa fa-circle-o"></i> 游记点评
                        </a>
                            </li>

                            <li id="travellog-setting">
                                <a href="all-travellog-setting-edit.html">
                            <i class="fa fa-circle-o"></i> 游记设置
                        </a>
                            </li>

                        </ul>
                    </li>



                    <li class="treeview">
                        <a href="#">
                    <i class="fa fa-cogs"></i> <span>样例-系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                        <ul class="treeview-menu">

                            <li id="system-setting">
                                <a href="all-system-setting-edit.html">
                            <i class="fa fa-circle-o"></i> 系统设置
                        </a>
                            </li>

                        </ul>
                    </li>



                    <!-- 菜单 /-->

                    <li id="admin-documentation"><a href="documentation.html" target="_blank"><i class="fa fa-book"></i> <span>AdminLTE汉化文档</span></a></li>

                </ul>
            </section>
            <!-- /.sidebar -->
        </aside>
        <!-- 导航侧栏 /-->

        <!-- 内容区域 -->
        <!-- @@master = admin-layout.html-->
        <!-- @@block = content -->

        <div class="content-wrapper">

            <!-- 内容头部 -->
            <section class="content-header">
                <h1>
                    数据管理
                    <small>数据表单</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                    <li><a href="#">数据管理</a></li>
                    <li class="active">数据表单</li>
                </ol>
            </section>
            <!-- 内容头部 /-->

            <!-- 正文区域 -->
            <section class="content">

                <div class="box-body">

                    <!--tab页-->
                    <div class="nav-tabs-custom">

                        <!--tab头-->
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-label" data-toggle="tab">label显示</a>
                            </li>
                            <li>
                                <a href="#tab-common" data-toggle="tab">基础控件</a>
                            </li>
                            <li>
                                <a href="#tab-select" data-toggle="tab">下拉框</a>
                            </li>
                            <li>
                                <a href="#tab-date" data-toggle="tab">日期控件</a>
                            </li>
                            <li>
                                <a href="#tab-treetable" data-toggle="tab">树表格</a>
                            </li>
                            <li>
                                <a href="#tab-editer" data-toggle="tab">编辑器</a>
                            </li>
                            <li>
                                <a href="#tab-model" data-toggle="tab">模态窗口</a>
                            </li>
                        </ul>
                        <!--tab头/-->

                        <!--tab内容-->
                        <div class="tab-content">

                            <!--label显示的内容-->
                            <div class="tab-pane active" id="tab-label">
                                <h5>四列 , 行两个项目</h5>
                                <div class="row data-type">

                                    <div class="col-md-2 title">订单编号</div>
                                    <div class="col-md-4 data text">
                                        xxxxxxx
                                    </div>

                                    <div class="col-md-2 title">下单时间</div>
                                    <div class="col-md-4 data text">
                                        2019-01-01
                                    </div>

                                    <div class="col-md-2 title">路线名称</div>
                                    <div class="col-md-4 data text">
                                        xxxxxxx
                                    </div>

                                    <div class="col-md-2 title">出发城市</div>
                                    <div class="col-md-4 data text">
                                        北京
                                    </div>

                                    <div class="col-md-2 title">其他信息</div>
                                    <div class="col-md-10 data text">
                                        aaadfsdfdsfsdfdsa
                                    </div>

                                    <div class="col-md-2 title rowHeight2x">高度2x</div>
                                    <div class="col-md-10 data rowHeight2x">
                                        <textarea class="form-control" rows="3" placeholder="请输入..." disabled="disabled"></textarea>
                                    </div>

                                </div>


                                <h5>三列</h5>
                                <div class="row data-type">
                                    <!--单行数据显示 非表格-->
                                    <div class="col-md-2 title item-green rowHeight2x"><i class="glyphicon glyphicon-yen"></i> 销量</div>
                                    <div class="col-md-5 data rowHeight2x border-right">
                                        <div class="line">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 下单金额1</div>
                                            <div class="pull-right">307,02120</div>
                                        </div>
                                        <div class="line">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 下单金额2</div>
                                            <div class="pull-right"><span class="arrowup"><i class="glyphicon glyphicon-arrow-up"></i>2.66%</span></div>
                                        </div>
                                    </div>
                                    <div class="col-md-5 data rowHeight2x">
                                        <div class="line">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 下单客户数</div>
                                            <div class="pull-right">37,02120</div>
                                        </div>
                                        <div class="line">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 下单金额</div>
                                            <div class="pull-right"><span class="arrowdown"><i class="glyphicon glyphicon-arrow-down"></i>3.16%</span></div>
                                        </div>
                                    </div>
                                </div>




                                <h5>两列、三列、四列</h5>
                                <div class="row data-type">
                                    <div class="col-md-2 title item-orange"><i class="glyphicon glyphicon-retweet"></i> 转化</div>
                                    <div class="col-md-5 data text border-right">
                                        <div class="pull-left">
                                            <i class="glyphicon glyphicon-question-sign"></i> 店铺成交转化率</div>
                                        <div class="pull-right">2.25%</div>
                                    </div>
                                    <div class="col-md-5 data text">
                                        <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 先取付款率</div>
                                        <div class="pull-right">88.52%</div>
                                    </div>
                                </div>




                                <div class="row data-type">
                                    <div class="col-md-2 title item-red"><i class="glyphicon glyphicon-heart"></i> 回访</div>
                                    <div class="col-md-5 data text border-right">
                                        <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 30日客户回头率</div>
                                        <div class="pull-right">1.95%</div>
                                    </div>
                                    <div class="col-md-5 data text">
                                        <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 30日重复购买率</div>
                                        <div class="pull-right">1.97%</div>
                                    </div>
                                </div>

                                <div class="row data-type">
                                    <div class="col-md-2 title item-blue"><i class="glyphicon glyphicon-circle-arrow-up"></i> 上架</div>
                                    <div class="col-md-10 padding-clear">
                                        <div class="col-md-4 data text border-right">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 上架商品数量(SKU)</div>
                                            <div class="pull-right">32</div>
                                        </div>
                                        <div class="col-md-4 data text border-right">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 上架商品数量(SKU)</div>
                                            <div class="pull-right">28</div>
                                        </div>
                                        <div class="col-md-4 data text">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 上架商品数量(SKU)</div>
                                            <div class="pull-right">28</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row data-type">
                                    <div class="col-md-2 title item-blue"><i class="glyphicon glyphicon-signal"></i> 流量</div>
                                    <div class="col-md-10 padding-clear">
                                        <div class="col-md-3 data text border-right">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 浏览量</div>
                                            <div class="pull-right">62,02120</div>
                                        </div>
                                        <div class="col-md-3 data text border-right">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 浏览量</div>
                                            <div class="pull-right">62,02120</div>
                                        </div>
                                        <div class="col-md-3 data text border-right">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 浏览量</div>
                                            <div class="pull-right">62,02120</div>
                                        </div>
                                        <div class="col-md-3 data text">
                                            <div class="pull-left"><i class="glyphicon glyphicon-question-sign"></i> 浏览量</div>
                                            <div class="pull-right">62,02120</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--label显示的内容/-->

                            <!--基础控件-->
                            <div class="tab-pane" id="tab-common">
                                <div class="row data-type">

                                    <div class="col-md-2 title">文本</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control" placeholder="文本" value="">
                                    </div>

                                    <div class="col-md-2 title">密码</div>
                                    <div class="col-md-4 data">
                                        <input type="password" class="form-control" placeholder="密码" value="">
                                    </div>

                                    <div class="col-md-2 title">用户名</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <span class="input-group-addon">@</span>
                                            <input type="text" class="form-control" placeholder="用户名">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">整数</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">货币</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <span class="input-group-addon">¥</span>
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">图标输入框</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-address-book"></i></span>
                                            <input type="text" class="form-control" placeholder="请输入...">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">多选checkbox</div>
                                    <div class="col-md-10 data line-height36">
                                        <div class="form-group form-inline">
                                            <div class="checkbox"><label><input type="checkbox" value="1"> 选项1</label></div>
                                            <div class="checkbox"><label><input type="checkbox" value="2"> 选项2</label></div>
                                            <div class="checkbox"><label><input type="checkbox" value="3"> 选项3</label></div>
                                            <div class="checkbox"><label><input type="checkbox" value="4"> 选项4</label></div>
                                            <div class="checkbox"><label><input type="checkbox" value="5"> 选项5</label></div>
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">多选radio</div>
                                    <div class="col-md-10 data">
                                        <div class="form-group form-inline">
                                            <div class="radio"><label><input type="radio" name="optionsRadios" value="1"> 选项1</label></div>
                                            <div class="radio"><label><input type="radio" name="optionsRadios" value="2"> 选项2</label></div>
                                            <div class="radio"><label><input type="radio" name="optionsRadios" value="3"> 选项3</label></div>
                                            <div class="radio"><label><input type="radio" name="optionsRadios" value="4"> 选项4</label></div>
                                            <div class="radio"><label><input type="radio" name="optionsRadios" value="5"> 选项5</label></div>
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">文件上传</div>
                                    <div class="col-md-10 data">
                                        <a href="javascript:;" class="a-upload">
            <input type="file" name="" id="">点击这里上传文件
        </a>
                                    </div>

                                    <div class="col-md-2 title rowHeight2x">内容输入框</div>
                                    <div class="col-md-10 data rowHeight2x">
                                        <textarea class="form-control" rows="3" placeholder="请输入..."></textarea>
                                    </div>

                                    <div class="col-md-2 title">颜色选取</div>
                                    <div class="col-md-4 data">
                                        <input type="text" class="form-control my-colorpicker1">
                                    </div>

                                    <div class="col-md-2 title">颜色选取[选取按钮]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group my-colorpicker2">
                                            <input type="text" class="form-control">
                                            <div class="input-group-addon"><i class="fa fa-circle-thin"></i></div>
                                        </div>
                                    </div>

                                    <div class="col-md-2 title"></div>
                                    <div class="col-md-10 data text-center">
                                        <button type="button" class="btn bg-maroon">保存</button>
                                        <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
                                    </div>

                                </div>
                            </div>
                            <!--基础控件/-->

                            <!--下拉框-->
                            <div class="tab-pane" id="tab-select">
                                <div class="row data-type">

                                    <div class="col-md-2 title">下拉框[标准]</div>
                                    <div class="col-md-4 data">
                                        <select class="form-control">
            <option>option 1</option>
            <option>option 2</option>
            <option>option 3</option>
            <option>option 4</option>
            <option>option 5</option>
        </select>
                                    </div>

                                    <div class="col-md-2 title">下拉框[输入单选]</div>
                                    <div class="col-md-4 data">
                                        <select class="form-control select2" style="width: 100%;">
            <option selected="selected">Alabama</option>
            <option>Alaska</option>
            <option disabled="disabled">California</option>
            <option>Delaware</option>
            <option>Tennessee</option>
            <option>Texas</option>
            <option>Washington</option>
        </select>
                                    </div>

                                    <div class="col-md-2 title">下拉框[输入多选]</div>
                                    <div class="col-md-10 data">
                                        <select class="form-control select2" multiple="multiple" data-placeholder="可多选" style="width: 100%;">
            <option>Alabama</option>
            <option>Alaska</option>
            <option>California</option>
            <option>Delaware</option>
            <option>Tennessee</option>
            <option>Texas</option>
            <option>Washington</option>
        </select>
                                    </div>


                                </div>
                            </div>
                            <!--下拉框/-->

                            <!--日期控件-->
                            <div class="tab-pane" id="tab-date">
                                <div class="row data-type">

                                    <div class="col-md-2 title">日期[单选]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" id="datepicker">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">日期时间[单选]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" id="dateTimePicker">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">日期[区间]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" id="reservation">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">日期时间[区间]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-clock-o"></i>
                                            </div>
                                            <input type="text" class="form-control pull-right" id="reservationtime">
                                        </div>
                                    </div>

                                    <div class="col-md-2 title">日期[时间段]</div>
                                    <div class="col-md-4 data">
                                        <div class="input-group">
                                            <button type="button" class="btn btn-default pull-right" id="daterange-btn">
            <span>
                <i class="fa fa-calendar"></i> 日期选取
            </span>
            <i class="fa fa-caret-down"></i>
            </button>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <!--日期控件/-->

                            <!--树表格-->
                            <div class="tab-pane" id="tab-treetable">
                                <table id="collapse-table" class="table table-bordered table-hover dataTable">
                                    <thead>
                                        <tr>
                                            <th>流量来源</th>
                                            <th>浏览量</th>
                                            <th>浏览量占比</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td>总计</td>
                                        <td>732，191，5</td>
                                        <td>100%</td>
                                    </tr>
                                    <tr data-tt-id="0">
                                        <td>自主访问</td>
                                        <td>12345</td>
                                        <td>8%</td>
                                    </tr>

                                    <tbody>

                                        <tr data-tt-id="1" data-tt-parent-id="0">
                                            <td>我的京东</td>
                                            <td>1211</td>
                                            <td>3%</td>
                                        </tr>
                                        <tr data-tt-id="1-1" data-tt-parent-id="1">
                                            <td>我的京东一</td>
                                            <td>1211</td>
                                            <td>3%</td>
                                        </tr>
                                        <tr data-tt-id="1-1" data-tt-parent-id="1">
                                            <td>我的京东二</td>
                                            <td>1211</td>
                                            <td>3%</td>
                                        </tr>

                                        <tr data-tt-id="2" data-tt-parent-id="0">
                                            <td>购物车</td>
                                            <td>11134</td>
                                            <td>5%</td>
                                        </tr>
                                        <tr data-tt-id="2-1" data-tt-parent-id="2">
                                            <td>购物车一</td>
                                            <td>1211</td>
                                            <td>3%</td>
                                        </tr>
                                        <tr data-tt-id="2-2" data-tt-parent-id="2">
                                            <td>购物车二</td>
                                            <td>1211</td>
                                            <td>3%</td>
                                        </tr>

                                        <tr data-tt-id="3">
                                            <td>负责流量</td>
                                            <td>12345</td>
                                            <td>8%</td>
                                        </tr>
                                        <tr data-tt-id="3-1" data-tt-parent-id="3">
                                            <td>负责流量一</td>
                                            <td>12345</td>
                                            <td>8%</td>
                                        </tr>
                                        <tr data-tt-id="3-1" data-tt-parent-id="3">
                                            <td>负责流量二</td>
                                            <td>12345</td>
                                            <td>8%</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--树表格/-->

                            <!--编辑器-->
                            <div class="tab-pane" id="tab-editer">
                                <div class="row data-type">

                                    <div class="col-md-2 title editer">WYSIHTML5</div>
                                    <div class="col-md-10 data editer">
                                        <textarea class="textarea" placeholder="轻量级编辑器，适合文字编辑" style="width: 100%; height: 265px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
                                    </div>

                                    <div class="col-md-2 title editer">Markdown</div>
                                    <div class="col-md-10 data editer">
                                        <textarea id="markdown-textarea" name="content" rows="13"></textarea>
                                    </div>

                                    <div class="col-md-2 title editer">CK Editor</div>
                                    <div class="col-md-10 data editer">
                                        <textarea id="editor1" name="editor1" rows="10" cols="80">
            专业级内容编辑器, 适用强文字编辑应用
        </textarea>
                                    </div>

                                </div>
                            </div>
                            <!--编辑器/-->

                            <!--模态窗口-->
                            <div class="tab-pane" id="tab-model">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    弹出模式对话框
</button>

                                <div id="myModal" class="modal modal-primary" role="dialog">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title">标题</h4>
                                            </div>
                                            <div class="modal-body">


                                                <div class="box-body">
                                                    <div class="form-horizontal">

                                                        <div class="form-group">
                                                            <label for="inputNumber2" class="col-sm-2 control-label">金额:</label>
                                                            <div class="col-sm-5">
                                                                <div class="input-group">
                                                                    <span class="input-group-addon">$</span>
                                                                    <input id="inputNumber2" type="text" class="form-control" placeholder="输入金额整数">
                                                                    <span class="input-group-addon">.00</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">金额范围:</label>
                                                            <div class="col-sm-5">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" placeholder="金额">
                                                                    <span class="input-group-addon">-</span>
                                                                    <input type="text" class="form-control" placeholder="金额">
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
                                                            <div class="col-sm-5">
                                                                <input type="password" class="form-control" placeholder="密码" value="">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-2 control-label">选框:</label>
                                                            <div class="col-sm-5">
                                                                <div class="checkbox">
                                                                    <label><input type="checkbox" name="c1" checked="checked"> 选框1</label>
                                                                    <label><input type="checkbox" name="c1"> 选框2</label>
                                                                    <label><input type="checkbox" name="c1"> 选框3</label>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>



                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                                                <button type="button" class="btn btn-outline" data-dismiss="modal">保存</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>

                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                            </div>
                            <!--模态窗口/-->

                        </div>
                        <!--tab内容/-->

                    </div>
                    <!--tab页/-->


                    <!-- .box-footer
        <div class="box-footer"></div>
        -->
                    <!-- /.box-footer-->

                </div>

            </section>
            <!-- 正文区域 /-->

        </div>
        <!-- @@close -->
        <!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.8
            </div>
            <strong>Copyright &copy; 2014-2017 <a href="http://www.itcast.cn">研究院研发部</a>.</strong> All rights reserved.
        </footer>
        <!-- 底部导航 /-->

    </div>


    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../plugins/raphael/raphael-min.js"></script>
    <script src="../plugins/morris/morris.min.js"></script>
    <script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../plugins/knob/jquery.knob.js"></script>
    <script src="../plugins/daterangepicker/moment.min.js"></script>
    <script src="../plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
    <script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="../plugins/fastclick/fastclick.js"></script>
    <script src="../plugins/iCheck/icheck.min.js"></script>
    <script src="../plugins/adminLTE/js/app.min.js"></script>
    <script src="../plugins/treeTable/jquery.treetable.js"></script>
    <script src="../plugins/select2/select2.full.min.js"></script>
    <script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
    <script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
    <script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
    <script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
    <script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
    <script src="../plugins/ckeditor/ckeditor.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="../plugins/chartjs/Chart.min.js"></script>
    <script src="../plugins/flot/jquery.flot.min.js"></script>
    <script src="../plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="../plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="../plugins/flot/jquery.flot.categories.min.js"></script>
    <script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
    <script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
    <script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
            });
        });


        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }



        $(document).ready(function() {

            // 颜色选取器
            $(".my-colorpicker1").colorpicker();
            $(".my-colorpicker2").colorpicker();

        });




        $(document).ready(function() {
            // 选择框
            $(".select2").select2();
        });




        $(document).ready(function() {

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true,
                language: 'zh-CN'
            });

            // datetime picker
            $('#dateTimePicker').datetimepicker({
                format: "mm/dd/yyyy - hh:ii",
                autoclose: true,
                todayBtn: true,
                language: 'zh-CN'
            });

            //Date range picker
            $('#reservation').daterangepicker({
                locale: {
                    applyLabel: '确认',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    firstDay: 1
                },
                opens: 'left', // 日期选择框的弹出位置
                separator: ' 至 '
                //showWeekNumbers : true,     // 是否显示第几周
            });

            //Date range picker with time picker
            $('#reservationtime').daterangepicker({
                timePicker: true,
                timePickerIncrement: 30,
                format: 'MM/DD/YYYY h:mm A',
                locale: {
                    applyLabel: '确认',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    firstDay: 1
                },
                opens: 'right', // 日期选择框的弹出位置
                separator: ' 至 '
            });

            //Date range as a button
            $('#daterange-btn').daterangepicker({
                    locale: {
                        applyLabel: '确认',
                        cancelLabel: '取消',
                        fromLabel: '起始时间',
                        toLabel: '结束时间',
                        customRangeLabel: '自定义',
                        firstDay: 1
                    },
                    opens: 'right', // 日期选择框的弹出位置
                    separator: ' 至 ',
                    ranges: {
                        '今日': [moment(), moment()],
                        '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        '最近7日': [moment().subtract(6, 'days'), moment()],
                        '最近30日': [moment().subtract(29, 'days'), moment()],
                        '本月': [moment().startOf('month'), moment().endOf('month')],
                        '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function(start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
            );

        });




        $(document).ready(function() {

            /*table tree*/
            $("#collapse-table").treetable({
                expandable: true
            });

        });




        $(document).ready(function() {

            CKEDITOR.replace('editor1');

            // $(".textarea").wysihtml5({
            //     locale:'zh-CN'
            // });

            $("#markdown-textarea").markdown({
                language: 'zh',
                autofocus: false,
                savable: false
            });

        });



        $(document).ready(function() {

            // 激活导航位置
            setSidebarActive("admin-dataform");

        });
    </script>
</body>

</html>