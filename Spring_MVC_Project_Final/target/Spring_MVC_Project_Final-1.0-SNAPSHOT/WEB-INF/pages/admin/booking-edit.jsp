<%-- 
    Document   : booking-form
    Created on : Dec 2, 2020, 7:21:25 PM
    Author     : NO1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html lang="en">
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
            <!-- data tables -->
            <link href="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.css"></c:url>" rel="stylesheet" type="text/css">
            <!-- animation -->
            <link href="<c:url value="/resources-management/assets/css/pages/animate_page.css"></c:url>" rel="stylesheet">
            <!-- Template Styles -->
            <link href="<c:url value="/resources-management/assets/css/plugins.min.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/style.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/responsive.css"></c:url>" rel="stylesheet" type="text/css">
        <link href="<c:url value="/resources-management/assets/css/theme-color.css"></c:url>" rel="stylesheet" type="text/css">
            <!-- favicon -->
            <link rel="shortcut icon" href="<c:url value="/resources-management/assets/img/favicon.ico"></c:url>">
            <!-- dropzone -->
            <link href="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.css"/>" rel="stylesheet" media="screen">
        <!-- Date Time item CSS -->
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.css"/>">
         <!--select2-->
    <link href="<c:url value="/resources-management/assets/plugins/select2/css/select2.css"></c:url>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources-management/assets/plugins/select2/css/select2-bootstrap.min.css"></c:url>" rel="stylesheet" type="text/css">
    <style>
        .dollar{
            display:inline-block;
            position: relative;
        }
        .dollar input{
            padding-left:15px;
        }
        .dollar:before {
            position: absolute;
            content:"$";
            left:4px;
            top:3px;
        }
    </style>
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
                    <div class="page-content-wrapper" >
                        <div class="page-content" >
                            <div class="page-bar">
                                <div class="page-title-breadcrumb">
                                    <div class=" pull-left">
                                        <div class="page-title">Booking Detail</div>
                                    </div>
                                    <ol class="breadcrumb page-breadcrumb pull-right">
                                        <li><i class="fa fa-home"></i>&nbsp;<a class="parent-item" href="${pageContext.request.contextPath}/admin/home">Home</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li><a class="parent-item" href="">Booking</a>&nbsp;<i class="fa fa-angle-right"></i>
                                        </li>
                                        <li class="active">Edit Booking</li>
                                    </ol>
                                </div>
                            </div>
                            
                            


                            <div class="row">
                                
                                <div class="col-sm-12">
                                    
                                    <div class="card-box">
                                        
                                        <div class="card-head">
                                            <header>Info Booking #${bookingUpdate.bookingNumber}</header>
                                        <button id="panel-button" class="mdl-button mdl-js-button mdl-button--icon pull-right" data-upgraded=",MaterialButton">
                                            <i class="material-icons">more_vert</i>
                                        </button>
                                        <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" data-mdl-for="panel-button">
                                            <li class="mdl-menu__item"><i class="material-icons">assistant_photo</i>Action
                                            </li>
                                            <li class="mdl-menu__item"><i class="material-icons">print</i>Another action
                                            </li>
                                            <li class="mdl-menu__item"><i class="material-icons">favorite</i>Something else
                                                here</li>
                                        </ul>
                                    </div>
                                    
                                        <div class="card-body row">
                                            
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="date" value="${bookingUpdate.checkin}" name="checkin">
                                                    <label class="mdl-textfield__label">Arrive</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="date" value="${bookingUpdate.checkout}" name="checkout">
                                                    <label class="mdl-textfield__label">Depart</label>
                                                </div>
                                            </div>

                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="text" id="txtFirstName" value="${bookingUpdate.fullName}" name="fullName">
                                                    <label class="mdl-textfield__label">Full Name</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="text" id="txtLasttName" readonly="" value="${bookingUpdate.cardId}" name="cardId">
                                                    <label class="mdl-textfield__label">Card Id</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="email" id="txtemail" value="${bookingUpdate.email}" name="email">
                                                    <label class="mdl-textfield__label">Email</label>
                                                    <span class="mdl-textfield__error">Enter Valid Email Address!</span>
                                                    
                                                </div>
                                            </div>
