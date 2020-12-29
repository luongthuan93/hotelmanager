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
                    <div class="col-md-2 mb-2">
                        <div class="menu-list">
                            <h4 class="ss-st">List Room Type</h4>
                            <c:forEach items="${listRoomTypes}" var="rt">
                                <div class="uu-tine">
                                    <ul>
                                        <li>
                                            <p>
                                                <a href="<c:url value="/user/roomlist/${rt.id}"/>">${rt.name}</a>
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-10 mb-10 ms-10">
                        <div class="block-3 d-md-flex">
                            <c:if test="${roomtype != null && roomtype != ''}">
                                <c:forEach var="img" items="${roomtype.images}" end="0">
                                    <div class="image" 
                                         style="background-image: url(${pageContext.request.contextPath }/resources/images/${img.name});">
                                    </div>
                                </c:forEach>
                                <div class="text">
                                    <h2 class="heading">${roomtype.name}</h2>
                                    <div class="dd-price">
                                        <sup>$</sup>
                                        <span class="number"><fmt:formatNumber value = "${roomtype.price}" 
                                                          type = "number" pattern = "###,###"/></span>
                                        <sub>/per nigth</sub>
                                    </div>
                                    <ul class="specs mb-5">
                                        <li>
                                            <strong>Adults: </strong>
                                            ${roomtype.numberOfBed * 2}
                                        </li>
                                        <li>
                                            <strong>Categories: </strong>
                                            ${roomtype.name}
                                        </li>
                                        <li>
                                            <strong>Facilities: </strong>
                                            Closet with hangers, HD flat-screen TV, Telephone
                                        </li>
                                        <li>
                                            <strong>Size: </strong>
                                            ${roomtype.size}m<sup>2</sup>
                                        </li>
                                        <li>
                                            <strong>Bed Type: </strong>
                                            ${roomtype.numberOfBed}
                                        </li>
                                        <li>
                                            <strong>Description: </strong>
                                            ${roomtype.description}
                                        </li>
                                    </ul>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>
    </body>
</html>
