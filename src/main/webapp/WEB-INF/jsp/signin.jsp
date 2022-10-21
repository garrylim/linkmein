<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
	<head>
		<title>Linkmein</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
		
	

	</head>

	<!-- Nav -->
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
			<div>
			  <a href="/signup"><button class="btn btn-primary" style="margin-right:40px;">Sign Up</button></a>
			  </div>
		  </div>
		</div>
	  </nav>
	  
	  <form class="mt-5" action="/login" method="post">
    	<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
	  <div class="card mt-5" style="width: 70rem; margin: auto;">
        <div class="card-body text-center">
		<label class="form-label mt-4 mb-3" style="font-size:40px;">Welcome to LinkedMeIn Portal</label>
		
		<div>
		  <img src="assets/images/register.png" class="img-fluid" alt="Responsive image">
	  </div>
		<div class="form-floating mt-2" style="width: 40rem; margin:auto;">
		  <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
		  <label for="floatingInput">Email address</label>
		</div>
		<div class="form-floating mt-2" style="width: 40rem; margin:auto;">
		  <input type="password" class="form-control" name="password" id="password" placeholder="Password">
		  <label for="floatingPassword">Password</label>
		</div>
		<button type="submit" class="btn btn-primary mt-2">Login</button>
	  </div>
	</div>
	<!-- <c:if test="${error_string != null}">
					<div class="alert alert-danger mt-3">
						${error_string}
					</div>
				</c:if> -->
	</form>

	<!-- Footer -->
<footer class="bg-dark text-center text-white">

	<!-- Copyright -->
	<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
	  © 2022 Copyright:
	  <a class="text-white">By Garry</a>
	</div>
	<!-- Copyright -->
  </footer>






