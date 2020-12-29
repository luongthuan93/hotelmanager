<%-- 
    Document   : room
    Created on : Nov 29, 2020, 5:06:20 PM
    Author     : lamde
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LuxuryHotel a Hotel Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="../include/css_page.jsp"/>
    </head>
    <body>

        <section class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-12 ms-12">
                        <div class="block-3 d-md-flex">
                            <div class="image" style="background-image: url('<c:url value="/resources/images/img_3.jpg"/>');"></div>
                            <div class="text">
                                <h2 class="heading">Cancel Booking Success!!!</h2>
                                <ul class="specs mb-5">
                                    <li>
                                        <strong>Booking information has been sent via email </strong>
                                        <i class="glyphicon glyphicon-envelope"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>
    </body>
</html>
