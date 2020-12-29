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
	<link href="<c:url value="/resources-management/assets/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"></c:url>" rel="stylesheet" media="screen">
        <link href="<c:url value="/resources-management/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css"></c:url>" rel="stylesheet" media="screen">
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
        <link href="<c:url value="/resources-management/assets/css/pages/formlayout.css"></c:url>" rel="stylesheet" type="text/css">
	<!-- dropzone -->
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css"></c:url>" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.css"></c:url>">
        <!-- favicon -->
	<link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
        <!--tagsinput-->
        <link href="<c:url value="/resources-management/assets/plugins/jquery-tags-input/jquery-tags-input.css"></c:url>" rel="stylesheet">
        <!--select2-->
        <link href="<c:url value="/resources-management/assets/plugins/select2/css/select2.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/plugins/select2/css/select2-bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
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
								<div class="page-title">Add Room Booking</div>
							</div>
							<ol class="breadcrumb page-breadcrumb pull-right">
								<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li><a class="parent-item" href="">Room Type</a>&nbsp;<i class="fa fa-angle-right"></i>
								</li>
								<li class="active">Add Room Type</li>
							</ol>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Add NEW Service</header>
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
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/${action}" method="POST" modelAttribute="service" enctype="multipart/form-data">  
								<div class="card-body row"> 
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" id="txtFirstName" name="name" value="${serviceEdit.name}" required="">
											<label class="mdl-textfield__label">Name</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="number" id="txtLasttName" name="amount" value="${serviceEdit.amount}" required="">
											<label class="mdl-textfield__label">amount</label>
										</div>
									</div>
									
									
									<div class="col-lg-6 p-t-20">
										<div class="form-group row" style="margin-bottom: 15px;padding-top: 25px;">
                                                                                    <label class="col-md-2 control-label">Open Time</label>
                                                                                    <div class="input-group date form_time col-md-10" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                                                                                        <input class="form-control" size="16" type="text" name="openTime" value="${serviceEdit.openTime}" required="">
                                                                                        <span class="input-group-addon"><span class="fa fa-remove"></span></span>
                                                                                        <span class="input-group-addon"><span class="fa fa-clock-o"></span></span>
                                                                                    </div>
                                                                                    <input type="hidden" id="dtp_input3" value="">
                                                                                    <br>
                                                                                </div>
									</div>
                                                                        <div class="col-lg-6 p-t-20">
										<div class="form-group row" style="margin-bottom: 15px;padding-top: 25px;">
                                                                                    <label class="col-md-2 control-label">Close Time</label>
                                                                                    <div class="input-group date form_time col-md-10" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                                                                                        <input class="form-control" size="16" type="text" name="closeTime" value="${serviceEdit.closeTime}" required="">
                                                                                        <span class="input-group-addon"><span class="fa fa-remove"></span></span>
                                                                                        <span class="input-group-addon"><span class="fa fa-clock-o"></span></span>
                                                                                    </div>
                                                                                    <input type="hidden" id="dtp_input3" value="">
                                                                                    <br>
                                                                                </div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" id="txtLasttName" name="position" value="${serviceEdit.position}" required="">
											<label class="mdl-textfield__label">position</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										
									</div>
                                                                    
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <textarea class="mdl-textfield__input" rows="4" id="text7" name="description" required="">${serviceEdit.description}</textarea>
											<label class="mdl-textfield__label" for="text7">Description</label>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
                                                                                
                                                                            <c:if test="${action == 'add-service'}">
                                                                                <label class="control-label col-md-3">Upload Photo: </label>

                                                                                <input class="dropIcon" type="file" name="files" multiple="multiple" required="">
                                                                            </c:if>
                                                                            <c:if test="${action == 'edit-service'}">
                                                                                <input hidden="" type="number" value="${serviceEdit.id}" name="id">
                                                                                <c:forEach items="${serviceEdit.images}" var="img" varStatus="st">
                                                                                    <img src="${pageContext.request.contextPath}/resources/images/${img.name}" class="img-thumbnail" alt="${st.count}" width="200" height="100">
                                                                                </c:forEach>
                                                                                    <br><br>
                                                                                <label class="control-label col-md-3">Upload Photo: </label>

                                                                                <input class="dropIcon" type="file" name="files" multiple="multiple">
                                                                            </c:if>
										
										
                                                                               
									</div>
									
									<div class="col-lg-12 p-t-20 text-center">
                                                                            <c:if test="${action == 'add-service'}">
                                                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>

                                                                            </c:if>
                                                                            <c:if test="${action == 'edit-service'}">
                                                                                <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Update</button>                                                                                
                                                                            </c:if>
										<button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
									</div>
								</div>
                                                            </mvc:form>
							</div>
						</div>
					</div>
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
	<script src="<c:url value="/resources-management/assets/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker-init.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker-init.js"></c:url>"></script>
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
	<!--tags input-->
        <script src="<c:url value="/resources-management/assets/plugins/jquery-tags-input/jquery-tags-input.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-tags-input/jquery-tags-input-init.js"></c:url>"></script>
        <!--select2-->
        <script src="<c:url value="/resources-management/assets/plugins/select2/js/select2.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/select2/select2-init.js"></c:url>"></script>
	<!-- end js include path -->
</body>

</html>