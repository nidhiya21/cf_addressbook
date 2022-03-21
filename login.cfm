<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Beautiful Bootstrap Navbar with Menu Icons</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
	background: #eeeeee;
	font-family: 'Varela Round', sans-serif;
}
.navbar {
	color: #fff;
	background: #926dde !important;
	padding: 5px 16px;
	border-radius: 0;
	border: none;
	box-shadow: 0 0 4px rgba(0,0,0,.1);
}
.navbar img {
	border-radius: 50%;
	width: 36px;
	height: 36px;
	margin-right: 10px;
}
.navbar .navbar-brand {
	color: #efe5ff;
	padding-left: 0;
	padding-right: 50px;
	font-size: 24px;		
}
.navbar .navbar-brand:hover, .navbar .navbar-brand:focus {
	color: #fff;
}
.navbar .navbar-brand i {
	font-size: 25px;
	margin-right: 5px;
}

.navbar .nav-item i {
	font-size: 18px;
}
.navbar .nav-item span {
	position: relative;
	top: 3px;
}
.navbar .navbar-nav > a {
	color: #efe5ff;
	padding: 8px 15px;
	font-size: 14px;		
}
.navbar .navbar-nav > a:hover, .navbar .navbar-nav > a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.3);
}
.navbar .navbar-nav > a > i {
	display: block;
	text-align: center;
}

.navbar .navbar-nav .active a, .navbar .navbar-nav .active a:hover, .navbar .navbar-nav .active a:focus {
	color: #fff;
	text-shadow: 0 0 4px rgba(255,255,255,0.2);
	background: transparent !important;
}
.navbar .navbar-nav .user-action {
	padding: 9px 15px;
	font-size: 15px;
}
.navbar .navbar-toggle {
	border-color: #fff;
}
.navbar .navbar-toggle .icon-bar {
	background: #fff;
}
.navbar .navbar-toggle:focus, .navbar .navbar-toggle:hover {
	background: transparent;
}

.navbar .divider {
	background-color: #e9ecef !important;
}
@media (min-width: 1200px){
	.form-inline .input-group {
		width: 350px;
		margin-left: 30px;
	}
}
@media (max-width: 1199px){
	.navbar .navbar-nav > a > i {
		display: inline-block;			
		text-align: left;
		min-width: 30px;
		position: relative;
		top: 4px;
	}
	.navbar .navbar-collapse {
		border: none;
		box-shadow: none;
		padding: 0;
	}
	.navbar .navbar-form {
		border: none;			
		display: block;
		margin: 10px 0;
		padding: 0;
	}
	.navbar .navbar-nav {
		margin: 8px 0;
	}
	.navbar .navbar-toggle {
		margin-right: 0;
	}
	.input-group {
		width: 100%;
	}
}
</style>
</head> 
<body>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
	<a href="#" class="navbar-brand"><i class="fa fa-cube"></i><b>ADDRESS BOOK</b></a>  		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<!-- Collection of nav links, forms, and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">		
		
		<div class="navbar-nav ml-auto">
			<a href="##" class="nav-item nav-link"><i class="fa fa-solid fa-user"></i><span>Signup</span></a>	 
			<a href="##" class="nav-item nav-link"><i class="fa fa-solid fa-arrow-right-to-bracket"></i><span>Login</span></a> 
		</div>
	</div>
</nav>
</body>
</html>