<!--                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <select class="mdl-textfield__input" type="text" id="sample2" readonly="" tabindex="-1" name="gender" style=" height: 43px; ">
                                                        <c:if test="${bookingUpdate.gender == 'MALE'}">
                                                            <option class="mdl-menu__item" value="MALE" selected="">MALE</option>
                                                            <option class="mdl-menu__item" value="FEMALE" >FEMALE</option>
                                                        </c:if>
                                                        <c:if test="${bookingUpdate.gender == 'FEMALE'}">
                                                            <option class="mdl-menu__item" value="MALE" >MALE</option>
                                                            <option class="mdl-menu__item" value="FEMALE" selected="">FEMALE</option>
                                                        </c:if>
                                                    </select>

                                                    <label for="sample2" class="mdl-textfield__label">Gender</label>
                                                </div>
                                            </div>-->
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="text5" value="${bookingUpdate.phone}" name="phone">
                                                    <label class="mdl-textfield__label" for="text5">Mobile Number</label>
                                                    <span class="mdl-textfield__error">Number required!</span>
                                                </div>
                                            </div>

                                            <!--									<div class="col-lg-6 p-t-20">
                                                                                                                            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                                                                                                <input class="mdl-textfield__input" type="date" value="${bookingUpdate.birthDate}" name="birthDate">
                                                                                                                                    <label class="mdl-textfield__label">Birth Date</label>
                                                                                                                            </div>
                                                                                                                    </div>-->
                                            
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <input class="mdl-textfield__input" type="date" readonly="" value="${bookingUpdate.bookingDate}" name="bookingDate">
                                                    <label class="mdl-textfield__label">Booking Date</label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <select class="mdl-textfield__input" type="text" id="sample2" readonly="" tabindex="-1" name="status" style=" height: 43px; ">
                                                        <c:if test="${bookingUpdate.status == 'BOOKED'}">
                                                            <option class="mdl-menu__item" value="BOOKED" selected="">BOOKED</option>
                                                        </c:if>    
                                                        <c:if test="${bookingUpdate.status == 'CHECK_IN'}">
                                                            
                                                            <option class="mdl-menu__item" value="CHECK_IN" selected="">CHECK_IN</option>
                                                            
                                                        </c:if>
                                                        <c:if test="${bookingUpdate.status == 'CHECK_OUT'}">
                                                            
                                                            <option class="mdl-menu__item" value="CHECK_IN" selected="">CHECK_OUT</option>
                                                           
                                                        </c:if>
                                                        <c:if test="${bookingUpdate.status == 'CANCEL'}">
                                                            
                                                            <option class="mdl-menu__item" value="CANCEL" selected="">CANCEL</option>
                                                        </c:if>
                                                        <c:if test="${bookingUpdate.status == 'COMPLETE'}">
                                                            
                                                            <option class="mdl-menu__item" value="COMPLETE" selected="">COMPLETE</option>
                                                        </c:if>
                                                    </select>

                                                    <label for="sample2" class="mdl-textfield__label">Booking Status </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label txt-full-width">
                                                    <div class="dollar"><input class="mdl-textfield__input" type="number" value="${bookingUpdate.totalPrice}" name="totalPrice"></div>
                                                    <label class="mdl-textfield__label">Total Price</label>
                                                </div>
                                            </div>
<!--                                            <div class="col-lg-6 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <input class="mdl-textfield__input" type="number" id="txtLasttName" readonly="" value="${bookingUpdate.id}" name="id">
                                                    <label class="mdl-textfield__label">Booking #id</label>
                                                </div>
                                            </div>-->
