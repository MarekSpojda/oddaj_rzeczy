<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header class="header--main-page">
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
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
</header>
