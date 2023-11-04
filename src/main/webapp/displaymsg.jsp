<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>Message</title>
<style>
  /* Animation for the tick mark */
  @keyframes fadeIn {
    0% { opacity: 0; transform: scale(0.1); }
    100% { opacity: 1; transform: scale(1); }
  }

  .confirmation {
    animation: fadeIn 0.5s ease;
    color: green;
    font-size: 24px;
  }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div id="confirmationDiv">
  <p class="confirmation">Registration Successful &#10004;</p>
</div>
<br><br>
<a href="emplogin">Login</a>
</body>
</html>
