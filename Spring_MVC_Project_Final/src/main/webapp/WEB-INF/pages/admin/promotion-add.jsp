<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>

<!DOCTYPE html>
<html lang="en">
<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta name="description" content="Responsive Admin Template">
	<meta name="author" content="SmartUniversity">
	<title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>
	<!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
	<!--bootstrap -->
	<link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
	
	<!-- Material Design Lite CSS -->
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css"></c:url>">
	<link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css"></c:url>">
	<!-- animation -->
	<link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"></c:url>" rel="stylesheet">
	<!-- Template Styles -->
	<link href="<c:url value="/resources-management/assets/css/plugins.min.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/style.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/responsive.css"></c:url>" rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources-management/assets/css/theme-color.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- dropzone -->
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css"></c:url>" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.css"></c:url>">
        <!-- favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
</head>
<!-- END HEAD -->

<body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
	<div class="page-wrapper">
		<!-- start header -->
		<jsp:include page="../include-management/body_header.jsp"></jsp:include>
		<!-- end header -->
		<!-- start page container -->
		<div class="page-container">
			<!-- start sidebar menu -->
			<jsp:include page="../include-management/body_menu.jsp"></jsp:include>
			<!-- end sidebar menu -->
			<!-- start page content -->
			<div class="page-content-wrapper">
				<div class="page-content">
					<div class="page-bar">
						<div class="page-title-breadcrumb">
							<div class=" pull-left">
								<div class="page-title">Add Promotion</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="">Room Type</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Add Promotion</li>
							</ol>
						</div>
					</div>
                                    <div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Enter Range of Time for NEW Promotion</header>
									<button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
										<i class="material-icons">more_vert</i>
									</button>
									<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
										<li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
										</li>
										<li class="mdl-menu__item"><i class="material-icons">print</i>Another action
										</li>
										<li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else
											here</li>
									</ul>
								</div>
                                                            <c:if test="${message !=null && message !=''}">
                                                                <div class="alert label-danger alert-dismissible" role="alert">
											<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                        <trong>${message}</trong>. Please Check your dates. Thank!
								</div>
                                                            </c:if>
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/search-roomtype-promotion" method="POST">  
								<div class="card-body row"> 
									
									
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date" name="startDate" value="${inputsDat}" required="" min="${today}" placeholder="">
                                                                                    <label class="mdl-textfield__label">startDate</label>
										</div>
									</div>
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date"  name="endDate" value="${inputeDat}" required="" min="${today}" placeholder="">
											<label class="mdl-textfield__label">endDate</label>
										</div>
									</div>
									
							
									<div class="col-lg-12 p-t-20 text-center">
										<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
										<button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
									</div>
								</div>
                                                            </mvc:form>
							</div>
						</div>
					</div>
                                    <c:if test="${sizeroomtypes > 0}">
                                    <!--   add form-->
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Add NEW Promotion</header>
									<button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
										<i class="material-icons">more_vert</i>
									</button>
									<ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
										<li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
										</li>
										<li class="mdl-menu__item"><i class="material-icons">print</i>Another action
										</li>
										<li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else
											here</li>
									</ul>
								</div>
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/${action}" method="POST" modelAttribute="promotion" enctype="multipart/form-data">  
								<div class="card-body row"> 
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" id="txtFirstName" name="name" required="">
											<label class="mdl-textfield__label">Name</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="number"  id="txtLasttName" name="discount" required="" max="100" min="0">
											<label class="mdl-textfield__label">discount</label>
										</div>
									</div>
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date" readonly=""  name="startDate" value="${inputsDat}" >
											<label class="mdl-textfield__label">startDate</label>
										</div>
									</div>
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date"  readonly="" name="endDate" value="${inputeDat}">
											<label class="mdl-textfield__label">endDate</label>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width is-focused" >
                                                                                    <label for="role2" class="mdl-textfield__label"> Room Types</label>
                                                                                    <div class="mdl-textfield__input" id="sample2" id="role2">
                                                                                        <div style=" padding-left: 85px; ">
                                                                                        <c:forEach items="${roomtypes}" var="r" varStatus="theCount">
                                                                                            <span>
                                                                                                <c:if test="${r.id == 1}">
                                                                                                    
                                                                                                    <span class="checkbox checkbox-icon-black">
                                                                                                        <input id = "type${theCount.index}" name = "roomTypes[${theCount.index}]" type = "checkbox" value = "${r.id}" checked="">
                                                                                                        <label for = "type${theCount.index}">${r.name}</label>
                                                                                                    </span>
                                                                                                    
                                                                                                </c:if>
                                                                                              
                                                                                                <c:if test="${r.id > 1}">
                                                                                                    <span class="checkbox checkbox-icon-black">
                                                                                                        <input id = "type${theCount.index}" name = "roomTypes[${theCount.index}]" type = "checkbox" value = "${r.id}">
                                                                                                        <label for = "type${theCount.index}">${r.name}</label>
                                                                                                    </span>
                                                                                                </c:if>
                                                                                             </span>
                                                                                        </c:forEach>
                                                                                        </div>
                                                                                    
                                                                                    
                                                                                    </div>
                                                                                      
										</div>
									</div>
									
									
									
									
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield txt-full-width">
                                                                                    <textarea class="mdl-textfield__input" rows="4" id="text7" name="description" ></textarea>
											<label class="mdl-textfield__label" for="text7">Description</label>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
                                                                            
										<label class="control-label col-md-3">Upload Photo: </label>

                                                                                <input class="dropIcon" type="file" name="files" multiple="multiple" required="">
										
                                                                               
									</div>
									
									<div class="col-lg-12 p-t-20 text-center">
										<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
										<button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
									</div>
								</div>
                                                            </mvc:form>
							</div>
						</div>
					</div>
                                    </c:if>
                                        <c:if test="${sizeroomtypes == 0}">
                                            <div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Alert</header>
								</div>
								<div class="card-body ">
									
									<div class="alert alert-warning">
										<strong>No Room Types Available!</strong> Better enter your date or check time range.
									</div>
									
								</div>
							</div>
						</div>
					</div>
                                        </c:if>
				</div>
			</div>
			<!-- end page content -->
			<!-- start chat sidebar -->
			<jsp:include page="../include-management/body_chat_sidebar.jsp"></jsp:include>
			<!-- end chat sidebar -->
		</div>
		<!-- end page container -->
		<!-- start footer -->
		<jsp:include page="../include-management/body_footer.jsp"></jsp:include>
		<!-- end footer -->
	</div>
		<!-- start js include path -->
	<script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
	<!-- bootstrap -->
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
	
	<!-- Common js-->
	<script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
	<script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
	<!-- material -->
	<script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/material_select/getmdl-select.js"></c:url>"></script>
        <!-- dropzone -->
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"></c:url>"></script>
        <!-- date and time 	 -->
        <script src="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/datetime/datetime-data.js"></c:url>"></script>
	<!-- animation -->
	<script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>
	
	<!-- end js include path -->
</body>

</html>