<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ include file="../jsp/header.jsp" %>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${totalQuantity}</em>
            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum tempora!</p>
        </div>

        <div class="stats--item">
            <em>${totalDonations}</em>
            <h3>Suma ilości darowizn</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps" id="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="#" class="btn btn--large">Załóż konto</a>
</section>

<!DOCTYPE html>
<html>
<head>
    <title>Formularz Darowizny</title>
</head>
<body>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy wiedzieć komu najlepiej je przekazać.</p>
            <p data-step="2">Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy wiedzieć komu najlepiej je przekazać.</p>
            <p data-step="3">Wybierz jedną, do której trafi Twoja przesyłka.</p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <!-- STEP 1 -->
        <form:form method="post" action="donation" modelAttribute="donations">

            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <div class="form-group form-group--checkbox">
                    <c:forEach items="${categories}" var="category">
                        <label>
                            <input type="checkbox" name="categories" value="${category.id}" />
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                    </c:forEach>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


        <!-- STEP 2 -->

            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>
                <div class="form-group form-group--inline">
                    <label>Liczba 60l worków:</label>
                    <form:input path="quantity" type="number" id="quantity" step="1" min="1" />
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn next-step">Dalej</button>
                </div>
            </div>


        <!-- STEP 3 -->

   <div data-step="3">
    <h3>Wybierz organizację, której chcesz pomóc:</h3>
    <div class="form-group form-group--checkbox">
        <c:forEach items="${institutions}" var="institution">
            <label>
                <form:radiobutton  path="institution.id" value="${institution.id}" />
                <span class="checkbox radio"></span>
                <span class="description">
                    <div class="title">${institution.name}</div>
                    <div class="subtitle">${institution.description}</div>
                </span>
            </label>
        </c:forEach>
    </div>
    <div class="form-group form-group--buttons">
        <button type="button" class="btn prev-step">Wstecz</button>
        <button type="submit" class="btn next-step">Dalej</button>
    </div>
</div>


        <!-- STEP 4 -->

            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>
                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>Ulica</label>
                            <form:input path="street" id="street" />
                        </div>
                        <div class="form-group form-group--inline">
                            <label>Miasto</label>
                            <form:input path="city" id="city" />
                        </div>
                        <div class="form-group form-group--inline">
                            <label>Kod pocztowy</label>
                            <form:input path="zipCode" id="zipCode" />
                        </div>
                        <div class="form-group form-group--inline">
                            <label>Numer telefonu</label>
                            <form:input path="phone" id="phone" />
                        </div>
                    </div>
                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>Data</label>
                            <form:input path="pickUpDate" id="pickUpDate" type="date" />
                        </div>
                        <div class="form-group form-group--inline">
                            <label>Godzina</label>
                            <form:input path="pickUpTime" id="pickUpTime" type="time" />
                        </div>
                        <div class="form-group form-group--inline">
                            <label>Uwagi dla kuriera</label>
                            <form:textarea path="pickUpComment" id="pickUpComment" rows="5"></form:textarea>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                  <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Zatwierdź</button>
                </div>
            </div>

    <!-- KROK 5 -->
        <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <span class="summary--text" id="summaryQuantity"></span>
                        </li>
                        <li>
                            <span class="icon icon-hand"></span>
                            <span class="summary--text" id="instSummary"></span>
                        </li>
                    </ul>
                </div>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>
                            <li id="streetSummary"></li>
                            <li id="citySummary"></li>
                            <li id="postcodeSummary"></li>
                            <li id="phoneSummary"></li>
                        </ul>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li id="dateSummary"></li>
                            <li id="timeSummary"></li>
                            <li id="infoSummary"></li>
                        </ul>
                    </div>
                </div>
            </div>


        <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
      </div>
    </form:form>
        </div>
</section>
<section class="about-us" id="about_us">
    <div class="about-us--text">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value='/resources/images/signature.svg'/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value='/resources/images/about-us.jpg'/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="help">
    <h2>Komu pomagamy?</h2>
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy. Możesz sprawdzić czym się zajmują.</p>
        <ul class="help--slides-items">
            <c:forEach var="institution" items="${institutions}" varStatus="status">
                <c:if test="${status.index % 2 == 0}">
                    <li>
                        <div class="col">
                            <div class="title">Fundacja "${institution.name}"</div>
                            <div class="subtitle">Cel i misja: ${institution.description}</div>
                        </div>
                        <c:if test="${status.index + 1 lt fn:length(institutions)}">
                            <c:set var="nextInstitution" value="${institutions[status.index + 1]}"/>
                            <div class="col">
                                <div class="title">Fundacja "${nextInstitution.name}"</div>
                                <div class="subtitle">Cel i misja: ${nextInstitution.description}</div>
                            </div>
                        </c:if>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</section>
<script src="<c:url value='/resources/js/app.js' />"></script>

<%@ include file="../jsp/footer.jsp" %>