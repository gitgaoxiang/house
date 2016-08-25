<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
 <script src="<%=basePath%>js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=basePath%>js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=basePath%>js/plugins/jeditable/jquery.jeditable.js"></script>
    <script src="<%=basePath%>js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="<%=basePath%>js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script src="<%=basePath%>js/content.min.js?v=1.0.0"></script>
      <link rel="shortcut icon" href="<%=basePath%>favicon.ico"> <link href="<%=basePath%>css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=basePath%>css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="<%=basePath%>css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="<%=basePath%>css/animate.min.css" rel="stylesheet">
    <link href="<%=basePath%>css/style.min862f.css?v=4.1.0" rel="stylesheet">
    