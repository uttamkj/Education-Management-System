<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="home.jsp" class="nav-link px-2 text-secondary">Home</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Students</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Add Questions</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Videos</a></li>
          <li><a href="leaveForm.jsp" class="nav-link px-2 text-white">Leave</a></li>
          <li><a href="changepassword.jsp" class="nav-link px-2 text-white">Change Password</a></li>
        </ul>

        <div class="text-end">
          <a href="#"><button type="button" class="btn btn-outline-light me-2">logOut</button></a>
        </div>
      </div>
    </div>
  </header>
</body>
</html>
