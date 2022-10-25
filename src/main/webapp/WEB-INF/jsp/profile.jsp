<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
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
         <button type="button" class="btn btn-outline-dark me-2" style="border: none;">
            	@<c:out value="${pageContext.request.remoteUser}" />
            </button>
            
            <form action="/logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
            	<button type="submit" class="btn btn-danger">Logout</button>
	    </form>
        </div>
        </div>

    </nav>


    <section class="container col-lg-4" style="margin-top: 100px;">

   <form class="form-group" action="/update-profile" method="post" modelAttribute="user">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div class="mb-3">
      <label class="form-label">ID: </label>
      <input class="form-control" name="id" value="${user.id}" aria-label="Store ID" readonly="true"/>
    </div>

    <div class="mb-3">
      <label class="form-label">*Username: </label>
      <input type="text" class="form-control" name="username" id="username" value="${user.username}" aria-label="username"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*Email: </label>
      <input type="email" class="form-control" name="email" id="email" value="${user.email}" aria-label="email"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*First Name: </label>
      <input class="form-control" name="firstname" id="firstname" value="${user.firstname}" aria-label="first name"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*Last Name: </label>
      <input class="form-control" name="lastname" id="lastname" value="${user.lastname}" aria-label="last name"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*Company: </label>
      <input class="form-control" name="company" id="company" value="${user.company}" aria-label="company"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*City: </label>
      <input class="form-control" name="city" id="city" value="${user.city}" aria-label="country"
       />
    </div>

    <div class="mb-3">
      <label class="form-label">*Country: </label>
      <input class="form-control" name="country" id="country" value="${user.country}" aria-label="country"
       />
    </div>
    
    <div class="mb-3">
      <label class="form-label" for="customFile">Profile photo</label>
      <input type="file" name="img" class="form-control" id="customFile" value="" />
    </div>
    
    <div class="py-5">
      <a href="/" class="btn btn-danger">Cancel</a>
      <button type="submit" class="btn btn-success">Update</button>
    </div>
  </form>

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