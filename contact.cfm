<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap Simple Contact Form</title>
<cfinclude template="common.cfm">	
<link href="./css/contact.css" rel="stylesheet" type="text/css"/>
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
								<input type="text" class="form-control" id="inputFirstName" placeholder="Your First Name" >
							</div>
						</div>
						<div class="col-sm-4">
							<div class="form-group">
								<label for="inputLastName">Last Name<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputLastName" placeholder="Your Last Name"  >
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
								<input type="text" class="form-control" id="inputFirstName" placeholder="Your Address" >
							</div>
						</div>
						<div class="col-sm-6"> 
							<div class="form-group">
								<label for="inputLastName">Street<span class="required"></span></label>
                                <hr>
								<input type="text" class="form-control" id="inputLastName" placeholder="Your Street"  >
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