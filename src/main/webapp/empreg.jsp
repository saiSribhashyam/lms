<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <style>
    /* Your CSS styles here */
  </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<br>
<h3 align=center><u>Employee Registration</u></h3>
<br>
<form method="post" action="insertemp" onsubmit="return validateForm()">
  <table align=center>
    <tr>
      <td><label for="name">Name</label></td>
      <td><input type="text" name="name" id="name" required="required" /></td>
    </tr>
    <tr>
      <td><label for="gender">Gender</label></td>
      <td>
        <input type="radio" name="gender" value="MALE" required />Male
        <input type="radio" name="gender" value="FEMALE" required />Female
        <input type="radio" name="gender" value="OTHERS" required />Others
      </td>
    </tr>
    <tr>
      <td><label for="dob">Date of Birth</label></td>
      <td><input type="date" name="dob" id="dob" required="required" /></td>
    </tr>
    <tr>
      <td><label for="dept">Department</label></td>
      <td>
        <select name="dept" id="dept" required>
          <option value="">---Select---</option>
          <option value="SALES">Sales</option>
          <option value="TECHNICAL">Technical</option>
          <option value="MARKETING">Marketing</option>
          <option value="OTHERS">Others</option>
        </select>
      </td>
    </tr>
    <tr>
      <td><label for="salary">Salary</label></td>
      <td><input type="number" name="salary" id="salary" step="0.01" required /></td>
    </tr>
    <tr>
      <td><label for="email">Email ID</label></td>
      <td><input type="email" name="email" id="email" required /></td>
    </tr>
    <tr>
      <td><label for="pwd">Password</label></td>
      <td><input type="password" name="pwd" id="pwd" required /></td>
    </tr>
    <tr>
      <td><label for="confirmPwd">Confirm Password</label></td>
      <td><input type="password" name="confirmPwd" id="confirmPwd" required /></td>
    </tr>
    <tr>
      <td><label for="location">Location</label></td>
      <td><input type="text" name="location" id="location" required /></td>
    </tr>
    <tr>
      <td><label for="contact">Contact No</label></td>
      <td><input type="text" name="contact" id="contact"  placeholder="Must be 10 digits" required /></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr>
      <td></td>
    </tr>
    <tr align=center>
      <td colspan=2><input type="submit" value="Register" class="button" /></td>
    </tr>
  </table>
</form>

<script>
function validateForm() {
  var name = document.getElementById('name').value;
  var dob = document.getElementById('dob').value;
  var dept = document.getElementById('dept').value;
  var salary = document.getElementById('salary').value;
  var email = document.getElementById('email').value;
  var pwd = document.getElementById('pwd').value;
  var confirmPwd = document.getElementById('confirmPwd').value;
  var location = document.getElementById('location').value;
  var contact = document.getElementById('contact').value;

  if (name.trim() === '') {
    alert('Name is required.');
    return false;
  }

  if (dob.trim() === '') {
    alert('Date of Birth is required.');
    return false;
  }

  if (dept === '') {
    alert('Department is required.');
    return false;
  }

  if (isNaN(salary) || salary <= 0) {
    alert('Salary must be a positive number.');
    return false;
  }

  if (!email.match(/^\S+@\S+\.\S+$/)) {
    alert('Invalid Email ID.');
    return false;
  }

  if (pwd.length < 8) {
    alert('Password must be at least 8 characters long.');
    return false;
  }

  if (pwd !== confirmPwd) {
    alert('Passwords do not match.');
    return false;
  }

  if (location.trim() === '') {
    alert('Location is required.');
    return false;
  }

  if (!contact.match(/^[789][0-9]{9}$/)) {
    alert('Invalid Contact No. Must be 10 digits starting with 7, 8, or 9.');
    return false;
  }

  return true; // Submit the form if all validations pass
}
</script>
</body>
</html>
