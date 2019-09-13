<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
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

    <br><br><br><br><br><br><br><br>

    <section class="login-page">
        <h2>Zaloguj się</h2>
        <form action="/login" method="post">
            <div class="form-group">
                <input type="email" name="username" placeholder="Email"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Hasło"/>
                <%--                <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>--%>
            </div>

            <div class="form-group form-group--buttons">
                <a href="/register" class="btn btn--without-border">Załóż konto</a>
                <button class="btn" type="submit">Zaloguj się</button>
            </div>
        </form>
    </section>
</header>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
