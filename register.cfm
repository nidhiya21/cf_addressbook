<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Register</title>	
		<cfinclude template="common.cfm">		
	</head> 
	<body>
		<cfinclude template="header.cfm">
		<cfif structKeyExists(form,'saveForm')>
			<cfinvoke component="components.contact" method="searchUser" returnvariable="result">
				<cfinvokeargument name="emailID"  value = "#form.emailID#" />
				<cfinvokeargument name="userName"  value = "#form.userName#" />
			</cfinvoke>
			<cfif result GT 0>
				<cfset variables.errors = "Email ID alredy existing!">			
			</cfif>
		</cfif>
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
								<cfif isDefined("errors")>
									<div class="error"><cfoutput>#variables.errors#</cfoutput></div>
								</cfif>                               
                                <form name="signup" method="post" id="signup">
									<div class="form-group form-field">
										<input type="text"  id="fullName" name="fullName" placeholder="Full Name">
										<label>Full Name</label>
										<small class="err"></small>
									</div>
                                    <div class="form-group form-field">
										<input type="email"  id="emailID" name="emailID"   placeholder="Email ID">
										<label>Email ID</label>
										<small class="err usrvalid"></small>
									</div>
                                    <div class="form-group form-field">
										<input type="text"  id="userName" name="userName"  placeholder="Username"> 
										<label>Username</label>
										<small class="err usrvalid"></small>
									</div>
									<div class="form-group form-field">
										<input type="password" id="password" name="password"  placeholder="Password">
										<label>Password</label>
										<small class="err"></small>
									</div>
                                    <div class="form-group form-field">
										<input type="password" id="confirmpassword" name="confirmpassword"  placeholder="Confirm Password">
										<label>Confirm Password</label>
										<small class="err"></small>
									</div>
									<div class="myform-button">
										<button class="myform-btn" id="saveForm" name="saveForm"  >REGISTER</button>
									</div>
								</form>								
							</div>
						</div>
					</div>
				</div>
			</div>
        </section>
		<cfinclude template="footer.cfm">
	</body>
</html>