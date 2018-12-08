<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TUTORN</title>
<link rel="stylesheet" href="CSS/signup.css">

</head>
<body>

	<form action="UserInsertion" style="border: 1px solid #ccc"
		method="post" name="signupform">
		<div class="container">
			<h1>Sign Up</h1>
			<p>Please fill in this form to create an account.</p>
			<hr>

			<label for="fname"><b>First name</b></label> <input type="text"
				placeholder="Enter First name" name="fname" id="fname" required>
			<label for="lname" style="padding-left: 22px;"><b>Last
					name</b></label> <input type="text" placeholder="Enter last name" name="lname"
				id="lname" required><br> <label for="email"><b>Email</b></label>
			<input type="email"
				title="You have entered an invalid email address!"
				placeholder="Enter Email" name="email" id="email"
				pattern="^(([-\w\d]+)(\.[-\w\d]+)*@([-\w\d]+)(\.[-\w\d]+)*(\.([a-zA-Z]{2,5}|[\d]{1,3})){1,2})$"
				onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"
				required>
			<%
				String signup_msg = (String) request.getAttribute("error");
				if (signup_msg != null)
					out.println("<font color=red size=2px>" + signup_msg + "</font>");
			%>
			<br>
			<br> <label for="psw"><b>Password</b></label> <input
				title="Password must contain at least 6 characters, including UPPER/lowercase and numbers"
				type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
				placeholder="Enter Password" name="psw" id="psw" required
				onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');">

			<label for="psw-repeat"><b>Repeat Password</b></label> <input
				type="password" title="Please enter the same Password as above"
				placeholder="Repeat Password" name="repsw" id="repsw" required
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"
				onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');"><br>

			<label for="date_of_birth"><b>Date-of-Birth</b></label> <input
				type="date" name="date_of_birth" id="date_of_birth" required>
			<label for="gender" style="padding-left: 180px; padding-right: 40px;"><b>Gender</b></label>
			<input type="radio" name="gender" value="male" checked> Male
			<input type="radio" name="gender" value="female"> Female <input
				type="radio" name="gender" value="other"> Other <br> <label
				for="house_street_local"><b>Address</b></label> <input type="text"
				placeholder="Enter house no. / Street name / Locality"
				name="house_street_local" id="house_street_local" required>
			<label for="city" style="padding-right: 40px;"><b>City</b></label> <input
				type="text" placeholder="Enter City" name="city" id="city" required>
			<label for="state" style="padding-left: 22px; padding-right: 40px;"><b>State</b></label>
			<input type="text" placeholder="Enter State" name="state" id="state"
				required><br> <label for="zip_code"><b>Postal
					Code</b></label> <input type="number" placeholder="Enter Postal Code"
				name="zip_code" id="zip_code" required>

			<p>
				By creating an account you agree to our <a href="#"
					style="color: dodgerblue">Terms & Privacy</a>.
			</p>

			<div class="clearfix">
				<button type="reset" class="cancelbtn">Cancel</button>
				<button type="submit" class="signupbtn" onclick="return validate()">Sign
					Up</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		function validate() {
			if (!(document.signupform.psw.value == document.signupform.repsw.value)) {
				alert("Password and Re-Entered Password Should be Same");
				document.signupform.repsw.focus();
				return false;
			}
			if (document.signup.zip_code.value.length == 6) {
				alert("Postal code must 6 numbers.");
				document.signupform.zip_code.focus();
				return false;
			}
		}
	</script>

</body>
</html>
