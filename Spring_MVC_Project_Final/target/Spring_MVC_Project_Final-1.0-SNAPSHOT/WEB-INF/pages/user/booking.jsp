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
<!DOCTYPE html>
<html>
    <head>
        <title>Booking</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="../include/css_page.jsp"/>

    </head>
    <body onload="validDate()">
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

        <div id="hbe-bws-page">
            <div class="ng-scope">
                <div class="ng-no">
                    <h3 class="bws-page-title ng-binding">
                        Booking
                    </h3>
                    <div class="bws-panel">
                        <div class="padl10 padr10">
                            <label class="ng-binding">
                                <b class="ng-binding">Checkin:</b>  <fmt:formatDate value="${sessionScope.sDate}"
                                                type="date" pattern="dd-MM-yyyy" />
                            </label>
                            <label class="marb0 ng-binding">
                                <b class="ng-binding">Checkout:</b> <fmt:formatDate value="${sessionScope.eDate}"
                                                type="date" 
                                                pattern="dd-MM-yyyy"/>
                            </label>
                            <label>
                                <a href="<c:url value="/user/search?checkin=${sessionScope.sDateee}&checkout=${sessionScope.eDateee}"/>" 
                                   class="bws-font10 ng-binding">(Reset Room)</a>
                            </label>
                        </div>
                    </div>
                    <h5 class="bws-page-subtitle">
                        <b class="ng-binding">Reservations details</b>
                    </h5>
                    <c:if test="${cart != null && fn:length(cart)>0}">
                        <c:forEach items="${sessionScope.cart}" var="c">
                            <div class="bws-line-bottom">
                                <div class="bws-line-onetop">
                                    <div class="bws-row">
                                        <div class="bws-column">
                                            <span class="ckb-rooms-name">
                                                <b class="ng-binding">${c.value.room.roomType.name} (${c.value.room.roomNumber})</b>
                                            </span>
                                            <ul class="room-name-desc">
                                                <li class="ng-binding">No refund for cancellation fees</li>
                                                <li class="ng-binding">Breakfast included</li>
                                            </ul>
                                        </div>
                                        <div class="bws-row-1">
                                            <div class="bws-column">
                                                <div class="clearfix marb10">
                                                    <label class="marb0 ng-binding">
                                                        <b class="ng-binding">Detail:</b> ${c.value.room.roomType.numberOfBed * 2} 
                                                        The adult is included in the price
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bws-rowww2">
                                        <div class="text-right">
                                            <div class="marb10">
                                                <div class="ng-hide">
                                                    <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                       value="${c.value.room.roomType.price}" type="currency" currencySymbol="USD"/>   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="guest-payment-container">
                <h5 class="subtitle">
                    <b class="ng-binding">Customer information</b>
                </h5>
                <div class="col-sm7">
                    <div class="box box-blue">
                        <mvc:form action="${pageContext.request.contextPath}/user/saveBooking"
                                  method="POST" modelAttribute="booking">
                            <input type="date" name="checkin" value="${sessionScope.sDate}" hidden>
                            <input type="date" name="checkout" value="${sessionScope.eDate}" hidden>
                            <div class="box-body">
                                <sec:authorize access="!isAuthenticated()">
                                    <div class="row">
                                        <div class="info-block-wrapper top-border">
                                            <div class="contact-info-wrapper">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Email
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                                <small class="help-info">
                                                                    <i class="fa fa-info-circle"></i>					
                                                                    Confirmation of the reservation will be sent via this email.
                                                                </small>
                                                            </label>
                                                            <input type="text" name="email" class="form-control info_customer_book"
                                                                   value="${booking.email}">
                                                            <p style="color: red"><mvc:errors path="email"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Phone
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                                <small class="help-info">
                                                                    <i class="fa fa-info-circle"></i>					
                                                                </small>
                                                            </label>
                                                            <input type="text" name="phone" class="form-control info_customer_book"
                                                                   value="${booking.phone}">
                                                            <p style="color: red"><mvc:errors path="phone"/></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Full Name
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="text" name="fullName" class="form-control info_customer_book"
                                                                   value="${booking.fullName}">
                                                            <p style="color: red"><mvc:errors path="fullName"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Gender
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <select name="gender" class="form-control" style="font-size:12px">
                                                                <c:forEach items="${gender}" var="g">
                                                                    <option value="${g}">${g}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Birth Date
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="date" name="birthDate"
                                                                   value="${booking.birthDate}" id="birthDate" 
                                                                   class="form-control info_customer_book" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Address
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <textarea class="form-control info_customer_book" id="text7" 
                                                                      name="address">${booking.address}</textarea>
                                                            <p style="color: red"><mvc:errors path="address"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Identity Card Number:
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="text" name="cardId" class="form-control info_customer_book"
                                                                   value="${booking.cardId}">
                                                            <p style="color: red"><mvc:errors path="cardId"/></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </sec:authorize>
                                <sec:authorize access="isAuthenticated()">
                                    <div class="row">
                                        <div class="info-block-wrapper top-border">
                                            <div class="contact-info-wrapper">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Email
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                                <small class="help-info">
                                                                    <i class="fa fa-info-circle"></i>					
                                                                    Confirmation of the reservation will be sent via this email.
                                                                </small>
                                                            </label>
                                                            <input type="text" name="email" class="form-control info_customer_book"
                                                                   value="${user.email} ${booking.email}">
                                                            <p style="color: red"><mvc:errors path="email"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Phone
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                                <small class="help-info">
                                                                    <i class="fa fa-info-circle"></i>					
                                                                </small>
                                                            </label>
                                                            <input type="text" name="phone" class="form-control info_customer_book"
                                                                   value="${user.phone} ${booking.phone}">
                                                            <p style="color: red"><mvc:errors path="phone"/></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Full Name
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="text" name="fullName" class="form-control info_customer_book"
                                                                   value="${user.fullName} ${booking.fullName}">
                                                            <p style="color: red"><mvc:errors path="fullName"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Gender
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <select name="gender" class="form-control" style="font-size:12px">
                                                                <c:forEach items="${gender}" var="g">
                                                                    <option value="${g}">${g}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Birth Date
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="date" name="birthDate"
                                                                   value='${user.birthDate} ${booking.birthDate}' id="birthDate"
                                                                   class="form-control info_customer_book" required="">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Address
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <textarea class="form-control info_customer_book" id="text7" 
                                                                      name="address">${user.address} ${booking.address}</textarea>
                                                            <p style="color: red"><mvc:errors path="address"/></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label>Identity Card Number:
                                                                <sup class="text-xs red-dark-3">*</sup>
                                                                <br>
                                                            </label>
                                                            <input type="text" name="cardId" class="form-control info_customer_book"
                                                                   value="${user.cardId} ${booking.cardId}">
                                                            <p style="color: red"><mvc:errors path="cardId"/></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </sec:authorize>
                                <div class="col-sm-12">
                                    <div class="alert alert-success text-center" role="alert">
                                        Pay now to keep<strong> empty room</strong> and <strong>best price</strong>!
                                    </div>
                                </div>
                                <div class="tab-payment-wrapper mg-bt-30">
                                    <div class="tab-content">
                                        <div class="confirm-payment show">
                                            <button class="btn-yellow" type="submit">
                                                <span class="ng-binding">BOOK ROOM</span>
                                            </button>
                                            <p class="text-center accept-condition">
                                                <small>
                                                    By clicking the Make a Payment button you agree to our terms and conditions.
                                                </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </mvc:form>
                    </div>
                </div>
                <div class="col-sm-5">
                    <div class="booking-bill">
                        <h4 class="title-sm title-sm-green">
                            <strong>Book now!</strong> Room rates may change in a moment!
                        </h4>
                        <table class="table table-none-border">
                            <tbody>
                                <tr>
                                    <td>
                                        <table class="table table-none-border room-list">
                                            <tbody>
                                                <tr>
                                                    <td colspan="2"><strong>Deluxe</strong></td>
                                                </tr>
                                                <tr>
                                                    <td>${sessionScope.quantity} Room
                                                        <br>
                                                        <ul>
                                                            <li>
                                                                Breakfast included                                                                                                              
                                                            </li>
                                                            <li>
                                                                No cancellation and refund                                                                                                                  
                                                            </li>
                                                        </ul>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        <strong class="price black">
                                                            <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                   value="${sessionScope.totalprice}" type="currency" currencySymbol="USD"/>  
                                                        </strong>
                                                        <br>
                                                        <small>đ/ 1 Night</small>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="col-sm-12">
                            <table class="table total-money mg-bt-0">
                                <tbody>
                                    <tr>
                                        <td><strong>Total Price</strong></td>
                                        <td>
                                            <strong class="money">
                                                <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                   value="${sessionScope.totalprice}" type="currency" currencySymbol="USD"/>   
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END section -->
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>


        <script type="text/javascript">
            function validDate() {
                var today = new Date().toISOString().split('T')[0];
                document.getElementsByName("birthDate")[0].setAttribute('max', today);
            }
        </script>
    </body>

</html>
