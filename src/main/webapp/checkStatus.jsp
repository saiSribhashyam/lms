<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Leave Requests</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <style>
        /* Add your CSS styles here */
        .side-panel {
            position: fixed;
            top: 0;
            left: 0;
            width: 200px;
            height: 100%;
            background-color: #333;
            color: #fff;
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
            background-color: #555;
        }

        /* Center the table */
        .table-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            border-collapse: collapse;
            width: 80%;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            margin: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #0074e4;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        /* Styling for the hovering box */
        .hover-box {
            display: none;
            position: absolute;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            cursor: pointer;
            font-size: 20px;
            color: #888;
        }

        .close-button:hover {
            color: #f00;
        }

        .upload-container {
            text-align: center;
        }

        .bordered {
            border: 1px solid #ccc;
            padding: 5px;
            margin: 10px 0;
        }

        #proofFile {
            display: none;
        }

        .browse-button {
            background: #0074e4;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        .browse-button:hover {
            background: #0059b3;
        }

        .center {
            text-align: center;
        }

        .upload-button {
            background: #0074e4;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
        }

        .upload-button:hover {
            background: #0059b3;
        }
    </style>
</head>
<body>
<%@ include file="empnavbar.jsp" %>
<div class="side-panel">
    <ul>
        <li><a href="applyleave">Apply for Leave</a></li>
        <li><a href="checkStatus">Check Status</a></li>
    </ul>
</div>

<div class="table-container">
    <table class="table table-bordered table-striped">
        <tr>
            <th>Request ID</th>
            <th>Leave Type</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Reason for Leave</th>
            <th>Status</th>
            <th>Comments</th>
            
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/jfsd";
                String username = "root";
                String password = "Jasmitha@1";

                Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement();
                // Modify the SQL query to include a WHERE clause for the user's ID
                int userId = (int) session.getAttribute("eid");
                String sql = "SELECT req_id, lev_type, start_dt, end_dt, reason, approved, mgr_feedback FROM leave_table WHERE emp_id=" + userId;
                ResultSet resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                    %>
                    <tr>
                        <td><%= resultSet.getInt("req_id") %></td>
                        <td><%= resultSet.getString("lev_type") %></td>
                        <td><%= resultSet.getString("start_dt") %></td>
                        <td><%= resultSet.getString("end_dt") %></td>
                        <td><%= resultSet.getString("reason") %></td>
                        <td>
                            <%
                            if (resultSet.getBoolean("approved")) {
                                out.print("Approved");
                            } else {
                                out.print("<h5 style=center>Not Approved</h5><button class='upload-button' onclick='openHoverBox(this)'>Apply for Review</button>");
                            }
                            %>
                        </td>
                        <td><%= resultSet.getString("mgr_feedback") %></td>
                    </tr>
                    <%
                }

                resultSet.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            }
        %>
    </table>
</div>

<!-- Hovering box for uploading proof -->
<div id="hover-box" class="hover-box">
    <span class="close-button" onclick="closeHoverBox()">&#10006;</span>
    <div class="upload-container">
        <h1>Upload Proof</h1>
        <form action="uploadProof" method="post" enctype="multipart/form-data">
            <div class="bordered">
                <input type="file" name="proofFile" id="proofFile" accept=".pdf, .jpg, .jpeg, .png" required>
                <label for="proofFile" class="browse-button">Browse</label>
            </div>
            <br>
            <div class="center">
                <input type="submit" value="Upload" class="upload-button">
            </div>
        </form>
    </div>
</div>

<script>
    function openHoverBox(button) {
        var hoverBox = document.getElementById("hover-box");
        hoverBox.style.display = "block";
        // You can add more JavaScript logic for positioning the hovering box as needed.
        var windowHeight = window.innerHeight;
        var windowWidth = window.innerWidth;
        var boxHeight = hoverBox.offsetHeight;
        var boxWidth = hoverBox.offsetWidth;

        var top = (windowHeight - boxHeight) / 2 + "px";
        var left = (windowWidth - boxWidth) / 2 + "px";

        hoverBox.style.top = top;
        hoverBox.style.left = left;
    }

    function closeHoverBox() {
        var hoverBox = document.getElementById("hover-box");
        hoverBox.style.display = "none";
    }
</script>
</body>
</html>
