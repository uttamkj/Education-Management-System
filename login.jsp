<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn Form</title>
<link rel="stylesheet" href="css/stylelogin.css">
 <link
      rel="shortcut icon"
      href="https://cdn.jsdelivr.net/npm/twemoji@11.3.0/2/svg/1f3ec.svg"
      type="image/x-icon"
    />
</head>
<body>
    <div class="container">
        <h2>LogIn</h2>
        <form action="chk_user" method="post">
            <input type="text" placeholder="Email" name="email" required>
            <input type="password" placeholder="Password" name="password" required>
            <input type="submit" value="LogIn">
            <a href="signup.jsp" class="logIn_link">Don't have an account? SignUp</a>
        </form>
        <c:if test="${not empty res}">
            <p>${res}</p>
        </c:if>
    </div>
</body>
</html>