<!--                                            <div class="col-lg-12 p-t-20">
                                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height txt-full-width">
                                                    <textarea class="mdl-textfield__input" rows="4" id="text7"  name="address">${bookingUpdate.address}</textarea>
                                                    <label class="mdl-textfield__label" for="text7">Address</label>
                                                </div>
                                            </div>-->


                                            <!--									<div class="col-lg-12 p-t-20 text-center">
                                                                                                                            <button type="submit" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 m-r-20 btn-pink">Submit</button>
                                                                                                                            <button type="reset" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect m-b-10 btn-default">Cancel</button>
                                                                                                                    </div>-->
                                        </div>
                                    
                                </div>
                            </div>
                        
                       
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-head">
                                        <header>Booking Room</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">

                                            </div>
                                            <div class="col-md-6 col-sm-6 col-6">
                                                
                                            </div>
                                        </div>
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>
                                                        <th class="center">No.</th>
                                                        <th class="center"> room </th>
                                                        <th class="center"> price </th>
                                                        <th class="center"> discount </th>
                                                        <th class="center"> services</th>
                                                        <th class="center"> Unit Cost</th>
                                                        <th class="center"> Action </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookingUpdate.bookingDetails}" var="bd" varStatus="status">
                                                        <tr class="odd gradeX">
                                                            <td class="center">${status.count}</td>
                                                            <td class="center">${bd.room.roomNumber}</td>

                                                            <td class="center">${bd.price} USD</td>
                                                            <td class="center">${bd.discount} %</td>

                                                            <td class="center">
                                                                <span>${bd.services.size()} Services </span>
                                                                
                                                                    <!-- Button trigger modal -->
                                                                    <button type="button" class="btn btn-circle btn-info" data-toggle="modal" data-target="#exampleModalScrollable${status.count}">
                                                                      More Details
                                                                    </button>
                                                                    <div class="modal fade" id="exampleModalScrollable${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                                                        <div class="modal-dialog" role="document">
                                                                          <div class="modal-content">
                                                                            <div class="modal-header">
                                                                              <h5 class="modal-title" id="exampleModalScrollableTitle">Services</h5>
                                                                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                              </button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="borderBox light bordered card-box">
                                                                                    <div class="borderBox-title tabbable-line">
                                                                                        <div class="caption">
                                                                                            <span class="caption-subject font-dark bold uppercase"></span>
                                                                                        </div>
                                                                                        <ul class="nav nav-tabs">
                                                                                            <c:if test="${bookingUpdate.status == 'BOOKED' || bookingUpdate.status == 'CHECK_IN'}">
                                                                                               <li class="nav-item">
                                                                                                <a href="#borderBox_tab3${bd.id}" data-toggle="tab"> Multiple Select </a>
                                                                                                </li> 
                                                                                            </c:if>
                                                                                            
                                                                                            <li class="nav-item">
                                                                                                <a href="#borderBox_tab2${bd.id}" data-toggle="tab"> List Services </a>
                                                                                            </li>
                                                                                            <li class="nav-item">
                                                                                                <a href="#borderBox_tab1${bd.id}" data-toggle="tab" class="active"> View </a>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                    <div class="borderBox-body">
                                                                                        <div class="tab-content">
                                                                                            <div class="tab-pane active" id="borderBox_tab1${bd.id}">
                                                                                                <table class="table table-bordered">
                                                                                                    <thead>
                                                                                                        <tr>
                                                                                                            <th scope="col">No.</th>
                                                                                                            <th scope="col">Service</th>
                                                                                                            <th scope="col">Price</th>
                                                                                                            <th scope="col">Action</th>
                                                                                                        </tr>
                                                                                                    
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                        <c:set var="totalServiceCost" value="0"></c:set>
                                                                                                        <c:forEach items="${bd.services}" var="s" varStatus="status">
                                                                                                            <tr>
                                                                                                                <td scope="row">${status.count}</td>
                                                                                                                <td scope="row">${s.name}</td>
                                                                                                                <td scope="row">${s.amount} USD</td>
                                                                                                                <td>
                                                                                                                    <c:if test="${bookingUpdate.status == 'BOOKED' || bookingUpdate.status == 'CHECK_IN'}">
                                                                                                                    <a href="<c:url value="/admin/delete-booking-service/${bd.id}/${s.id}"></c:url>" class="btn btn-tbl-delete btn-xs">
                                                                                                                        <i class="fa fa-trash-o "></i>
                                                                                                                    </a>
                                                                                                                    </c:if>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <c:set var="totalServiceCost" value="${totalServiceCost+s.amount}"></c:set>
                                                                                                        </c:forEach>
                                                                                                            <tr>
                                                                                                                <td scope="row" colspan="2">Total Price</td>
                                                                                                                <td scope="row">${totalServiceCost} USD</td>
                                                                                                                <td scope="row"></td>
                                                                                                            </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                                
                                                                                            </div>
                                                                                            <div class="tab-pane" id="borderBox_tab2${bd.id}">
                                                                                                <table class="table">                                                                                      
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <th scope="col">No.</th>
                                                                                                        <th scope="col">Service</th>
                                                                                                        <th scope="col">Price</th>
                                                                                                        
                                                                                                    </tr>

                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <c:forEach items="${Services}" var="s" varStatus="status">
                                                                                                        <tr>
                                                                                                            <td scope="row">${status.count}</td>
                                                                                                            <td scope="row">${s.name}</td>
                                                                                                            <td scope="row">${s.amount} USD</td>
                                                                                                            
                                                                                                        </tr>
                                                                                                    </c:forEach>
                                                                                                </tbody>
                                                                                                </table>
                                                                                            </div>
                                                                                            <div class="tab-pane" id="borderBox_tab3${bd.id}">
                                                                                                
                                                                                                
                                                                                                    
                                                                                                <mvc:form action="${pageContext.request.contextPath}/admin/add-booking-service/${bd.id}" method="POST">
                                                                                                    
                                                                                                     
                                                                                                <div class="form-group row">
                                                                                                    <label class="col-lg-3 col-md-4 control-label">Multiple Select
                                                                                                    </label>
                                                                                                    <div class="col-lg-9 col-md-8" >
                                                                                                        <select id="multiple" class="form-control select2-multiple" multiple="" style="width: 250px;" name="addservices" required="">
                                                                                                            <optgroup label="Service">
                                                                                                                <c:forEach items="${Services}" var="s" varStatus="status">
                                                                                                                    <c:set var="temp" value="0"></c:set>
                                                                                                                    <c:forEach items="${bd.services}" var="dbs">
                                                                                                                        <c:if test="${s.id == dbs.id}">
                                                                                                                            <c:set var="temp" value="1"></c:set>
                                                                                                                        </c:if>
                                                                                                                    </c:forEach>
                                                                                                                    <c:if test="${temp == 0}">
                                                                                                                    <option value="${s.id}">${s.name} -- ${s.amount} USD</option>   
                                                                                                                    </c:if>
                                                                                                                                                                                                                                        
                                                                                                                </c:forEach>
                                                                                                                
                                                                                                            </optgroup>                                                                                          
                                                                                                        </select>
                                                                                                    </div>
                                                                                                </div>
                                                                                                    <button type="submit" class="btn btn-primary">Add Service</button>
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
                                                                    
                                                                    
                                                                
                                                                                                                                
                                                            </td>
                                                            <td class="center">${bd.price*(1-bd.discount/100)+totalServiceCost} USD</td>
                                                            <td class="center">
