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
                                    <li><a class="parent-item" href="">User</a>&nbsp;<i class="fa fa-angle-right"></i>
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
								<div class="card-body row">
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" id="txtFirstName" name="fullName" required="">
											<label class="mdl-textfield__label">Full Name</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" pattern="[0-9]{10}" id="text5" name="phone" required="">
											<label class="mdl-textfield__label" for="text5">Mobile Number</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="email" id="txtemail" name="email" required="">
											<label class="mdl-textfield__label">Email</label>
											<span class="mdl-textfield__error">Enter Valid Email Address!</span>
										</div>
									</div>
									
                                                                        <div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="date" name="birthDate" required="" max="${today}" placeholder="">
                                                                                    <label class="mdl-textfield__label">Birth Date</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="password" id="txtPwd" required="">
											<label class="mdl-textfield__label">Password</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="password" id="txtConfirmPwd" name="password" required="">
											<label class="mdl-textfield__label">Confirm Password</label>
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
                                                                            
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width is-focused">
                                                                                    <label for="role2" class="mdl-textfield__label"> Role</label>
                                                                                    <div class="mdl-textfield__input" id="sample2" id="role2">
                                                                                        <span class="col-lg-1"></span>
                                                                                        <c:forEach items="${userRoles}" var="r" varStatus="theCount">
                                                                                            <span>
                                                                                                <c:if test="${r.id == 1}">
                                                                                                    
                                                                                                    <span class="checkbox checkbox-icon-black">
                                                                                                        <input id = "role${theCount.index}" name = "userRoles[${theCount.index}]" type = "checkbox" value = "${r.id}" checked="">
                                                                                                        <label for = "role${theCount.index}">${r.role}</label>
                                                                                                    </span>
                                                                                                    
                                                                                                </c:if>
                                                                                              
                                                                                                <c:if test="${r.id > 1}">
                                                                                                    <span class="checkbox checkbox-icon-black">
                                                                                                        <input id = "role${theCount.index}" name = "userRoles[${theCount.index}]" type = "checkbox" value = "${r.id}">
                                                                                                        <label for = "role${theCount.index}">${r.role}</label>
                                                                                                    </span>
                                                                                                </c:if>
                                                                                             </span>
                                                                                        </c:forEach>
                                                                                    
                                                                                    
                                                                                    
                                                                                </div>
                                                                                      
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                                                    <select class="mdl-textfield__input" type="text" id="sample2" readonly="" tabindex="-1" name="gender" style=" height: 43px; ">
                                                                                                <option class="mdl-menu__item" value="MALE">MALE</option>
                                                                                                <option class="mdl-menu__item" value="FEMALE">FEMALE</option>
                                                                                        </select>
											
											<label for="sample2" class="mdl-textfield__label">Gender</label>
											
                                                                                        
										</div>
									</div>
									<div class="col-lg-6 p-t-20">
										<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                    <input class="mdl-textfield__input" type="text" pattern="^[0-9]{8,12}$" id="text15" name="cardId" required="">
											<label class="mdl-textfield__label" for="text15">Card ID</label>
											<span class="mdl-textfield__error">Number required!</span>
										</div>
									</div>
									<div class="col-lg-12 p-t-20">
										<div class="mdl-textfield mdl-js-textfield txt-full-width">
                                                                                    <textarea class="mdl-textfield__input" rows="4" id="text7" name="address" required=""></textarea>
											<label class="mdl-textfield__label" for="text7">Address</label>
										</div>
									</div>
									
									
									<div class="col-lg-12 p-t-20 text-center">
										<button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
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
        <!-- dropzone -->
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"/>"></script>
        <!-- date and time 	 -->
        <script src="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/datetime/datetime-data.js"/>"></script>

    </body>
</html>
