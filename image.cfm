<html>

<script>
function startUpload(){//onsubmit hide the form and show the upload process animation pic
      document.getElementById('upload_process').style.visibility = 'visible';
      document.getElementById('wrapper').style.visibility = 'hidden';
      return true;
}

function stopUpload(success){
      var result = '';
      if (success == "true"){
         result = '<div class="msg">THE FILE WAS UPLOADED SUCCCESSFULLY!<\/div>';
      }
      else {
         result = '<div class="emsg">YOU HAVE EXPERIENCED AN ERROR!<\/div>';
      }
      document.getElementById('upload_process').style.visibility = 'hidden';
      document.getElementById('wrapper').innerHTML = result;
      document.getElementById('wrapper').style.visibility = 'visible';
	 return true;   
}
</script>

<body>

<form name="uploadForm" method="post" enctype="multipart/form-data" action="imageact.cfm" target="upload_target" onsubmit="startUpload();"/>

<p id="upload_process">Uploading File...<br/><br /><br /><img src="ajax_load.gif" /><br/></p>
<!-- go get yourself an animated gif -->
<div id="wrapper">

<input class="selectedFile" name="selectedFile" id="selectedFile" type="file" /><br>
<input name="uploadFile" type="submit" id="uploadFile" class="uploadFile" value="Upload File"/>

</div>

<iframe id="upload_target" name="upload_target" src="" style="width:0;height:0;border:0px solid ##fff;"></iframe>

</form>

</body>

</html>

