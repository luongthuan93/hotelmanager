<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<header role="banner">

    <nav class="navbar navbar-expand-md navbar-dark bg-light">
        <div class="container">
            <a class="navbar-brand" href="<c:url value="/user/home"/>">LuxuryHotel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse navbar-light" id="navbarsExample05">
                <ul class="navbar-nav ml-auto pl-lg-5 pl-0"> 
                    <li class="nav-item">
                        <a class="nav-link active" href="<c:url value="/user/home"/>">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="<c:url value="/user/roomlist"/>" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rooms</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown04">
                            <c:forEach items="${listRoomTypes}" var="rt">
                                <a class="dropdown-item" href="<c:url value="/user/roomlist/${rt.id}"/>">${rt.name}</a>
                            </c:forEach>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.html">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact</a>
                    </li>
                    <sec:authorize access="!isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login"/>">Login</a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" 
                               id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${username}</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown04">
                                <a class="dropdown-item" href="<c:url value="/user/bookingHistory"/>">Booking History</a>
                                <a class="dropdown-item" href="<c:url value="/logout"/>">Logout</a>
                            </div>
                        </li>    
                    </sec:authorize>
                    <li class="nav-item cta">
                        <a class="nav-link" href="<c:url value="/user/searchroom"/>"><span>Book Now</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<!-- END header -->