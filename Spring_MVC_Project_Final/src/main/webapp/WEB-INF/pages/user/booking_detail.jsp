<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <title>LuxuryHotel a Hotel Template</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <jsp:include page="../include/css_page.jsp"/>
    </head>
    <body>
        <section id="contaipage">
            <div class="ng-nooo">
                <h3 style="text-align: center">Booking Detail</h3>
                <c:if test="${error != null && error != ''}">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                             style="padding-top: 10px">
                            <div class="alert alert-danger">${error}</div>
                        </div>
                    </div>
                </c:if>
                <div class="bws-panel">
                    <div class="padl10 padr10">
                        <label class="ng-binding">
                            <b class="ng-binding">Checkin:</b>
                            <fmt:formatDate value="${booking.checkin}" pattern="dd-MM-yyyy" />
                        </label>
                        <label class="marb0 ng-binding">
                            <b class="ng-binding">Checkout:</b>
                            <fmt:formatDate value="${booking.checkout}" pattern="dd-MM-yyyy" />
                        </label>
                    </div>
                </div>
                <h5 class="bws-page-subtitle">
                    <div class="but-st">
                        <b class="ng-binding">Room details have been booked</b>
                    </div>
                </h5>
                <div class="bws-line-bottom">
                    <div class="bws-line-onetopppp">
                        <div class="bws-rowww">
                            <c:forEach items="${bookingDetail}" var="bd">
                                <div class="bws-row-111">
                                    <div class="ima-des">
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
                                            <label class="ng-binding" style="padding-left: 61px;">
                                                Click to see more</label>
                                        </div>
                                    </div>
                                    <div class="bws-columnnn">
                                        <span class="ckb-rooms-name">
                                            <b class="ng-binding">${bd.room.roomType.name} ${bd.room.roomNumber}</b>
                                        </span>
                                        <div class="clearfix marb10">
                                            <ul class="room-name-desc">
                                                <li class="ng-binding">No refund for cancellation fees</li>
                                                <li class="ng-binding">Breakfast included</li>
                                            </ul>
                                            <label class="marb0 ng-binding">
                                                <b class="ng-binding">Detail: </b> 1 room, size: ${bd.room.roomType.size}m
                                                <sup class="ng-scope">2</sup>, 
                                                ${bd.room.roomType.numberOfBed * 2} adults are included in the price.
                                                <br>
                                                <b class="ng-binding">Price: </b>  <fmt:formatNumber type = "number" 
                                                                  pattern = "###,###VNĐ" value = "${bd.room.roomType.price}" />
                                                <br>
                                                <b class="ng-binding">Description: </b> ${bd.room.roomType.description}
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="bws-row-2">
                                <div class="text-righttt">
                                    <div class="marb10">
                                        <label class="marb0 ng-binding">
                                            <b class="ng-binding">Booking Number:</b> ${booking.bookingNumber}
                                        </label>
                                        <label class="marb0 ng-binding">
                                            <b class="ng-binding">Booking Date:</b>
                                            <fmt:formatDate value="${booking.bookingDate}" pattern="dd-MM-yyyy" />
                                        </label>
                                        <label class="marb0 ng-binding">
                                            <b class="ng-binding">Full Name:</b> ${booking.fullName}
                                        </label>
                                        <label class="marb0 ng-binding">
                                            <b class="ng-binding">Id Card:</b> ${booking.cardId}
                                        </label>
                                        <label class="marb0 ng-binding">
                                            <b class="ng-binding">Phone Number:</b> ${booking.phone}
                                        </label>
                                        <div class="ng-hide">Total Price: 
                                            <fmt:formatNumber type = "number" 
                                                              pattern = "###,###VNĐ" value = "${booking.totalPrice}" />
                                        </div>
                                        <button class="btn-yellow" onclick="location.href = '<c:url value="/user/cancel/${booking.id}"/>'">
                                            <span class="ng-binding">Cancel</span>
                                    </div>
                                </div>
                            </div>
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
