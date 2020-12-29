<%-- 
    Document   : logintest
    Created on : Dec 17, 2020, 2:53:42 PM
    Author     : NO1
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
        <!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/iconic/css/material-design-iconic-font.min.css"></c:url>">
            <!-- bootstrap -->
            <link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
            <!-- style -->
            <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/pages/extra_pages.css"></c:url>">
            <!-- favicon -->
            <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
        </head>

        <body>
            <div class="limiter">
                <div class="container-login100 page-background">
                    <div class="wrap-login100">
                        <!-- /login?error=true -->
                    
                    <form class="login100-form validate-form" action="<c:url value="j_spring_security_check"/>" method="post">
                        <span class="login100-form-logo">
                            <i class="zmdi zmdi-flower"></i>
                        </span>
                        <span class="login100-form-title p-b-34 p-t-27">
                            Log in
                        </span>
                        <c:if test="${message != null && message != ''}">
                        <p style="color: red;margin-left: 150px;">${message}</p>
                        </c:if>
                        <div class="wrap-input100 validate-input" data-validate="Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>

                        <div class="container-login100-form-btn">
                            <button class="login100-form-btn" type="submit">
                                Login
                            </button>
                        </div>

                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </div>
            </div>
        </div>
        <!-- start js include path -->
        <script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
            <!-- bootstrap -->
            <script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/extra_pages/login.js"></c:url>"></script>
        <!-- end js include path -->
    </body>

</html>