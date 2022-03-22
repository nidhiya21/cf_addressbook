<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="cache-control" content="max-age=0" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <meta http-equiv="expires" content="0" />
        <meta http-equiv="pragma" content="no-cache" />
        <cfheader name="cache-control" value="no-cache, no-store, must-revalidate"> 
        <cfheader name="pragma" value="no-cache">
        <cfheader name="expires" value="#getHttpTimeString(now())#">
		<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
		<link href="./css/all.min.css" rel="stylesheet" type="text/css"/> 
		<link href="./css/login.css" rel="stylesheet" type="text/css"/>
		<script src="./js/jquery-3.5.1.min.js"></script>
		<script src="./js/bootstrap.min.js"></script>
		<script src="./js/popper.min.js"></script>
		
	</head> 
	<body>
		<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
			<a href="##" class="navbar-brand"><img src="./images/logoblock.png" class="">ADDRESS BOOK</a>  		
			<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
				<div class="navbar-nav ml-auto">
					<cfif NOT StructKeyExists(session,"emailID")>
						<a href="./register.cfm" class="nav-item nav-link"><i class="fa fa-solid fa-user"></i></a><span class="nav-text"><a href="./register.cfm" class="nav-links">Sign Up</a></span>	 
						<a href="./login.cfm" class="nav-item nav-link"><i class="fa fa-solid fa-arrow-right-to-bracket"></i></a><span class="nav-text"><a href="./login.cfm" class="nav-links">Login</a></span> 
					<cfelse>
						<a href="./login.cfm?logout=yes" class="nav-item nav-link"><i class="fa fa-solid fa-arrow-left-to-bracket"></i></a><span class="nav-text"><a href="./login.cfm" class="nav-links">Logout</a></span> 
					</cfif>
				</div>
			</div>
		</nav>
    </body>    
</html>