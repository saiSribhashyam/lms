<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%> 
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
		if(session.getAttribute("eid")==null||session.getAttribute("ename")==null){
			response.sendRedirect("emplogin.jsp");
		}
%>

<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    /* Add your side panel styles here */
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
  <div class="side-panel">
    <ul>
      <li><a href="applyleave">Apply for Leave</a></li>
      <li><a href="checkStatus">Check Status</a></li>
      
    </ul>
  </div>

  <%@ include file="empnavbar.jsp" %>

  <p style="text-align: center; font-size: 15pt">Hi ${ename}</p>
</body>
</html>
