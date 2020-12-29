<%-- 
    Document   : room
    Created on : Nov 29, 2020, 5:06:20 PM
    Author     : lamde
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        <!--         END section -->

        <section class="site-section">
            <div class="container">
                <c:if test="${sessionScope.sDate != null && sessionScope.sDate != '' 
                              && sessionScope.eDate != null && sessionScope.eDate != ''}">
                      <div class="row">
                          <div class="col-md-12 mb-12">
                              <ul>
                                  <p> Checkin:  <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                  value = "${sessionScope.sDate}" /></p>   
                              </ul>
                              <ul>
                                  <p>Checkout: <fmt:formatDate pattern = "dd-MM-yyyy" 
                                                  value="${sessionScope.eDate}" /></p>
                              </ul>
                          </div>
                      </div>
                </c:if>

                <div class="row">
                    <div class="col-md-12 mb-12">
                        <h2 style="text-align: center"> Room List </h2>
                    </div>
                </div>
                <c:if test="${listRoom != null && fn:length(listRoom)>0}">
                    <div class="row">
                        <c:forEach items="${listRoom}" var="r">
                            <div class="col-md-4 mb-4">
                                <div class="media d-block room mb-0">
                                    <figure>
                                        <img src="<c:url value="/resources/images/img_2.jpg"/>" alt="Generic placeholder image" class="img-fluid">
                                        <div class="overlap-text">
                                            <span>
                                                Featured Room 
                                                <span class="ion-ios-star"></span>
                                                <span class="ion-ios-star"></span>
                                                <span class="ion-ios-star"></span>
                                            </span>
                                        </div>
                                    </figure>
                                    <div class="media-body">
                                        <h3 class="mt-0"><a href="#">${r.roomType.name}</a>

                                        </h3>
                                        <ul class="room-specs">
                                            <li><span class="ion-ios-people-outline"></span> ${r.roomType.numberOfBed * 2} Guests</li>
                                            <li><span class="ion-ios-crop"></span>${r.roomType.size} ft <sup>2</sup></li>
                                            <li>
                                                <span class="ion-ios-crop"></span>Room number: ${r.roomNumber}</li>
                                            </li>

                                        </ul>
                                        <p>${r.roomType.description}</p>
                                        <p>
                                            <a href="<c:url value="/user/detailroom/${r.id}"/>" class="btn btn-primary btn-sm">Book Now From
                                             <fmt:formatNumber  pattern="$ #,###.##;$ -#,###.##" 
                                                                value="${r.roomType.price}" type="currency" currencySymbol="USD"/></a>   
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${listRoom == null || fn:length(listRoom)<=0}">
                    <h4 style="color: red ; text-align: center">
                        Empty!!!
                    </h4>
                </c:if>
            </div>
        </section>

        <section class="section-cover" data-stellar-background-ratio="0.5" style="background-image: url(<c:url value="/resources/images/img_5.jpg"/>);">
            <div class="container">
                <div class="row justify-content-center align-items-center intro">
                    <div class="col-md-9 text-center element-animate">
                        <h2>Relax and Enjoy your Holiday</h2>
                        <p class="lead mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Architecto quidem tempore expedita facere facilis, dolores!</p>
                        <div class="btn-play-wrap"><a href="https://vimeo.com/channels/staffpicks/93951774" class="btn-play popup-vimeo "><span class="ion-ios-play"></span></a></div>
                    </div>
                </div>
            </div>
        </section><!--
         END section -->
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>
    </body>
</html>
