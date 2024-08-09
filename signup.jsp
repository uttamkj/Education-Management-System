<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up </title>
<link rel="stylesheet" href="css/stylesignup.css">
 <link
      rel="shortcut icon"
      href="https://cdn.jsdelivr.net/npm/twemoji@11.3.0/2/svg/1f3ec.svg"
      type="image/x-icon"
    />
</head>
<body>
 <div>
      <h2>Sign Up</h2>
      <form action="save_user" method="get">
      
      	<input type="text" placeholder="Name" name="name" required>
      	<input type="text" placeholder="Email" name="email" required>
      	<input type="text" placeholder="Phone" name="mobile" required>
      	<input type="password" placeholder="Password" name="password" required>
      	
      	<div>
      		<label><input type="radio" name="role" value="faculty">Faculty</label>
      		<label><input type="radio" name="role" value="student">Student</label>
      	</div>
      	
      	<input type="submit" value="Sign Up">
      	<a href="login.jsp" class="logIn_link">Already have an account ? LogIn</a>
      </form>
 </div>
	
	
</body>
</html>