<!DOCTYPE html>
<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    .navbar {
      position: fixed;
      top: 0;
      width: 100%;
    }

    .container {
      background-color: rgba(255, 255, 255, 0.7);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      display: flex;
    }

    .left-side {
      flex: 1;
      background-image: url('https://i.pinimg.com/originals/94/09/7e/94097e458fbb22184941be57aaab2c8f.png'); /* Replace with your background image URL */
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

<%@ include file="navbar.jsp" %>

<div class="container">
  <div class="left-side">
    <!-- Your background image on the left side -->
  </div>
  <div class="right-side">
    <span class="blink">
      <h3 align="center" class="message">Manager Login Page</h3>
    </span>

    <form method="post" action="checkadminlogin" class="login-form">
      <table align="center">
        <tr>
          <td><label>Username</label></td>
          <td><input type="text" name="auname" required/></td>
        </tr>

        <tr>
          <td></td>
        </tr>

        <tr>
          <td><label>Password</label></td>
          <td><input type="password" name="apwd" required/></td>
        </tr>

        <tr>
          <td></td>
        </tr>

        <tr>
          <td></td>
        </tr>

        <tr align="center">
          <td colspan="2"><input type="submit" value="Login" class="button"></td>
        </tr>
      </table>
    </form>
    <h3>Trouble logging in? <a href="/contactadmin">Contact admin</a></h3>
  </div>
</div>

</body>
</html>
