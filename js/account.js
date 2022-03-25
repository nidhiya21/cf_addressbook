$(document).on("click", ".modal-trigger", function () {
	var contactID = $(this).data('id');
	$(".modal-contentVal #contactIDVal").val(contactID);
    
});
$(document).on("click", ".modal-trigger-edit", function () {
	var contactID = $(this).data('id');
    $.ajax({
        url: 'components/contact.cfc', 
        async: false,
        data: 
            { 
                method: "getContactsByID",
                contactID:contactID},
                success: function(response) {
                    if (response){ 
                        $(".modal-title").html("EDIT CONTACT");
                    
                    console.log(typeof response);
                    // const obj = JSON.parse(response);
                    var dataInJson = JSON.parse(response);
                    alert(dataInJson.firstName)
                    // console.log(typeof obj);
                    // console.log(obj['firstName']);
                      // var firstName =  response.firstName;
                     

                        //alert('Contact deleted successfully');           
                    } 
                    else {                  
                        alert('Error in deletion,Please try again!');    
                    }                    
            }
     }); 
    

	
    
});

$(document).on("click", ".deleteSubmit", function () {
	var contactID = $('#contactIDVal').val();
	$.ajax({
    url: 'components/contact.cfc', 
    async: false,
    dataType: "json",
    data: 
        { 
            method: "deleteContact",
            contactID:contactID},
            success: function(objResponse ) {
                if (objResponse.SUCCESS){ 
                    alert('Contact deleted successfully');           
                } 
                else {                  
                    alert('Error in deletion,Please try again!');    
                }                    
        }
    }); 
});

$(document).on("click", ".formContactSubmit", function () {
    var formData = $('#addContact').serialize();
    var attachmentVal = $('#attachment').val();
    var attachment = attachmentVal.split("\\").pop();
    var userID = $('#userID').val();
    var title = $('#title').val();
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var gender = $('#gender').val();
    var dob = $('#dob').val();
    var address = $('#address').val();
    var street = $('#street').val();
    var email = $('#email').val();
    var phoneNumber = $('#phoneNumber').val();
    var pincode = $('#pincode').val();
	$.ajax({
    type:"POST",   
    url: 'components/contact.cfc', 
    async: false,
    dataType: "json",  
    data: {
            method: "insertContact",
            userID: userID,
            title: title,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            dob: dob,
            attachment: attachment,
            address: address,
            street: street,
            email: email,
            phoneNumber: phoneNumber,
            pincode: pincode
        },
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
function printDiv() {				
    w=window.open();
    w.document.write($('.printableArea').html());
    w.print();
    w.close();
}
$(document).on("click", ".formEditContactSubmit", function () {
    var formData = $('#addContact').serialize();
    var userID = $('#userID').val();
    var title = $('#title').val();
    var firstName = $('#firstName').val();
    var lastName = $('#lastName').val();
    var gender = $('#gender').val();
    var dob = $('#dob').val();
    var attachment =12;
    var address = $('#address').val();
    var street = $('#street').val();
    var email = $('#email').val();
    var phoneNumber = $('#phoneNumber').val();
    var pincode = $('#pincode').val();
	$.ajax({
    type:"POST",   
    url: 'components/contact.cfc', 
    async: false,
    dataType: "json",  
    data: {
            method: "insertContact",
            userID: userID,
            title: title,
            firstName: firstName,
            lastName: lastName,
            gender: gender,
            dob: dob,
            attachment: attachment,
            address: address,
            street: street,
            email: email,
            phoneNumber: phoneNumber,
            pincode: pincode
        },
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