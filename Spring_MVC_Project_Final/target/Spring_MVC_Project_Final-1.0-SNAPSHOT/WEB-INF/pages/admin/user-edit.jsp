<%-- 
    Document   : form-user
    Created on : Nov 26, 2020, 2:11:47 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta name="description" content="Responsive Admin Template">
        <meta name="author" content="SmartUniversity">
        <title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>
        <jsp:include page="../include-management/css-page.jsp"/>
        <!-- dropzone -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.css"></c:url>">
        <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css"/>" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.css"/>">
    </head>
    <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
        <div class="page-wrapper">
            <jsp:include page="../include-management/body_header.jsp"/>
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
                                    <div class="page-title">Add User Details</div>
                                </div>
                                <ol class="breadcrumb page-breadcrumb pull-right">
                                    <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li><a class="parent-item" href="javascript:history.back()">User</a>&nbsp;<i class="fa fa-angle-right"></i>
                                    </li>
                                    <li class="active">Add User Details</li>
                                </ol>
                            </div>
                        </div>
                        
                           <div class="row">
						<div class="col-sm-12">
							<div class="card-box">
								<div class="card-head">
									<header>Enter User Information</header>
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
                                                            <mvc:form action="${pageContext.request.contextPath}/admin/${action}" method="POST" modelAttribute="user">
                                                                <input hidden="" name="id" value="${userEdit.id}">
								<div class="card-body row">
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" id="txtFirstName" name="fullName" value="${userEdit.fullName}" required="">
											<label class="mdl-textfield__label">Full Name</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="tel" pattern="[0-9]{10}" id="text5" name="phone" value="${userEdit.phone}" required="">
											<label class="mdl-textfield__label" for="text5">Mobile Number</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="email" id="txtemail" name="email" value="${userEdit.email}" required="" readonly="">
											<label class="mdl-textfield__label">Email</label>
											<span class="mdl-textfield__error">Enter Valid Email Address!</span>
										</div>
									</div>
									
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date" name="birthDate" required="" max="${today}" value="${userEdit.birthDate}" placeholder="">
                                                                                    <label class="mdl-textfield__label">Birth Date</label>
										</div>
									</div>
									
									<div class="col-lg-6 p-t-20">
                                                                            
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width is-focused">
                                                                                    <label for="role2" class="mdl-textfield__label"> Role</label>
                                                                                    <div class="mdl-textfield__input" id="sample2" id="role2">
                                                                                        <span class="col-lg-1"></span>
                                                                                        <c:forEach items="${userRoles}" var="r" varStatus="theCount">
                                                                                            <span>
                                                                                                    <span class="checkbox checkbox-icon-black">
                                                                                                        <input id = "role${theCount.index}" name = "userRoles[${theCount.index}]" type = "checkbox" value = "${r.id}"<c:forEach items="${userEdit.userRoles}" var="ur"><c:if test="${r.id == ur.id}">checked=""</c:if></c:forEach>>
                                                                                                        <label for = "role${theCount.index}">${r.role}</label>
                                                                                                    </span>
                                                                                             </span>
                                                                                        </c:forEach>
                                                                                    
                                                                                    
                                                                                    
                                                                                </div>
                                                                                      
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                                                    <select class="mdl-textfield__input" type="text" id="sample2" readonly="" tabindex="-1" name="gender" style=" height: 43px; ">
                                                                                        <c:if test="${userEdit.gender == 'MALE'}">
                                                                                            <option class="mdl-menu__item" value="MALE" selected="">MALE</option>
                                                                                            <option class="mdl-menu__item" value="FEMALE">FEMALE</option>
                                                                                        </c:if>
                                                                                        <c:if test="${userEdit.gender == 'FEMALE'}">
                                                                                            <option class="mdl-menu__item" value="MALE" >MALE</option>
                                                                                            <option class="mdl-menu__item" value="FEMALE" selected="">FEMALE</option>
                                                                                        </c:if>
                                                                                        </select>
											
											<label for="sample2" class="mdl-textfield__label">Gender</label>
											
                                                                                        
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" pattern="^[0-9]{8,12}$" id="text15" name="cardId" value="${userEdit.cardId}" required="">
											<label class="mdl-textfield__label" for="text15">Card ID</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield txt-full-width">
                                                                                    <textarea class="mdl-textfield__input" rows="4" id="text7" name="address" required="">${userEdit.address}</textarea>
											<label class="mdl-textfield__label" for="text7">Address</label>
										</div>
									</div>
									
									
									<div class="col-lg-12 p-t-20 text-center">
										<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Update</button>
                                                                                <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Reset</button>
									</div>
								</div>
                                                                </mvc:form>
							</div>
						</div>
					</div>
                        
                    </div>
                </div>
                <!-- end page content -->
            </div>
            <!-- end page container -->
            <jsp:include page="../include-management/body_footer.jsp"/>
        </div>
        <jsp:include page="../include-management/js-page.jsp"/>
        <script>
                var url_string = window.location.href;
                var url = new URL(url_string);                
                var type = url.searchParams.get("type");
                var message = url.searchParams.get("message");
//                console.log(message);
                if(message.length > 1){
                    if(type == 'success'){
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From LUXSTAY HOTEL System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',
                            icon: 'success',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }else{
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From LUXSTAY HOTEL System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',                            
                            icon: 'error',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }
            };
            </script>
        <!-- dropzone -->
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"/>"></script>
        <!-- date and time 	 -->
        <script src="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/datetime/datetime-data.js"/>"></script>
        <!-- notifications -->
        <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/toast.js"></c:url>"></script>

    </body>
</html>
