<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    /* Responsive table CSS */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: #0074e4;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    tr:hover {
      background-color: #ddd;
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

  <div class="content" style="margin-left: 220px; padding: 20px;">
    <table align="center" border="2">
      <tr bgcolor="black" style="color: white">
        <th>ID</th>
        <th>NAME</th>
        <th>DEPARTMENT</th>
        <th>LOCATION</th>
        <th>EMAIL ID</th>
        <th>CONTACT NO</th>
        <th>ACTION</th>
      </tr>

      <c:forEach items="${empdata}" var="emp">
        <tr>
          <td><c:out value="${emp.id}" /></td>
          <td><c:out value="${emp.name}" /></td>
          <td><c:out value="${emp.department}" /></td>
          <td><c:out value="${emp.location}" /></td>
          <td><c:out value="${emp.email}" /></td>
          <td><c:out value="${emp.contact}" /></td>
          <td>
            <a href='<c:url value="delete/${emp.id}"></c:url>'>Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</body>
</html>
