<%-- 
    Document   : booking
    Created on : Nov 29, 2020, 6:57:06 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="../include/css_page.jsp"/>

    </head>
    <body>

        <jsp:include page="../include/header.jsp"/>
        <section class="site-hero site-hero-innerpage overlay" data-stellar-background-ratio="0.5" style="background-image: url(<c:url value="/resources/images/big_image_1.jpg"/>);">
            <div class="container">
                <div class="row align-items-center site-hero-inner justify-content-center">
                    <div class="col-md-12 text-center">

                        <div class="mb-5 element-animate">
                            <h1>Reservation</h1>
                            <p>Discover our world's #1 Luxury Room For VIP.</p>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->

        <div class="container">
            <div class="row">
                <div class="panel panel-primary filterable">
                    <div class="panel-heading">
                        <h3 style="text-align: center" class="panel-title">Booking History</h3>               
                    </div>
                    <table class="table">
                        <thead>
                            <tr class="filters">
                                <th>Booking Number</th>
                                <th>Booking Date</th>
                                <th>Checkin</th>
                                <th>Checkout</th>
                                <th>Total Price</th>
                                <th>Full Name</th>
                                <th>ID Card</th>
                                <th>Phone Number</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <c:if test="${bookings != null && fn:length(bookings)>0}">
                            <c:forEach items="${bookings}" var="b">
                                <tbody>
                                    <tr>
                                        <td>${b.bookingNumber}</td>
                                        <td>
                                            <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                            value = "${b.bookingDate}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                            value = "${b.checkin}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                            value = "${b.checkout}" />
                                        </td>
                                        <td>
                                            <fmt:setLocale value = "en_US"/>
                                            <fmt:formatNumber value = "${b.totalPrice}" type = "currency"/>
                                        </td>
                                        <td>${b.fullName}</td>
                                        <td>${b.cardId}</td>
                                        <td>${b.phone}</td>
                                        <td>${b.status}</td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </c:if>
                        <c:if test="${bookings == null || fn:length(bookings)<=0}">
                            <tr>
                                <td colspan="8" style="color: red ; text-align: center">
                                    Empty List!!!
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <div class="action"> 
                    <a class="btn btn-primary btn-sm" href="<c:url value="/user/home"/>">Back to home page</a>
                </div>
            </div>
        </div>

        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>

    </body>

</html>
