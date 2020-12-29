<%-- 
    Document   : room_detail
    Created on : Dec 2, 2020, 2:43:50 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LuxuryHotel a Hotel Template</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <jsp:include page="../include/css_page.jsp"/>
    </head>
    <body>
        <jsp:include page="../include/header.jsp"/>
        <section class="site-hero site-hero-innerpage overlay" data-stellar-background-ratio="0.5" style="background-image: url(<c:url value="/resources/images/big_image_1.jpg"/>);">
            <div class="container">
                <div class="row align-items-center site-hero-inner justify-content-center">
                    <div class="col-md-12 text-center">
                        <div class="mb-5 element-animate">
                            <h1>Our Rooms</h1>
                            <p>Discover our world's #1 Luxury Room For VIP.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <div class="search-filter">
                            <h2 style="text-align: center">Room Detail</h2>
                        </div>
                        <div class="bws-large-10">
                            <div class="bws-row">
                                <div class="bws-large-7">
                                    <div class="bws-row">
                                        <div style="position: relative;">
                                            <span class="fa fa-calendar icon" style="right: 10px; top: 10px;">
                                                <jsp:useBean id="now" class="java.util.Date"/>    
                                                Booking Date: 
                                                <fmt:formatDate value="${now}" pattern="dd-MM-yyyy" />
                                            </span>
                                            <span class="fa fa-calendar icon" style="right: 10px; top: 10px;">
                                                Checkin Date: <fmt:formatDate value="${sessionScope.sDate}" pattern="dd-MM-yyyy" /></p>                                       
                                            </span>
                                            <span class="fa fa-calendar icon" style="right: 10px; top: 10px;"> 
                                                Checkout Date: <fmt:formatDate value="${sessionScope.eDate}" pattern="dd-MM-yyyy" /></p>  
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10 mb-10">
                        <c:if test="${cart != null && fn:length(cart)>0}">
                            <c:forEach items="${sessionScope.cart}" var="c">
                                <div class="bws-room-box-bg">
                                    <div class="bws-room-general">
                                        <div class="room-type">
                                            <div class="room-type-desc">
                                                <div class="room-type-name bws-body-text-color">
                                                    <b class="ng-binding">${c.value.room.roomType.name} (${c.value.room.roomNumber})</b>
                                                </div>
                                                <div class="bws-room-details bws-body-text-color">
                                                    <p class="bws-details-description">
                                                        <span>${c.value.room.roomType.description}</span>
                                                    <div class="bws-room-bed-size">
                                                        <span class="bws-bed-size ng-scope ng-binding">
                                                            <b class="ng-binding">Bed size:</b>
                                                            ${c.value.room.roomType.numberOfBed} double bed
                                                        </span>
                                                        <span class="bws-room-size ng-binding">
                                                            <b class="ng-scope ng-binding">Room area:</b>
                                                            ${c.value.room.roomType.size} m
                                                            <sup class="ng-scope">2</sup>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="room-type-img">
                                                <a class="fancyboxLauncher" href="<c:url value="/resources/images/img_1.jpg"/>">
                                                    <img style="width: 245px;" src="<c:url value="/resources/images/img_1.jpg"/>"/>
                                                </a>
                                                <div style="display: none;">
                                                    <a class="fancybox" href="<c:url value="/resources/images/img_1.jpg"/>" title="one">
                                                    </a>
                                                    <a class="fancybox" href="<c:url value="/resources/images/img_2.jpg"/>" title="two">
                                                    </a>
                                                </div>
                                                <label class="ng-binding">Click to see more</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bws-line-top rate-plan-wrapper">
                                        <div class="rate-plan">
                                            <div class="bws-col1">
                                                <div class="rate-plan-name ng-binding">${c.value.room.roomType.name} (${c.value.room.roomNumber})</div>
                                                <div class="highlights">
                                                    <div class="special-offer clearfix ng-scope">
                                                        <ul>
                                                            <li class="ng-scope ng-binding">FUNNY DAY 60% OFF </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="cancellation-policy">
                                                    <span class="ng-binding">
                                                        No refund for cancellation fees 
                                                    </span>
                                                </div>
                                                <div class="meal-plan">
                                                    Breakfast included 
                                                </div>
                                            </div>
                                            <div class="bws-col2">
                                                <div class="occupancy-wrapper">
                                                    <div class="occupancy has-tip ng-binding">
                                                        <label class="ng-binding">${c.value.room.roomType.numberOfBed * 2} Adults</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="bws-end">
                                                <div class="bws-inner">
                                                    <div class="bws-col4 room-price ng-scope">
                                                        <div class="bws-room-price-inner">
                                                            <div class="room-price-row">
                                                                <span class="has-tip ng-binding">
                                                                    <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                                       value="${c.value.room.roomType.price}" type="currency" currencySymbol="USD"/></a>   

                                                                </span>
                                                            </div>
                                                            <label>
                                                                <small class="ng-binding">/ night</small>
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="bws-col5 room-selection">
                                                        <button onclick="location.href = '<c:url value="/user/remove/${c.value.room.id}"/>'"
                                                                class="btn btn-outline-danger btn-sm">Remove</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${cart == null || fn:length(cart) <= 0}">
                            <tr>
                                <td colspan="8" style="color: red;">
                                    <h4 style="text-align: center">room list empty!!!</h4>
                                </td>
                            </tr>
                        </c:if>
                    </div>
                    <c:if test="${cart != null && fn:length(cart)>0}">
                        <div class="col-md-2 mb-2">
                            <div class="bws-large-2 bws-medium-2 bws-small-12 total-price-wrapper">
                                <div class="bws-row">
                                    <button class="bws-button bws-secondary ng-scope" 
                                            onclick="location.href = '<c:url value="/user/booking"/>'">
                                        <span class="ng-binding">Booking</span>
                                    </button>
                                    <div class="bws-column bws-large-12 bws-medium-12 bws-small-6">
                                        <div class="small-only-left text-center total-price">
                                            <label><span class="ng-binding">${sessionScope.quantity} Room</span></label>
                                            <label class="bws-price ng-binding">
                                                <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                   value="${sessionScope.totalprice}" type="currency" currencySymbol="USD"/></a>   
                                            </label>
                                            <label class="ng-scope ng-binding">for 1 Night</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-12">
                        <div class="bws-col5 room-selection">
                            <button onclick="location.href = '<c:url value="/user/search?checkin=${sessionScope.sDateee}&checkout=${sessionScope.eDateee}"/>'"
                                    class="btn btn-outline-warning btn-sm">Back</button>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>
        <script type="text/javascript" src="<c:url value="/resources/lib/jquery.mousewheel.pack.js?v=3.1.3"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/source/jquery.fancybox.pack.js?v=2.1.5"/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/source/jquery.fancybox.css?v=2.1.5"/>" media="screen" />
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"/>" />
        <script type="text/javascript" src="<c:url value="/resources/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"/>"></script>
        <link rel="stylesheet" type="text/css" href="<c:url value="/resources/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"/>" />
        <script type="text/javascript" src="<c:url value="/resources/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/source/helpers/jquery.fancybox-media.js?v=1.0.6"/>"></script>

    </body>
    <script type="text/javascript">
                                $(document).ready(function () {
                                    $(".fancyboxLauncher").on("click", function () {
                                        $(".fancybox").eq(0).trigger("click");
                                        return false;
                                    });

                                    $(".fancybox")
                                            .attr('rel', 'gallery')
                                            .fancybox({
                                                padding: 0
                                            });
                                });
    </script>
</html>

