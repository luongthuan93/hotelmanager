<%-- 
    Document   : invoice-view
    Created on : Dec 7, 2020, 6:00:37 PM
    Author     : NO1
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html lang="en">
    <!-- Copied from http://radixtouch.in/templates/admin/hotel/source/invoice.html by Cyotek WebCopy 1.8.0.652, Monday, September 14, 2020, 9:06:32 AM -->
    <!-- BEGIN HEAD -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta name="description" content="Responsive Admin Template">
        <meta name="author" content="SmartUniversity">
        <title>LUXSTAY HOTEL- ADMIN DASHBOARD</title>
        <!-- icons -->
        <link href="<c:url value="/resources-management/assets/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/plugins/font-awesome/css/font-awesome.min.css"></c:url>" rel="stylesheet" type="text/css">
            <!--bootstrap -->
            <link href="<c:url value="/resources-management/assets/plugins/bootstrap/css/bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">

            <!-- Material Design Lite CSS -->
            <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/material/material.min.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/material_style.css"></c:url>">
            <!-- animation -->
            <link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"></c:url>" rel="stylesheet">
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.css"></c:url>">
            <!-- Template Styles -->
            <link href="<c:url value="/resources-management/assets/css/plugins.min.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/style.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/responsive.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/theme-color.css"></c:url>" rel="stylesheet" type="text/css">
            <!-- favicon -->
            <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
        </head>
        <!-- END HEAD -->

        <body class="page-header-fixed sidemenu-closed-hidelogo page-content-white page-md header-white dark-sidebar-color logo-dark">
            <div class="page-wrapper">
                <!-- start header -->
            <jsp:include page="../include-management/body_header.jsp"></jsp:include>
                <!-- end header -->
                <!-- start page container -->
                <div class="page-container">
                    <!-- start sidebar menu -->
                <jsp:include page="../include-management/body_menu.jsp"></jsp:include>
                    <!-- end sidebar menu -->
                    <!-- start page content -->
                    <div class="page-content-wrapper">
                        <div class="page-content">
                            <div class="page-bar">
                                <div class="page-title-breadcrumb">
                                    <div class=" pull-left">
                                        <div class="page-title">Invoice</div>
                                    </div>
                                    
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        <li><a class="parent-item" href="">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Invoice</li>
                                    </ol>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="white-box">
                                        <h3><b>INVOICE</b> <span class="pull-right">#${bookingOut.bookingNumber}</span></h3>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="pull-left">
                                                <address>
                                                    <img src="<c:url value="/resources-management/assets/img/invoice_logo.png"></c:url>" alt="logo" class="logo-default">
                                                        <p class="text-muted m-l-5">
                                                            LUXSTAY Hotel, <br> Opp. Town Hall, <br>
                                                            Sardar Patel Road, <br> Ahmedabad - 380015
                                                        </p>
                                                    </address>
                                                </div>
                                                <div class="pull-right text-right">
                                                    <address>
                                                        <p class="addr-font-h3">To,</p>
                                                        <p class="font-bold addr-font-h4">${bookingOut.fullName}</p>
                                                    <p class="text-muted m-l-30">
                                                        ${bookingOut.address}
                                                    </p>
                                                    <p class="m-t-30">
                                                        <b>Invoice Date :</b> <i class="fa fa-calendar"></i> ${today}
                                                        <br>
                                                        <b>Stay Time :</b> <i class="fa fa-clock-o"></i> ${stayDays} days
                                                    </p>
                                                </address>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="table-responsive m-t-40">
                                                <table class="table table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="text-center">#</th>
                                                            <th class="text-center">Check-in Date</th>
                                                            <th class="text-center">Check-out Date</th>
                                                            <th class="text-center">Descriptions</th>
                                                            <th class="text-center">Charges</th>
                                                            <th class="text-center">Discount</th>

                                                            <th class="text-right">Amount</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:set var="total" value="0"></c:set>
                                                        <c:forEach items="${bookingOut.bookingDetails}" var="bd" varStatus="status">
                                                            <tr>
                                                                <td class="text-center">${status.count}</td>
                                                                <td class="text-center">${bookingOut.checkin}</td>
                                                                <td class="text-center">${bookingOut.checkout}</td>
                                                                <td class="text-center">${bd.room.roomNumber} - ${bd.room.roomType.name}</td>
                                                                <td class="text-center">${bd.price} USD</td>
                                                                <td class="text-center">${bd.discount} %</td>                                                                                                            
                                                                <td class="text-right">${bd.price*stayDays*(100-bd.discount)/100} USD</td>
                                                            </tr>
                                                            <c:set var="total" value="${total+(bd.price*stayDays*(100-bd.discount)/100)}"></c:set>
                                                            <c:forEach items="${bd.services}" var="s" varStatus="sc">
                                                                <tr>
                                                                    <td class="text-center">s-${sc.count}</td>
                                                                    <td class="text-center"></td>
                                                                    <td class="text-center"></td>
                                                                    <td class="text-center">${s.name}</td>
                                                                    <td class="text-center">${s.amount} USD</td>
                                                                    <td class="text-center">${bd.discount} %</td>
                                                                    <td class="text-right">${s.amount*(100-bd.discount)/100} USD</td>
                                                                </tr>
                                                                <c:set var="total" value="${total+(s.amount*(100-bd.discount)/100)}"></c:set>
                                                            </c:forEach>

                                                        </c:forEach>


                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="pull-right m-t-30 text-right">

                                                <p>Booking paid: - $${bookOrderPay}</p>
                                                <hr>
                                                <c:set var="total" value="${total-bookOrderPay}"></c:set>
                                                <h3><b>Total :</b> ${total} USD</h3>
                                            </div>
                                            <div class="clearfix"></div>
                                            <hr>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="page-bar">
                            <div class="text-right">
                                <c:if test="${total==0 && bookingOut.status != 'COMPLETE'}">
                                    <a class="btn deepPink-bgcolor  btn-outline" href="${pageContext.request.contextPath}/admin/complete-booking-zero/${bookingOut.id}">Complete Booking
                                        <i class="fa fa-check-circle-o"></i>
                                    </a>
                                </c:if>
