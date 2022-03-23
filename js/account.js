$(document).on("click", ".formContactSubmit", function () {
    var formData = $('#addContact').serialize();
	$.ajax({
    type:"POST",   
    url: 'components/contact.cfc?method=insertContact', 
    async: false,
    dataType: "json",  
    data:formData,  
            success: function(objResponse ) { 
                if (objResponse.SUCCESS){ 
                    alert('Contact Updated successfully');           
                } 
                else {       
                    alert('Error in updation,Please try again!');  
                }                    
        }
    }); 
});