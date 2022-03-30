<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>ColdFusion And AJAX File Upload Demo</title>

	<!-- Linked scripts. -->
	<script type="text/javascript" src="jquery-1.2.2.pack.js"></script>
	<script type="text/javascript" src="ajax_upload.js"></script>
</head>
<body>

<!---
	Create an array of files names that we are going to be
	passing back to the client.
--->
<cfset arrFiles = [] />


<!---
	Loop over form fields looking for files. We dont know if
	or how many files are going to be uploaded at this point.
--->
<cfloop
	index="strFileIndex"
	from="1"
	to="10"
	step="1">

	<!--- Build dynamic file field (form field key). --->
	<cfset strField = "upload#strFileIndex#" />

	<!---
		Check to see if file field exists and that it has
		value in it (file path).
	--->
	<cfif (
		StructKeyExists( FORM, strField ) AND
		Len( FORM[ strField ] )
		)>

		<!--- Upload file. --->
		<cffile
			action="upload"
			filefield="#strField#"
			destination="#ExpandPath( './files/' )#"
			nameconflict="makeunique"
			/>

		<!---
			Add the generated server file name to the array of
			file names that we are going to return.
		--->
		<cfset ArrayAppend( arrFiles, CFFILE.ServerFile ) />

	</cfif>

</cfloop>



<!---
	Create the return HTML. Remember, we are going to be
	treating the BODY of the returned document as if it
	were a JSON string.
--->
<cfsavecontent variable="strHTML">
	<cfoutput>

		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
		<html>
		<head></head>
		<body>#SerializeJSON( arrFiles )#</body>
		</html>

	</cfoutput>
</cfsavecontent>


<!--- Create binary response data. --->
<cfset binResponse = ToBinary( ToBase64( strHTML ) ) />

<!--- Tell the client how much data to expect. --->
<cfheader
	name="content-length"
	value="#ArrayLen( binResponse )#"
	/>

<!---
	Stream the "plain text" back to the client. It's actually
	HTML and it is important that we announce it as HTML
	otherwise the client might not know how to work with it.
--->
<cfcontent
	type="text/html"
	variable="#binResponse#"
	/>

	<form>

		<h1>
			ColdFusion And AJAX File Upload Demo
		</h1>

		<input type="file" name="upload1" size="60" /><br />
		<br />

		<input type="file" name="upload2" size="60" /><br />
		<br />

		<input type="submit" value="Upload Files" />

	</form>

</body>
</html>