<!--                                                                <a href="edit-booking-detail/${b.id}" class="btn btn-tbl-edit btn-xs">
                                                                    <i class="fa fa-pencil"></i>
                                                                </a>-->
                                                                <c:if test="${bookingUpdate.status == 'BOOKED'}">
                                                                   <a href="delete-booking-detail/${bookingUpdate.id}/${bd.id}"class="btn btn-tbl-delete btn-xs">
                                                                    <i class="fa fa-trash-o "></i>
                                                                   </a> 
                                                                </c:if>
                                                                
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        
                        
                            <div class="col-md-12">
                                <div class="card card-box">
                                    <div class="card-head">
                                        <header>Payment</header>
                                        <div class="tools">
                                            <a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
                                            <a class="t-collapse btn-color fa fa-chevron-down" href="javascript:;"></a>
                                            <a class="t-close btn-color fa fa-times" href="javascript:;"></a>
                                        </div>
                                    </div>
                                    <div class="card-body ">
                                        <div class="row p-b-20">
                                            <div class="col-md-6 col-sm-6 col-6">

                                            </div>
                                            <div class="col-md-6 col-sm-6 col-6">
                                               
                                            </div>
                                        </div>
                                        <div class="table-scrollable">
                                            <table class="table table-hover table-checkable order-column full-width" id="example4">
                                                <thead>
                                                    <tr>
                                                        <th class="center">No.</th>
                                                        <th class="center"> method </th>
                                                        <th class="center"> paymentDate </th>
                                                        <th class="center"> amount </th>
                                                        <th class="center"> creditCard </th>
                                                        <th class="center"> status</th>

                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${bookingUpdatePayments}" var="p" varStatus="status">

                                                        <tr class="odd gradeX">
                                                            <td class="center">${status.count}</td>
                                                            <td class="center">${p.method}</td>													
                                                            <td class="center">${p.paymentDate}</td>
                                                            <td class="center">${p.amount} USD</td>
                                                            <td class="center">${p.creditCard.number}</td>

                                                            <td class="center">
                                                                <span class="label label-sm label-success">${p.status}</span>
                                                            </td>
                                                            
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
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
            

            <script src="<c:url value="/resources-management/assets/plugins/jquery/jquery.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/popper/popper.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-blockui/jquery.blockui.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>"></script>
            <!-- bootstrap -->
            <script src="<c:url value="/resources-management/assets/plugins/bootstrap/js/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/sparkline/jquery.sparkline.min.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/sparkline/sparkline-data.js"/>"></script>
        <!-- Common js-->
        <script src="<c:url value="/resources-management/assets/js/app.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/layout.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/theme-color.js"></c:url>"></script>
            <!-- data tables -->
            <script src="<c:url value="/resources-management/assets/plugins/datatables/jquery.dataTables.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/datatables/plugins/bootstrap/dataTables.bootstrap4.min.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/table/table_data.js"></c:url>"></script>
            <!-- material -->
            <script src="<c:url value="/resources-management/assets/plugins/material/material.min.js"></c:url>"></script>
            <!-- animation -->
            <script src="<c:url value="/resources-management/assets/js/pages/ui/animations.js"></c:url>"></script>


            <!-- dropzone -->
            <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/plugins/dropzone/dropzone-call.js"/>"></script>
        <!-- date and time 	 -->
        <script src="<c:url value="/resources-management/assets/plugins/flatpicker/flatpickr.min.js"/>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/datetime/datetime-data.js"/>"></script>
        <!--select2-->
        <script src="<c:url value="/resources-management/assets/plugins/select2/js/select2.js"></c:url>"></script>
        <script src="<c:url value="/resources-management/assets/js/pages/select2/select2-init.js"></c:url>"></script>
        <!-- end js include path -->
    </body>

</html>