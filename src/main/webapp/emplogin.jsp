<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    .navbar {
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 1; /* Add z-index to make sure it's above other elements */
    }

    .container {
      background-color: rgba(255, 255, 255, 0.7);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      display: flex;
      margin-top: 60px; /* Add margin to create space below the navbar */
    }

    .left-side {
      flex: 1;
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNB7zBmf6RY2pWZ8bytp2LMKG5B4ZcdE3Ucg&usqp=CAU'); /* Replace with your background image URL */
      background-size: cover;
      background-repeat: no-repeat;
    }

    .right-side {
      flex: 1;
      padding: 20px;
      text-align: center;
    }

    h3 {
      font-size: 24px;
      color: #333;
    }

    label {
      font-weight: bold;
      margin-top: 10px;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .button {
      background-color: #0074e4;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    .button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="navbar">
<%@ include file="navbar.jsp" %>
</div>

<div class="container">
<div class="left-side">
</div>
<div class="right-side">
<span class="blink">
<h3 align="center" style="color:red">${message}</h3>
</span>

<h3 align="center">
<u>Employee Login</u>
</h3>

<form method="post" action="checkemplogin">
<table align="center">
<tr>
<td><label>Email ID</label></td>
<td><input type="email" name="email" required/></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Password</label></td>
<td><input type="password" name="pwd" required/></td>
</tr>

<tr><td></td></tr>

<tr><td></td></tr>

<tr align="center">
<td colspan="2"><input type="submit" value="Login" class="button"></td>
</tr>
</table>
</form>

<br>

<h3 align="center">New Registration ? <a href="empreg">Click Here</a></h3>
</div>
</div>


</body>
</html>
