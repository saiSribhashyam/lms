<!DOCTYPE html>
<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://media.giphy.com/media/QPV7r7QPXJ6v9XoLxu/giphy.gif'); /* URL of the embedded GIF */
      background-size: cover;
      margin: 0;
      padding: 0;
    }
   

    .container {
      max-width: 800px;
      margin: 0 auto;
      background-color: rgba(255, 255, 255, 0.9); /* Add transparency to the container */
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
      font-size: 24px;
      color: #333;
      margin-bottom: 20px;
    }

    p {
      font-size: 16px;
      color: #666;
    }

    ul {
      list-style-type: disc;
      padding-left: 20px;
      font-size: 16px;
      color: #333;
    }

    /* Add responsive design */
    @media (max-width: 600px) {
      .container {
        width: 100%;
        padding: 10px;
      }
    }
    
    /* Add navbar styling here to maintain consistency with your design */
    
  </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container">
<h1>Leave Management System</h1>
<p>Discover the functionalities of our application:</p>
<ul>
<li>Register Employee</li>
<li>Login for Employee</li>
<li>Update Employee Profile</li>
<li>Login for Admin</li>
<li>View All Employees by Admin</li>
<li>Search Employee by ID by Admin</li>
<li>Delete Employee by Admin</li>
<li>Manage Sessions</li>
</ul>

<!-- Add some text -->
<h2>About Our Leave Management System</h2>
<p>Our leave management system enables employees to request leave, view their leave history, and check their leave balance. It also allows admins to approve or reject leave requests, view all employees' leave history, and manage leave policies.</p>

<!-- Add an image -->
<img src="https://img.freepik.com/free-vector/people-waiting-job-interview_52683-44078.jpg?w=900&t=st=1697273090~exp=1697273690~hmac=5f7f54d522eb46c9709be4a4becbf0b6dec98d3f6a5660cbb232ad9bd96e6ed3" alt="Leave Management System" style="width:100%;height:auto;">

<!-- Add a contact section -->
<h2>Contact Us</h2>
<p>If you have any questions or need support, please contact us at:</p>
<p>Email: support@ourcompany.com</p>
<p>Phone: +1-234-567-8900</p>

</div>

</body>
</html>
