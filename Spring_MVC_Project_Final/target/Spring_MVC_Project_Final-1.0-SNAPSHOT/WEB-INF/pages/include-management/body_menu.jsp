<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- start sidebar menu -->
			<div class="sidebar-container">
				<div class="sidemenu-container navbar-collapse collapse fixed-menu">
					<div id="remove-scroll">
						<ul class="sidemenu page-header-fixed p-t-20" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
							<li class="sidebar-toggler-wrapper hide">
								<div class="sidebar-toggler">
									<span></span>
								</div>
							</li>
							<li class="sidebar-user-panel">
								<div class="user-panel">
									<div class="row">
										<div class="sidebar-userpic">
                                                                                    <img src="<c:url value="/resources-management/assets/img/dp.jpg"></c:url>" class="img-responsive" alt=""> </div>
									</div>
									<div class="profile-usertitle">
										<div class="sidebar-userpic-name"> ${adminUser} </div>
										<div class="profile-usertitle-job"> Manager </div>
									</div>
									<div class="sidebar-userpic-btn">
										<a class="tooltips" href="" data-placement="top" data-original-title="Profile">
											<i class="material-icons">person_outline</i>
										</a>
										<a class="tooltips" href="" data-placement="top" data-original-title="Mail">
											<i class="material-icons">mail_outline</i>
										</a>
										<a class="tooltips" href="" data-placement="top" data-original-title="Chat">
											<i class="material-icons">chat</i>
										</a>
										<a class="tooltips" href="<c:url value="/logout"/>" data-placement="top" data-original-title="Logout">
											<i class="material-icons">input</i>
										</a>
									</div>
								</div>
							</li>
							<li class="menu-heading">
								<span>-- Main</span>
							</li>
                                                        
							<li class="nav-item <c:if test="${menu == 'Dashboard'}"> start active </c:if>" >
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">dashboard</i>
									<span class="title">Dashboard</span>
                                                                        <c:if test="${menu == 'Dashboard'}">
									<span class="selected"></span>
                                                                        </c:if>
									<span class="arrow <c:if test="${menu == 'Dashboard'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									<li class="nav-item <c:if test="${submenu == 'Hotel Business'}"> active</c:if>">
										<a href="<c:url value="/admin/home"/>" class="nav-link ">
											<span class="title">Hotel Business</span>
                                                                                    <c:if test="${submenu == 'Hotel Business'}">
											<span class="selected"></span>
                                                                                    </c:if>
										</a>
									</li>
									<li class="nav-item <c:if test="${submenu == 'Account Dashboard'}"> active</c:if>">
										<a href="<c:url value="/admin/home2"/>" class="nav-link ">
											<span class="title">Account Dashboard</span>
                                                                                        <c:if test="${submenu == 'Account Dashboard'}">
											<span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item <c:if test="${menu == 'Booking Management'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">business_center</i>
									<span class="title">Booking Management</span>
									<c:if test="${menu == 'Booking Management'}">
									<span class="selected"></span>
                                                                        </c:if>
									<span class="arrow <c:if test="${menu == 'Booking Management'}"> open </c:if>"></span>
									<span class="label label-rouded label-menu label-danger">new</span>
								</a>
								<ul class="sub-menu">
									<li class="nav-item <c:if test="${submenu == 'View Booking'}"> active</c:if>">
										<a href="<c:url value="/admin/view-booking"/>"  class="nav-link ">
											<span class="title">View Booking</span>
                                                                                        <c:if test="${submenu == 'View Booking'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
									<li class="nav-item <c:if test="${submenu == 'Check In'}"> active</c:if>">
                                                                            <a href="<c:url value="/admin/check-in"></c:url>" class="nav-link ">
											<span class="title">Check In</span>
                                                                                        <c:if test="${submenu == 'Check In'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
									<li class="nav-item <c:if test="${submenu == 'Check Out'}"> active</c:if>">
										<a href="<c:url value="/admin/check-out"></c:url>" class="nav-link ">
											<span class="title">Check Out</span>
                                                                                        <c:if test="${submenu == 'Check Out'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
							<li class="nav-item <c:if test="${menu == 'Room Type Manage'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">local_hotel</i>
									<span class="title">Room Type Manage</span>
									<c:if test="${menu == 'Room Type Manage'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Room Type Manage'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									<li class="nav-item <c:if test="${submenu == 'View Room Type'}"> active</c:if>">
                                                                    <a href="<c:url value="/admin/view-roomtype"></c:url>" class="nav-link ">
											<span class="title">View Room Type</span>
                                                                                        <c:if test="${submenu == 'View Room Type'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
									<li class="nav-item <c:if test="${submenu == 'Add Room Type'}"> active</c:if>">
										<a href="<c:url value="/admin/add-roomtype"></c:url>" class="nav-link ">
											<span class="title">Add Room Type</span>
                                                                                        <c:if test="${submenu == 'Add Room Type'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
									
								</ul>
							</li>
							<li class="nav-item <c:if test="${menu == 'Rooms'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">vpn_key</i>
									<span class="title">Rooms</span>
									<c:if test="${menu == 'Rooms'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Rooms'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View All Rooms'}"> active</c:if>">
										<a href="<c:url value="/admin/view-room"></c:url>" class="nav-link ">
											<span class="title">View All Rooms</span>
                                                                                        <c:if test="${submenu == 'View All Rooms'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        <li class="nav-item <c:if test="${submenu == 'Add Room Details'}"> active</c:if>">
										<a href="<c:url value="/admin/add-room"></c:url>" class="nav-link ">
											<span class="title">Add Room Details</span>
                                                                                        <c:if test="${submenu == 'Add Room Details'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
                                                        <li class="nav-item <c:if test="${menu == 'Services'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">local_bar</i>
									<span class="title">Services</span>
									<c:if test="${menu == 'Services'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Services'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View All Services'}"> active</c:if>">
										<a href="<c:url value="/admin/view-service"></c:url>" class="nav-link ">
											<span class="title">View All Services </span>
                                                                                        <c:if test="${submenu == 'View All Services'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        <li class="nav-item <c:if test="${submenu == 'Add Service'}"> active</c:if>">
										<a href="<c:url value="/admin/add-service"></c:url>" class="nav-link ">
											<span class="title">Add Service</span>
                                                                                        <c:if test="${submenu == 'Add Service'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
                                                        <li class="nav-item <c:if test="${menu == 'Convenient'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">wifi</i>
									<span class="title">Convenient </span>
									<c:if test="${menu == 'Convenient'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Convenient'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View All Convenient'}"> active</c:if>">
										<a href="<c:url value="/admin/view-convenient"></c:url>" class="nav-link ">
											<span class="title">View All Convenient</span>
                                                                                        <c:if test="${submenu == 'View All Convenient'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        <li class="nav-item <c:if test="${submenu == 'Add Convenient'}"> active</c:if>">
										<a href="<c:url value="/admin/add-convenient"></c:url>" class="nav-link ">
											<span class="title">Add Convenient</span>
                                                                                        <c:if test="${submenu == 'Add Convenient'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
                                                        <li class="nav-item <c:if test="${menu == 'Promotions'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">card_giftcard</i>
									<span class="title">Promotions</span>
									<c:if test="${menu == 'Promotions'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Promotions'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View All Promotions'}"> active</c:if>">
										<a href="<c:url value="/admin/view-promotion"></c:url>" class="nav-link ">
											<span class="title">View All Promotions </span>
                                                                                        <c:if test="${submenu == 'View All Promotions'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        <li class="nav-item <c:if test="${submenu == 'Add Promotion'}"> active</c:if>">
										<a href="<c:url value="/admin/add-promotion"></c:url>" class="nav-link ">
											<span class="title">Add Promotion</span>
                                                                                        <c:if test="${submenu == 'Add Promotion'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
								</ul>
							</li>
                                                        
                                                        
                                                        <li class="nav-item <c:if test="${menu == 'Comment and Vote'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">message</i>
									<span class="title">Comment and Vote </span>
									<c:if test="${menu == 'Comment and Vote'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Comment and Vote'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View Comment and Vote'}"> active</c:if>">
										<a href="<c:url value="/admin/view-comment"></c:url>" class="nav-link ">
											<span class="title">View Comment and Vote</span>
                                                                                        <c:if test="${submenu == 'View Comment and Vote'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        
								</ul>
							</li>
                                                        
                                                        <li class="nav-item <c:if test="${menu == 'Payment'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">payment</i>
									<span class="title">Payment Management </span>
									<c:if test="${menu == 'Payment'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Payment'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View All Payments'}"> active</c:if>">
										<a href="<c:url value="/admin/view-payment"></c:url>" class="nav-link ">
											<span class="title">View All Payments</span>
                                                                                        <c:if test="${submenu == 'View All Payments'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        
								</ul>
							</li>
							
							<li class="nav-item <c:if test="${menu == 'Account Management'}"> start active </c:if>">
								<a href="#" class="nav-link nav-toggle">
									<i class="material-icons">account_box</i>
									<span class="title">Account Management</span>
									<c:if test="${menu == 'Account Management'}">
                                                                        <span class="selected"></span>
                                                                        </c:if>
                                                                        <span class="arrow <c:if test="${menu == 'Account Management'}"> open </c:if>"></span>
								</a>
								<ul class="sub-menu">
									
									<li class="nav-item <c:if test="${submenu == 'View Account'}"> active</c:if>">
										<a href="<c:url value="/admin/view-account"></c:url>" class="nav-link ">
											<span class="title">View Account</span>
                                                                                        <c:if test="${submenu == 'View Account'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
                                                                        <li class="nav-item <c:if test="${submenu == 'Add Account'}"> active</c:if>">
										<a href="<c:url value="/admin/add-account"></c:url>" class="nav-link ">
											<span class="title">Add Account</span>
                                                                                        <c:if test="${submenu == 'Add Account'}">
                                                                                            <span class="selected"></span>
                                                                                        </c:if>
										</a>
									</li>
                                                                        
								</ul>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
			<!-- end sidebar menu -->