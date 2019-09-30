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

<script>
    function createSummary() {
        var x = document.getElementById("streetID");
        document.getElementById("liStreetID").innerHTML = x.value;
        x = document.getElementById("cityID");
        document.getElementById("liCityID").innerHTML = x.value;
        x = document.getElementById("codeID");
        document.getElementById("liCodeID").innerHTML = x.value;
        x = document.getElementById("phoneID");
        document.getElementById("liPhoneID").innerHTML = x.value;
        x = document.getElementById("quantityID");
        document.getElementById("liQuantityID").innerHTML = x.value + ',';
        x = document.getElementById("dateID");
        document.getElementById("liDateID").innerHTML = x.value;
        x = document.getElementById("timeID");
        document.getElementById("liTimeID").innerHTML = x.value;
        x = document.getElementById("commentID");
        document.getElementById("liCommentID").innerHTML = x.value;

        var radioElems = document.getElementsByName('organization');

        for (i = 0; i < radioElems.length; i++) {
            if (radioElems[i].checked) {
                document.getElementById("liInstitutionNameID").innerHTML = '"' + radioElems[i].dataset.orgname + '"';
            }
        }

        // insideID
        var categoriesElems = document.getElementsByName('categories');
        var categoriesSummary = '';
        for (i = 0; i < categoriesElems.length; i++) {
            if (categoriesElems[i].checked)
                categoriesSummary += categoriesElems[i].nextElementSibling.nextElementSibling.innerHTML + ', ';
        }
        document.getElementById("liInsideID").innerHTML = categoriesSummary;
    }
</script>

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

    <br><br><br><br><br><br><br><br>

    <div class="container container--90">
        <section class="form--steps">
            <div class="form--steps-instructions">
                <div class="form--steps-container">
                    <h3>Ważne!</h3>
                    <p data-step="1" class="active">
                        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                        wiedzieć komu najlepiej je przekazać.
                    </p>
                    <p data-step="2">
                        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                        wiedzieć komu najlepiej je przekazać.
                    </p>
                    <p data-step="3">
                        Wybierz jedną, do
                        której trafi Twoja przesyłka.
                    </p>
                    <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
                </div>
            </div>

            <div class="form--steps-container">
                <div class="form--steps-counter">Krok <span>1</span>/4</div>

                <form action="${pageContext.request.contextPath}/confirm" method="post">
                    <%--                    <form:form action="/confirm" method="post" modelAttribute="donation">--%>
                    <!-- STEP 1: class .active is switching steps -->
                    <div data-step="1" class="active">
                        <h3>Zaznacz co chcesz oddać:</h3>
                        <c:forEach varStatus="counter" items="${categories}">
                            <div class="form-group form-group--checkbox">
                                <label>
                                        <%--<input type="checkbox" name="categories" value="clothes-to-use"/>--%>
                                    <input type="checkbox" name="categories"
                                           value="${counter.index}"/>
                                    <span class="checkbox"></span>
                                    <span class="description">${categories[counter.index].name}</span>
                                </label>
                            </div>
                        </c:forEach>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn next-step">Dalej</button>
                        </div>
                    </div>

                    <!-- STEP 2 -->
                    <div data-step="2">
                        <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                        <div class="form-group form-group--inline">
                            <label>
                                Liczba 60l worków:
                                <input type="number" name="quantity" step="1" min="1"
                                       id="quantityID"/>
                                <%--<input type="number" name="bags" step="1" min="1"/>--%>
                            </label>
                        </div>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" class="btn next-step">Dalej</button>
                        </div>
                    </div>


                    <!-- STEP 4 -->
                    <!-- STEP 3? -->
                    <div data-step="3">
                        <h3>Wybierz organizację, której chcesz pomóc:</h3>
                        <c:forEach varStatus="counter" items="${institutions}">
                            <div class="form-group form-group--checkbox">
                                <label>
                                    <input type="radio" name="organization"
                                           value="${institutions[counter.index].id}"
                                           data-orgname="${institutions[counter.index].name}"/>
                                    <span class="checkbox radio"></span>
                                    <span class="description">
                                <div class="title">Fundacja “${institutions[counter.index].name}"</div>
                                <div class="subtitle">
                                ${institutions[counter.index].description}.
                                </div>
                            </span>
                                </label>
                            </div>
                        </c:forEach>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" class="btn next-step">Dalej</button>
                        </div>
                    </div>

                    <!-- STEP 5 -->
                    <!-- STEP 4? -->
                    <div data-step="4">
                        <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

                        <div class="form-section form-section--columns">
                            <div class="form-section--column">
                                <h4>Adres odbioru</h4>
                                <div class="form-group form-group--inline">
                                    <label> Ulica <input type="text" name="street"
                                                         id="streetID"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label> Miasto <input type="text" name="city"
                                                          id="cityID"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Kod pocztowy <input type="text" name="zipcode" id="codeID"/>
                                    </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Numer telefonu <input type="phone" name="phone"
                                                              id="phoneID"/>
                                    </label>
                                </div>
                            </div>

                            <div class="form-section--column">
                                <h4>Termin odbioru</h4>
                                <div class="form-group form-group--inline">
                                    <label> Data <input type="date" name="pickUpDate"
                                                        id="dateID"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label> Godzina <input type="time" name="pickUpTime"
                                                           id="timeID"/> </label>
                                </div>

                                <div class="form-group form-group--inline">
                                    <label>
                                        Uwagi dla kuriera
                                        <textarea name="pickUpComment" rows="5"
                                                  id="commentID"></textarea>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="button" class="btn next-step" onclick="createSummary()">Dalej</button>
                        </div>
                    </div>

                    <!-- STEP 6 -->
                    <div data-step="5">
                        <h3>Podsumowanie Twojej darowizny</h3>

                        <div class="summary">
                            <div class="form-section">
                                <h4>Oddajesz:</h4>
                                <ul>
                                    <li>
                                        <span class="icon icon-bag"></span>
                                        <span class="summary--text">worki w ilości <div
                                                id="liQuantityID">0,</div> zawartość: <div
                                                id="liInsideID">(default value)</div></span>
                                    </li>

                                    <li>
                                        <span class="icon icon-hand"></span>
                                        <span class="summary--text">Dla fundacji <div id="liInstitutionNameID">Default institution</div></span>
                                    </li>
                                </ul>
                            </div>

                            <div class="form-section form-section--columns">
                                <div class="form-section--column">
                                    <h4>Adres odbioru:</h4>
                                    <ul>
                                        <li id="liStreetID">Default street</li>
                                        <li id="liCityID">Default city</li>
                                        <li id="liCodeID">default code</li>
                                        <li id="liPhoneID">Default phone</li>
                                    </ul>
                                </div>

                                <div class="form-section--column">
                                    <h4>Termin odbioru:</h4>
                                    <ul>
                                        <li id="liDateID">00/00/0000</li>
                                        <li id="liTimeID">00:00</li>
                                        <li id="liCommentID">Brak uwag</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="form-group form-group--buttons">
                            <button type="button" class="btn prev-step">Wstecz</button>
                            <button type="submit" class="btn">Potwierdzam</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</header>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
