<%-- 
    Document   : booknow
    Created on : Nov 24, 2020, 5:41:19 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LuxuryHotel a Hotel Template</title>
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

        <section class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="mb-5">Reservation Form</h2>
                        <mvc:form action="${pageContext.request.contextPath }/user/search" method="GET">
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <label for="">Checkin</label>
                                    <div style="position: relative;">
                                        <span class="fa fa-calendar icon" style="position: absolute; right: 10px; top: 10px;"></span>
                                        <input type='text' class="form-control" name="checkin" id='sdate' required="" />
                                    </div>
                                </div>

                                <div class="col-sm-6 form-group">
                                    <label for="">Checkout</label>
                                    <div style="position: relative;">
                                        <span class="fa fa-calendar icon" style="position: absolute; right: 10px; top: 10px;"></span>
                                        <input type='text' class="form-control" name="checkout" id='edate' required="" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <input type="submit" value="Reserve Now" class="btn btn-primary">
                                </div>
                            </div>
                        </mvc:form>
                    </div>
                    <div class="col-md-1"></div>
                    <div class="col-md-5">
                        <h3 class="mb-5">Featured Room</h3>
                        <div class="media d-block room mb-0">
                            <figure>
                                <img src="<c:url value="/resources/images/img_1.jpg"/>" alt="Generic placeholder image" class="img-fluid">
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
                                <h3 class="mt-0"><a href="#">Presidential Room</a></h3>
                                <ul class="room-specs">
                                    <li><span class="ion-ios-people-outline"></span> 2 Guests</li>
                                    <li><span class="ion-ios-crop"></span> 22 ft <sup>2</sup></li>
                                </ul>
                                <p>Nulla vel metus scelerisque ante sollicitudin. Fusce condimentum nunc ac nisi vulputate fringilla. </p>
                                <p><a href="#" class="btn btn-primary btn-sm">Book Now From $20</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->
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
        </section>
        <!-- END section -->
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js_page.jsp"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">

            $(function () {

                $('#sdate').datepicker({
                    dateFormat: 'dd-mm-yy',
                    altField: '#thealtdate',
                    altFormat: 'yy-mm-dd'
                });

                $('#edate').datepicker({
                    dateFormat: 'dd-mm-yy',
                    altField: '#thealtdate',
                    altFormat: 'yy-mm-dd'
                });

                $('#sdate').on('change', function () {
                    var sdate = $('#sdate').val();
                    var cdate = new Date();
                    var diff = new Date(new Date(sdate) - new Date(cdate));
                    var days = diff / 1000 / 60 / 60 / 24;
                    if (days + 1 < 0) {
                        alert("Sorry, you must choose a start date greater than the current date!");
                        $('#sdate').val('');
                    } else {

                    }
                    return false;
                });

                $('#edate').on('change', function () {
                    var sdate = $('#sdate').val();
                    var edate = $('#edate').val();
                    var diff = new Date(new Date(edate) - new Date(sdate));
                    var days = diff / 1000 / 60 / 60 / 24;
                    if (days < 0 || days > 31) {
                        alert("Sorry! You must pick an end date that is greater!");
                        $('#edate').val('');
                    } else {
                        alert(sdate + "-" + edate + "(" + days + "night" + ")");
                    }
                    return false;
                });

            });
        </script>
    </body>
</html>
