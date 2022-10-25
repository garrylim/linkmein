<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Linkmein</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
		
	

	</head>
  <body>

    <!-- nav -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Linkmein</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
          <a class="nav-link active" href="index.html">Home
            <span class="visually-hidden">(current)</span>
          </a>
          </li>
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Example</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="accordian.html">Accordion</a>
            <a class="dropdown-item" href="submit.html">submit forms</a>
            <a class="dropdown-item" href="#">Something else here</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
            </div>
            </li>
          <li class="nav-item">
          <a class="nav-link" href="#">Features</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="#">Privacy Policy</a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="#">About Us</a>
          </li>
        </ul>
         <section>
              <div class="container">
              <c:url var="search_url" value="/homepage" />
              <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                        <form:form role="search" action="${search_url}" method="post">
                            <div class="input-group">
                                  <input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
                                  <button class="btn btn-success me-2" type="submit">Search</button>
                            </div>
                        </form:form>
                </div>
            </section>
            <ul class="navbar-nav me-2 my-2 my-lg-0 navbar-nav-scroll" modelattribute="loggedinuser" style="--bs-scroll-height: 100px;">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  @<c:out value="${pageContext.request.remoteUser}" />
                </a>
                <ul class="dropdown-menu dropdown-menu-lg-end" >
                  <li><a class="dropdown-item" href="/profile?id=${loggedinuser.id}">Profile</a></li>
                  <li><hr class="dropdown-divider"></li>
                  <li><a class="dropdown-item" href="/settings">Settings</a></li>
                  <li><a class="dropdown-item" href="/dashboard">Dashboard</a></li>
                </ul>
              </li>
      </ul>
            <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
            	<button type="submit" class="btn btn-danger">Logout</button>
	    </form>
        </div>

    </nav>
    
    <table class="table card-body text-center">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty users}">
          <c:forEach var="user" items="${users}">
          <tr>
            <th scope="row">${user.id}</th>
            <td>${user.username}</td>
            <td>${user.email}</td>
          </tr>
          </c:forEach>
          </c:if>
        </tbody>
      </table>

    <section>
      <div class="container" style="margin-top: 600px;"></div>
    </section>

    <!-- Footer -->
<footer class="bg-dark text-center text-white">

	<!-- Copyright -->
	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
	  © 2022 Copyright:
	  <a class="text-white">By Garry</a>
	</div>
	<!-- Copyright -->
  </footer>
  </body>
</html>