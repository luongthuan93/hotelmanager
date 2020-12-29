<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                <img src="<c:url value="/resources-management/assets/img/dp.jpg"/>" class="img-responsive" alt=""> 
                            </div>
                        </div>
                        <div class="profile-usertitle">
                            <div class="sidebar-userpic-name"> John Deo </div>
                            <div class="profile-usertitle-job"> Manager </div>
                        </div>
                        <div class="sidebar-userpic-btn">
                            <a class="tooltips" href="user_profile.html" data-placement="top" data-original-title="Profile">
                                <i class="material-icons">person_outline</i>
                            </a>
                            <a class="tooltips" href="email_inbox.html" data-placement="top" data-original-title="Mail">
                                <i class="material-icons">mail_outline</i>
                            </a>
                            <a class="tooltips" href="chat.html" data-placement="top" data-original-title="Chat">
                                <i class="material-icons">chat</i>
                            </a>
                            <a class="tooltips" href="login.html" data-placement="top" data-original-title="Logout">
                                <i class="material-icons">input</i>
                            </a>
                        </div>
                    </div>
                </li>
                
                <li class="nav-item start active">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">dashboard</i>
                        <span class="title">Dashboard</span>
                        <span class="selected"></span>
                        <span class="arrow open"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item active">
                            <a href="index.html" class="nav-link ">
                                <span class="title">Dashboard 1</span>
                                <span class="selected"></span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="dashboard2.html" class="nav-link ">
                                <span class="title">Dashboard 2</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">email</i>
                        <span class="title">Email</span>
                        <span class="arrow"></span>
                        <span class="label label-rouded label-menu label-danger">new</span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="email_inbox.html" class="nav-link ">
                                <span class="title">Inbox</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="email_view.html" class="nav-link ">
                                <span class="title">View Mail</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="email_compose.html" class="nav-link ">
                                <span class="title">Compose Mail</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">business_center</i>
                        <span class="title">Booking</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="new_booking.html" class="nav-link ">
                                <span class="title">New Booking</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="view_booking.html" class="nav-link ">
                                <span class="title">View Booking</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="edit_booking.html" class="nav-link ">
                                <span class="title">Edit Booking</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">vpn_key</i>
                        <span class="title">Rooms</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="add_room.html" class="nav-link ">
                                <span class="title">Add Room Details</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="all_rooms.html" class="nav-link ">
                                <span class="title">View All Rooms</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="edit_room.html" class="nav-link ">
                                <span class="title">Edit Room Details</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link nav-toggle">
                        <i class="material-icons">group</i>
                        <span class="title">User Manage</span>
                        <span class="arrow"></span>
                    </a>
                    <ul class="sub-menu">
                        <li class="nav-item">
                            <a href="<c:url value="/admin/form-user"/>" class="nav-link ">
                                <span class="title">Add User</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<c:url value="/admin/list-user"/>" class="nav-link ">
                                <span class="title">View All User</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- end sidebar menu -->