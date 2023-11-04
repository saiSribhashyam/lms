<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<%
		if(session.getAttribute("eid")==null||session.getAttribute("ename")==null){
			response.sendRedirect("emplogin.jsp");
		}
%>
<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    /* Add any specific styling for your leave request form here */
    .leave-form {
      background-color: rgba(255, 255, 255, 0.7);
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      margin: 20px auto;
      width: 80%;
      max-width: 600px;
    }

    .leave-form label {
      font-weight: bold;
      margin-top: 10px;
    }

    .leave-form input[type="text"],
    .leave-form input[type="date"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .leave-form .button {
      background-color: #0074e4;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    .leave-form .button:hover {
      background-color: #0056b3;
    }
     .side-panel {
      position: fixed;
      top: 0;
      left: 0;
      width: 200px;
      height: 100%;
      background-color: #333; /* Background color for the side panel */
      color: #fff; /* Text color for the links */
      padding: 10px;
    }

    .side-panel ul {
      list-style-type: none;
      padding: 0;
    }

    .side-panel ul li {
      margin: 5px 0;
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
  <div class="navbar">
    <%@ include file="empnavbar.jsp" %>
  </div>
<div class="side-panel">
    <ul>
      <li><a href="applyleave">Apply for Leave</a></li>
      <li><a href="checkStatus">Check Status</a></li>
      
    </ul>
  </div>
  <div class="container">
    <span class="blink">
      <h3 align="center" class="message">Leave Request</h3>
    </span>

    <form method="post" action="insertleave" class="leave-form">
      <table align="center">
        <tr>
          <td><label>Name</label></td>
          <td><input type="text" name="name" required/></td>
        </tr>

        <tr>
          <td><label>Leave Type</label></td>
          <td>
            <select name="leaveType">
              <option value="Sick Leave">Sick Leave</option>
              <option value="Vacation Leave">Vacation Leave</option>
              <option value="Personal Leave">Personal Leave</option>
            </select>
          </td>
        </tr>

        <tr>
          <td><label>Start Date</label></td>
          <td><input type="date" name="startDate" required/></td>
        </tr>

        <tr>
          <td><label>End Date</label></td>
          <td><input type="date" name="endDate" required/></td>
        </tr>

        <tr>
          <td><label>Reason</label></td>
          <td><textarea name="reason" rows="4" required></textarea></td>
        </tr>

        <tr align="center">
          <td colspan="2">
            <input type="submit" value="Submit" class="button">
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>