<!--                                <a class="btn btn-danger" href=""> Proceed to payment </a>-->
                                <c:if test="${bookingOut.status != 'COMPLETE' && total > 0}">
                                    

                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                                        Proceed to payment
                                    </button>
                                </c:if>
                                <button onclick="javascript:window.print();" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
                            </div>
                            <div>


                                <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalCenterTitle"> Payment for amount of <strong> ${total} USD </strong> </h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="card-box">
                                                    <div class="card-head">
                                                        <header>Choose your payment method: </header>
                                                    </div>
                                                    <div class="card-body ">
                                                        <div class="mdl-tabs mdl-js-tabs">
                                                            <div class="mdl-tabs__tab-bar tab-left-side">
                                                                <a href="#tab4-panel" class="mdl-tabs__tab is-active">Credit Card</a>
                                                                <a href="#tab5-panel" class="mdl-tabs__tab">Cash</a>
                                                            </div>
                                                            <div class="mdl-tabs__panel is-active p-t-20" id="tab4-panel">
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/payment-card" method="POST" modelAttribute="creditCard">
                                                                    
                                                                
                                                                    <div class="form-group">
                                                                        <label for="namecard">Full name</label>
                                                                        <input type="text" class="form-control" id="namecard" placeholder="Enter Name on Card" name="name" required="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="CardNumber">Card Number</label>
                                                                        <input type="number" class="form-control" id="CardNumber" placeholder="Card Number" name="number" required="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="expirationDate">Expiration Date</label>
                                                                        <input type="month" class="form-control" id="expirationDate" placeholder="MM/YYYY" minlength="5" maxlength="5" name="expDate" required="">
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label for="simpleFormPassword">CCV</label>
                                                                        <input type="number" class="form-control" id="simpleFormPassword" minlength="3" maxlength="3" name="ccvCode" required="">
                                                                    </div>
                                                                    <input hidden="" type="number" name="balance" value="${total}">
                                                                    <input hidden="" type="number" name="id" value="${bookingOut.id}">
                                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                                
                                                                </mvc:form>

                                                            </div>
                                                            <div class="mdl-tabs__panel p-t-20" id="tab5-panel">
                                                                <mvc:form action="${pageContext.request.contextPath}/admin/payment-cash" method="POST">
                                                                    <p> Pay All by Cash : <strong> ${total} USD </strong> </p>
                                                                    <input hidden="" name="cashtotal" value="${total}">
                                                                    <input hidden="" name="bookingidcash" value="${bookingOut.id}">
                                                                    <button class="btn blue-bgcolor" type="submit"> Confirm Cash Payment </button>
                                                                </mvc:form>
                                                                
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                                            


                    </div>
                </div>
                <!-- end page content -->
                <!-- start chat sidebar -->
                <jsp:include page="../include-management/body_chat_sidebar.jsp"></jsp:include>
                    <!-- end chat sidebar -->
                </div>
                <!-- end page container -->
                <!-- start footer -->
            <jsp:include page="../include-management/body_footer.jsp"></jsp:include>
                <!-- end footer -->
            </div>
            <!-- start js include path -->
            <script>
                var url_string = window.location.href;
                var url = new URL(url_string);                
                var message = url.searchParams.get("message");;
//                console.log(message);
                if(message.length > 1){
                    if(message != 'Payment Successful'){
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',
                            icon: 'error',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }else{
                        window.onload = function() {
                            $.toast({
                            heading: 'Message From System',
                            text: message,
                            position: 'top-center',
                            loaderBg:'#ff6849',
                            icon: 'success',
                            hideAfter: 6000, 
                            stack: 6
                          });
                        };
                    }
            };
            </script>
            <script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
            <!-- bootstrap -->
            <script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
            <!-- notifications -->
            <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/jquery.toast.min.js"></c:url>"></script>
            <script src="<c:url value="/resources-management/assets/plugins/jquery-toast/dist/toast.js"></c:url>"></script>
            <!-- Common js-->
            <script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
            <script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
            <script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
            <!-- material -->
            <script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
            <!-- animation -->
            <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>

        <!-- end js include path -->
    </body>

    <!-- Copied from http://radixtouch.in/templates/admin/hotel/source/invoice.html by Cyotek WebCopy 1.8.0.652, Monday, September 14, 2020, 9:06:32 AM -->
</html>