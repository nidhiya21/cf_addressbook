<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Account</title>	
        <link href="./css/welcomeuser.css" rel="stylesheet" type="text/css"/>	
	</head> 
	<body>
        <cfinclude template="header.cfm">
        <div class="container-xl">
			<div class="table-responsives">
                <div class="table-title">
						<div class="row">
							<div class="col-sm-6">
								<h2>Manage <b>Content Pages</b></h2>
							</div>
							<div class="col-sm-6">
								<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Page</span></a>
								
							</div>
						</div>
				</div>
                <div class="pfl-block">
                    <div class="avatar">
                        <img src="./images/user-icon.jpg" alt="Avatar">
                    </div>
                    <div class="username">
                        <cfoutput>#Session.userName#</cfoutput>
                    </div>    
                </div>
				<div class="table-wrapper">
					
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>Page Title</th>
								<th>Page Description</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>dd</td>
								<td>kk</td>
								<td>
									<a href="" class="edit modal-trigger-edit"   data-toggle="modal" data-target=".editEmployeeModal"><i class="fa fa-edit"></i></a>
									<a href="" class="delete modal-trigger"   data-toggle="modal" data-target=".deleteEmployeeModal"><i class="fa fa-trash"></i></a>
								</td>
							</tr>
						</tbody>
					</table>					
				</div>
			</div>        
		</div>
        		<!-- Edit Modal HTML -->
		<div id="addEmployeeModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<cfparam name="form.pagename" default=""> 
                    <cfparam name="form.pagedesc" default="">   
					<form action="" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Add New Content Page</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">					
							<div class="form-group">
								<label>Page Name:</label>
								<input type="text" name="pagename"  class="form-control" required>
							</div>
							<div class="form-group">
								<label>Page Description:</label>
								<textArea name="pagedesc" class="form-control"> </textArea>	
							</div>				
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input type="submit" name="formSubmit" class="btn btn-success" value="Add">
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- Edit Modal HTML -->
		<div id="editEmployeeModal" class="modal fade editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<cfparam name="form.pagename" default=""> 
                    <cfparam name="form.pagedesc" default="">
					<form action="" method="post"  id="editCMS">
						<div class="modal-contentValEdit">
							<input type="hidden" id="pageidValEdit" name="pageidValEdit" value="" />
							<div class="modal-header">						
								<h4 class="modal-title">Edit Content Page</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">					
								<div class="form-group">
									<label>Page Name</label>
									<input type="text" id="pagename" name="pagename" class="form-control" value="" required>
								</div>
								<div class="form-group">
									<label>Page Description:</label>
									<textArea name="pagedesc" id="pagedesc" class="form-control" value=""> </textArea>
								</div>				
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
								<input type="submit" class="btn btn-info editSubmit"  name="editSubmit"  value="Save">
							</div>
						</div>	
					</form>
				</div>
			</div>
		</div>
		<!-- Delete Modal HTML -->
		<div id="deleteEmployeeModal" class="modal fade deleteEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="" method="post">
						<div class="modal-contentVal">
							<input type="hidden" id="pageidVal" name="pageidVal" value="" />
							<div class="modal-header">						
								<h4 class="modal-title">Delete Page</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">					
								<p>Are you sure you want to delete these Records?</p> 
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
								<input type="submit" name="deleteSubmit" data-id=#pageList.pageid#  class="btn btn-danger deleteSubmit" value="Delete">
							</div>
						</div>	
					</form>
				</div>
			</div>
		</div>
    </body>
</html>    	