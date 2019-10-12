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
    <title>Oddaj rzeczy - rejestracja</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>

<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authentication var="user" property="principal"/>
            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                <li>
                    <button class="btn btn--small btn--highlighted">Witaj ${user.name} ${user.surname}</button>
                </li>
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

    <section class="login-page">
        <h2>Załóż konto</h2>
        <form:form action="/register" method="post" modelAttribute="userDTO">
            <div class="form-group">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group">
                <input type="text" name="surname" placeholder="Nazwisko"/>
            </div>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Hasło"/>
            </div>
            <div class="form-group">
                <input type="password" name="password2" placeholder="Powtórz hasło"/>
            </div>

            <div class="form-group form-group--buttons">
                <a href="/login" class="btn btn--without-border">Zaloguj się</a>
                <button class="btn" type="submit">Załóż konto</button>
            </div>
        </form:form>
    </section>
</header>

<script src="<c:url value="resources/js/app.js"/>"></script>

</body>
</html>
