<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c1" %>

<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0; /* Change this to your desired background color */
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 800px;
      margin: 0 auto;
      background-color: #fff;
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

    /* Side Panel Styles */
     .side-panel {
      position: fixed;
      top: 0;
      left: 0;
      width: 200px;
      height: 100%;
      background-color: #333; /* Side panel background color */
      color: #fff;
      padding: 20px;
    }

    .side-panel ul {
      list-style-type: none;
      padding: 0;
    }

    .side-panel ul li {
      padding: 10px;
    }

    .side-panel ul li a {
      text-decoration: none;
      color: #fff;
      display: block;
    }

    .side-panel ul li a:hover {
      background-color: #555; /* Background color on hover */
    }
  </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>

<div class="side-panel">
  <ul>
    <li><a href="viewallleaves">View All Leave Requests</a></li>
    <li><a href="deleteemp">Remove Leave Requests</a></li>
  </ul>
</div>


<div class="container">
  <h1>Employee Details</h1>
  <p>ID: ${emp.id}</p>
  <p>Name: ${emp.name}</p>
  <p>Gender: ${emp.gender}</p>
  <p>Date of Birth: ${emp.dateofbirth}</p>
  <p>Department: ${emp.department}</p>
  <p>Salary: ${emp.salary}</p>
  <p>Email: ${emp.email}</p>
  <p>Location: ${emp.location}</p>
  <p>Contact No: ${emp.contact}</p>
  <p>Status: ${emp.active}</p>
  <form action="approve" method="POST">
  
  <button type="submit" value="true">Accept</button>
  <button type="submit ">Reject</button>
  </form>
</div>

</body>
</html>
