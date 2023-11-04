<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<html>
<head>

  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    /* Responsive table CSS */
    table {
      width: 80%; /* Reduced table width to prevent overlap */
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

    /* Adjust content position to prevent overlap */
    .content {
      margin-left: 220px; /* Adjust as per the width of the side panel */
    }
  </style>
</head>
<body>

<%@ include file="adminnavbar.jsp" %>
<div class="side-panel">
    <ul>
      <li><a href="viewallleaves">View All Leave Requests</a></li>
      <li><a href="deleteemp">Rejected Leave Requests</a></li>
    </ul>
  </div>
<div class="content"> <!-- Enclose content in a separate div -->
  <br>
  ${message}
  <br>
  <table align="center" border="2">
    <tr bgcolor="black" style="color: white">
      <th>Request ID</th>
      <th>Emp Id</th>
      <th>Leave type</th>
      <th>Start date</th>
      <th>End date</th>
      <th>Reason for Leave </th>
      <th>Status </th>
      <th>action </th>

      <th>comment</th>
    </tr>

    <c:forEach items="${list}" var="l">
      <tr>
        <td><c:out value="${l.id}" /></td>
        <td><c:out value="${l.empid}" /></td>
        <td><c:out value="${l.leavetype}" /></td>
        <td><c:out value="${l.startdate}" /></td>
        <td><c:out value="${l.enddate}" /></td>
        <td><c:out value="${l.reason_for_leave}" /></td>
        
        
        <c:if test="${l.isapproved==true}" >
          <td bgcolor="green">Approved</td>
        </c:if>
        <c:if test="${l.isapproved==false}" >
          <td bgcolor="red">Not approved</td>
        </c:if>

        <td>
          <form action="updatestatus" method ="post">
            <input type="hidden" name="id" value="${l.id}" />
            <input type="hidden" name="status" value="true" />
            <button type="submit">Approve</button>
          </form>
          <form action="updatestatus" method="post">
            <input type="hidden" name="id" value="${l.id}" />
            <input type="hidden" name="status" value="false" />
            <button type="submit">Reject</button>
          </form>
        </td>
        
        <td>
        <form action="mgrFeedback" method="post">
        <textarea name="reason" rows="4" required></textarea>
        <input type="hidden" name="id" value="${l.id}" />
        <center>
			<button type="submit">Done</button>
          </form>
        
        </td>
      </tr>
    </c:forEach>
  </table>
</div>

</body>
</html>
