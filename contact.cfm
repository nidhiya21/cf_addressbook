<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Simple Contact Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #566787;
    background: #f5f5f5;
    font-family: "Open Sans", sans-serif;
}
.contact-form {
    padding: 50px;
    margin: 30px 0;
}
.contact-form h1 {
    text-transform: uppercase;
    margin: 0 0 15px;
}
.contact-form .form-control, .contact-form .btn  {
    min-height: 38px;
    border-radius: 2px;
}
.contact-form .btn-primary {
    min-width: 150px;
    background: #299be4;
    border: none;
}
.contact-form .btn-primary:hover {
    background: #1c8cd7; 
}
.contact-form label {
    opacity: 0.9;
}
.contact-form textarea {
    resize: vertical;
}

.bs-example {
    margin: 20px;
}
.required:after {
    content:" *";
    color: red;
  }
 .form-group input,.form-group select {
  background: transparent;
  border: none;
  border-bottom: 1px solid grey;
  color: black;
  width: 100%;
  font-family: "Monsterrat", sans-serif;
  font-size: 1em;
  padding: 8px;
  transition: all 0.5s;
}


form input:focus {
  background-color: rgb(22, 22, 22);
  color: white;
  -webkit-transition: background-color 0.5s;
  transition: background-color 0.5s;
}
hr.new1 {
  border-top: 3px solid black;
}
</style>

</head>
<body>
<div class="container-xl">
	<div class="row">
		<div class="col-md-8 mx-auto">
			<div class="contact-form">
				<h4>CREATE CONTACT</h4>
				<form action="" method="post"  id="addContact" name="addContact" enctype="multipart/form-data">
                    Personal Contact
                    <hr class="new1">
					<div class="row">
                        <div class="col-sm-4">
							<div class="form-group">
                            <label for="title">Title<span class="required"></span></label>
                            <hr>
                            <select class="form-control" id="title">
                                <option>Mr</option>
                                <option>Ms</option>
                                <option>Mrs</option>
                            </select>
                            </div>
						</div>
						<div class="col-sm-4">
							<div class="form-group ">
								<label for="inputFirstName">First Name<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputFirstName" placeholder="Your First Name" required>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label for="inputLastName">Last Name<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputLastName" placeholder="Your Last Name"  required>
							</div>
						</div>
					</div>  
                    <div class="row">
                        <div class="col-sm-6">
							<div class="form-group ">
								<label for="gender">Gender<span class="required"></span></label>
								<select class="form-control" id="title">
                                    <option>Male</option>
                                    <option>Female</option>
                                </select>
							</div>
						</div>
                        <div class="col-sm-6">
							<div class="form-group">
                                <label for="dob">Date of Birth<span class="required"></span></label>
                                <input type="date" name="dob" id="dob" class="form-control" />
                            </div>
						</div>
					</div>  
                    <div class="row">
                        <div class="col-sm-8">
							<div class="form-group">
                                <label for="dob">Upload Photo</label>
                                 <input type="file" name="file">
                            </div>
						</div>
					</div>  
                    Contact Details
                    <hr class="new1">
                    <div class="row">
						<div class="col-sm-6">
							<div class="form-group ">
								<label for="inputFirstName">Address<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputFirstName" placeholder="Your Address" required>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="inputLastName">Street<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputLastName" placeholder="Your Street"  required>
							</div>
						</div>
					</div>               
					
					<input type="submit" class="btn btn-primary" value="Submit">
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>