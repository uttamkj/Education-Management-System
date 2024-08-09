<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .container {
        background: #fff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }
    form {
        display: flex;
        flex-direction: column;
    }
    input[type="password"] {
        padding: 12px;
        margin: 10px 0 20px 0;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
    }
    input[type="submit"] {
        padding: 12px;
        margin: 20px 0;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    #error-message {
        color: red;
        text-align: center;
        margin-top: 20px;
    }
</style>
<script>
    function validateForm() {
        var password = document.forms["changePasswordForm"]["password"].value;
        var cpassword = document.forms["changePasswordForm"]["cpassword"].value;
        if (password !== cpassword) {
            document.getElementById("error-message").innerText = "Passwords do not match!";
            return false;
        }
        return true;
    }
</script>
</head>
<body>
<div class="container">
    <h1>Change Password</h1>
    <form name="changePasswordForm" action="update_password" method="post" onsubmit="return validateForm()">
        <input type="password" placeholder="New Password" name="password" required>
        <input type="password" placeholder="Confirm Password" name="cpassword" required>
        <input type="submit" value="Update">
    </form>
    <div id="error-message">
        <c:if test="${not empty errorMsg}">
            ${errorMsg}
        </c:if>
    </div>
</div>
</body>
</html>
