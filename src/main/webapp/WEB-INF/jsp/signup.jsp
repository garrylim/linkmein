<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
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
              <a class="dropdown-item" href="#">Accordion</a>
              <a class="dropdown-item" href="#">example</a>
              <a class="dropdown-item" href="#">example</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">example</a>
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
      </nav>

    <div class="card mt-5" style="width: 20rem; margin: auto;">
        <div class="card-body text-center">
        
             <form class="mb-4" action="/process_signup" method="post" modelattribute="user">
            <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						
                <h1 class="mb-4">Sign up</h1>
                <div class="form-group mt-2">
                    <label for="username" class="visually-hidden">username</label>
                    <input type="text"  name="username" id="username" class="form-control" placeholder="Username" required autofocus>
                </div>
                <div class="form-group mt-2">
                    <label for="email" class="visually-hidden">email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                </div>
                <div class="form-group mt-2 mb-5">
                    <label for="password" class="visually-hidden">password</label>
                    <input type="password" name="Password" id="password" class="form-control" placeholder="Password">
                </div>
                <div class="form-group d-grid gap-2">
                    <button class="btn btn-success w-100">Sign up with email</button>
                </div>
                <footer class="mt-5 text-muted">&copy; 2022. <a>Made by Garry</a>
                </footer>
            </form>
        </div>
    </div>
  </body>
</html>