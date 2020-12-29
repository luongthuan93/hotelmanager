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
								<div class="page-title">Add Room Type</div>
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
									<header>Add Room Type</header>
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
                                                                                        <trong>${message}</trong>. Please try one more time. Thank!
                                                                </div>
                                                            </c:if>
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/${action}" method="POST" modelAttribute="roomtype" enctype="multipart/form-data">  
								<div class="card-body row"> 
									<div class="col-lg-6 p-t-20">
										
                                                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                                                <label for="sample2" class="mdl-textfield__label">Name</label>
                                                                                <c:if test="${action == 'add-roomtype'}">
                                                                                    <select class="mdl-textfield__input" type="text" id="sample2" readonly="" tabindex="-1" name="name" style=" height: 43px; ">

                                                                                        <c:forEach items="${roomtypeenums}" var="rt">

                                                                                            <option class="mdl-menu__item" value="${rt}" <c:if test="${editRoomType.name == rt}">selected="" </c:if>>${rt}</option>
                                                                                        </c:forEach>                                                                                            

                                                                                    </select>
                                                                                </c:if>

                                                                                <c:if test="${action == 'edit-roomtype'}">
                                                                                    <input hidden="" type="number" name="id" value="${editRoomType.id}">
                                                                                    <input class="mdl-textfield__input" readonly="" type="text" value="${editRoomType.name}" name="name" id="sample2" >
                                                                                </c:if>

                                                                            </div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="number" id="txtLasttName" name="price" required="" value="${editRoomType.price}">
											<label class="mdl-textfield__label">Price</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="number" id="txtLasttName" name="size" required="" value="${editRoomType.size}" max="500">
											<label class="mdl-textfield__label">Size</label>
										</div>
									</div>
									
									
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                                                    
											
											<label for="list3" class="mdl-textfield__label">Number of Bed</label>
                                                                                        
											<select class="mdl-textfield__input" type="number" id="list3" readonly="" tabindex="-1" name="numberOfBed" style=" height: 43px; ">                                                                                      
                                                                                            
                                                                                                
                                                                                                <option class="mdl-menu__item" value="1" <c:if test="${editRoomType.numberOfBed == 1}">selected=""</c:if>>1</option>
                                                                                                <option class="mdl-menu__item" value="2" <c:if test="${editRoomType.numberOfBed == 2}">selected=""</c:if>>2</option>
                                                                                                <option class="mdl-menu__item" value="3" <c:if test="${editRoomType.numberOfBed == 3}">selected=""</c:if>>3</option>
                                                                                                <option class="mdl-menu__item" value="4" <c:if test="${editRoomType.numberOfBed == 4}">selected=""</c:if>>4</option>
                                                                                                <option class="mdl-menu__item" value="5" <c:if test="${editRoomType.numberOfBed == 5}">selected=""</c:if>>5</option>
                                                                                                <option class="mdl-menu__item" value="6" <c:if test="${editRoomType.numberOfBed == 6}">selected=""</c:if>>6</option>
                                                                                                                                                                                     
                                                                                            
                                                                                        </select>
										</div>
									</div>
                                                                        <c:if test="${action == 'edit-roomtype'}">
                                                                         
                                                                            <div class="col-lg-6 p-t-20">
                                                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">

                                                                                    <label for="statusedit" class="mdl-textfield__label">Status</label>
                                                                                    <select class="mdl-textfield__input" type="text" id="statusedit" readonly="" tabindex="-1" name="status" style=" height: 43px; ">

                                                                                            <option class="mdl-menu__item" value="ACTIVE" <c:if test="${editRoomType.status == 'ACTIVE'}">selected="" </c:if>>ACTIVE</option>
                                                                                            <option class="mdl-menu__item" value="INACTIVE" <c:if test="${editRoomType.status == 'INACTIVE'}">selected="" </c:if>>INACTIVE</option>                                                                             

                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </c:if>
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield txt-full-width">
                                                                                    <textarea class="mdl-textfield__input" rows="4" id="text7" name="description">${editRoomType.description}</textarea>
											<label class="mdl-textfield__label" for="text7">Description</label>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
                                                                            <c:if test="${action == 'edit-roomtype'}">
                                                                                <c:forEach items="${editRoomType.images}" var="img" varStatus="st">
                                                                                    <img src="${pageContext.request.contextPath}/resources/images/${img.name}" class="img-thumbnail" alt="${st.count}" width="200" height="100">
                                                                                </c:forEach>
                                                                                    <br><br>
                                                                                <label class="control-label col-md-3">Upload Photo: </label>
                                                                                <input class="dropIcon" type="file" name="files" multiple="multiple">
                                                                                
                                                                            </c:if>
                                                                        </div>
                                                                        <div class="col-lg-12 p-t-20">
                                                                            <c:if test="${action == 'add-roomtype'}">
                                                                                <label class="control-label col-md-3">Upload Photo: </label>

                                                                                <input class="dropIcon" type="file" name="files" multiple="multiple" required="">
                                                                            </c:if>
								
										
                                                                               
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