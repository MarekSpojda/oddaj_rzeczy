<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Oddaj rzeczy</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authentication var="user" property="principal"/>
            <sec:authorize access="isAuthenticated()">
                <li>
                    <button class="btn btn--small btn--highlighted">Witaj ${user.name} ${user.surname}</button>
                </li>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_ADMIN') and isAuthenticated()">
                <li><a href="/admin" class="btn btn--small btn--highlighted">Panel administratora</a></li>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <li><a href="/logged" class="btn btn--small btn--highlighted">Menu</a></li>
                <li><a href="/logout" class="btn btn--small btn--highlighted">Wyloguj</a></li>
            </sec:authorize>

            <sec:authorize access="!isAuthenticated()">
                <li><a href="/login" class="btn btn--small btn--highlighted">Zaloguj</a></li>
                <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </sec:authorize>
        </ul>

        <ul>
            <li><a href="/#" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#whatisallabout" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/#aboutus" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#institutions" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/donation" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <h2>
            To jest widoczne dla administratora tylko po zalogowaniu.
        </h2>
    </div>
</header>

<%@include file="footer.jsp" %>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
