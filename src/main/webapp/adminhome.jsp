<!DOCTYPE html>
<html>
<head>
  <style>
    /* Global Styles */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f0f0f0; /* Light background color */
    }

    /* Navbar Styles */
    .navbar {
      background-color: #0074e4; /* Navbar background color */
      color: #fff; /* Navbar text color */
      padding: 10px;
      text-align: center;
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

    /* Content Styles */
    .content {
      margin-left: 200px; /* Adjust to match the side panel width */
      padding: 20px;
      background-color: #fff; /* Content background color */
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Box shadow for content */
    }

    .content h2 {
      font-size: 24px;
      color: #333; /* Heading text color */
      text-align: center;
    }

    .content p {
      font-size: 16px;
      color: #666; /* Paragraph text color */
      text-align: center;
    }

    /* Additional styling as needed for your content */
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

  <div class="content">
    <h2>Leave Management Dashboard</h2>
    <p>Welcome, Manager. Here's an overview of leave requests:</p>
    <p style="font-size: 15pt;">Hi manager</p>
    <!-- You can add more content here, such as charts or statistics related to leave management -->
  </div>
</body>
</html>
