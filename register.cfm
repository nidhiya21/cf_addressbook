<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Register</title>		
	</head> 
	<body>
		<cfinclude template="header.cfm">
		<section class="myform-area">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="form-area login-form">
							<div class="form-content">
								<img src="./images/logoblock.png" class="left-img">
							</div>
							<div class="form-input">
								<h2>REGISTER</h2>
                                <cfparam name="form.fullName" default=""> 
                                <cfparam name="form.emailID" default=""> 
                                <cfparam name="form.userName" default=""> 
                                <cfparam name="form.password" default=""> 
                                <cfparam name="form.confirmpassword" default=""> 
                                <cfif structKeyExists(form,'saveForm')>
                                    <cfinvoke component="components.login" method="saveUser" returnvariable="result">
                                        <cfinvokeargument name="fullName"  value = "#form.fullName#" />
                                        <cfinvokeargument name="emailID"  value = "#form.emailID#" />
                                        <cfinvokeargument name="userName"  value = "#form.userName#" />
                                        <cfinvokeargument name="password"  value = "#form.password#" />
                                    </cfinvoke> 
                                    <cfif result GT 0>
                                        <cfset Session.LoggedIn = "1">
										<cfset Session.userName = "#form.userName#">
										<cfset Session.emailID = "#form.emailID#">    
										<cflocation url="account.cfm" addtoken="No"> 
                                    </cfif>
                                </cfif> 
                                <form name="signup" method="post">
									<div class="form-group">
										<input type="text"  id="fullName" name="fullName" required>
										<label>Full Name</label>
									</div>
                                    <div class="form-group">
										<input type="email"  id="emailID" name="emailID" required>
										<label>Email ID</label>
									</div>
                                    <div class="form-group">
										<input type="text"  id="userName" name="userName" required>
										<label>Username</label>
									</div>
									<div class="form-group">
										<input type="password" id="password" name="password" required>
										<label>Password</label>
									</div>
                                    <div class="form-group">
										<input type="password" id="confirmpassword" name="confirmpassword" required>
										<label>Confirm Password</label>
									</div>
									<div class="myform-button">
										<button class="myform-btn" id="saveForm" name="saveForm" >REGISTER</button>
									</div>
								</form>
								
							</div>
						</div>
					</div>
				</div>
			</div>
        </section>
	</body>
</html>