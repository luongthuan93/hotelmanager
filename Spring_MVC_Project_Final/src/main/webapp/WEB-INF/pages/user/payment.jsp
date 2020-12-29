<%-- 
    Document   : booking
    Created on : Nov 29, 2020, 6:57:06 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Booking</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="../include/css_page.jsp"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">
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

        <div class="mobile-outlet">
            <div class="container-fluid">
                <div class="container d_wrap">
                    <c:if test="${message != null && message != ''}">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                                 style="padding-top: 10px">
                                <c:if test="${type != null && type!= '' && type == 'error'}">
                                    <div class="alert alert-danger">${message}</div>
                                </c:if>
                            </div>
                        </div>
                    </c:if>
                    <div class="d_content">
                        <div class="colright">
                            <div class="d_box_info" style="border-radius: 0 0 5px 5px;">
                                <div class="d_head_box">
                                    <div class="d_head_text">
                                        Booking Detail
                                    </div>
                                </div>
                            </div>
                            <div class="d_right_content">
                                <div class="d_select_wrap_info">
                                    <div class="d_lb_box">Payment acceptance unit</div>
                                    <div class="d_select_mname">HOTEL</div>
                                    <div class="select_info">
                                        <div class="d_lb_box_amount">Payment price</div>
                                        <div class="d_select_amount">
                                            <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                               value="${sessionScope.totalprice}" type="currency" currencySymbol="USD"/>  
                                        </div>
                                        <div style="clear: both;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col_left">
                            <div class="menu-option">
                                <div class="d_head_box">
                                    <div class="d_head_text">
                                        <div class="d_head_text_one_form">
                                            <div class="text">Credit / Debit Card</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="radio-option">
                                    <div class="form intercard enable_form">
                                        <div class="d_select_method multiple margin_top_0">
                                            <div class="SelectInternational">
                                                <mvc:form action="${pageContext.request.contextPath}/user/savePayment"
                                                          method="POST" modelAttribute="creditcard">
                                                    <div class="ng-untouched ng-pristine ng-valid">
                                                        <div class="form-content">
                                                            <div class="title hide_all">
                                                                <div class="d_title_card">Thông tin thẻ</div>
                                                                <div class="d_text_err"></div>
                                                            </div>
                                                            <div class="form-item full-item">
                                                                <p>Card Number* </p>
                                                                <input type="text" placeholder = "1234 5678 9101 1234"
                                                                       name="number" class="form-control" required="">
                                                            </div>
                                                            <div class="form-item big-item">
                                                                <p>Exp Date*</p>
                                                                <input type="month" name="expiry"
                                                                       class="form-control" required="">
                                                            </div>

                                                            <div class="form-item big-item">
                                                                <p>CCV Code*</p>
                                                                <input type="text" placeholder="1234" name="ccvCode"
                                                                       class="form-control" required="">
                                                            </div>
                                                            <div class="form-item full-item">
                                                                <p>Name: </p>
                                                                <input type="text" placeholder = "Enter name" name="name"
                                                                       class="form-control" required="">
                                                            </div>
                                                        </div>
                                                        <div class="action">
                                                            <button type="submit" class="btn btn-primary disabled_pay_now">Payment</button>
                                                        </div>
                                                    </div>
                                                </mvc:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
    <jsp:include page="../include/js_page.jsp"/>

</body>
</html>
