$(document).ready(function() {
    $("#contact").validate({
        errorClass: "fail-alert",
        rules: {
             title: "required",
             firstName: "required",
             lastName: "required",
             gender: "required",
             dob: "required",
             email: {
                required: true,
                email: true
             },
             phoneNumber: "required",
             address: "required",
             street: "required",
             pincode:"required"
        },
        messages: { 
             title: "Please select title",
             firstName: "Please enter Firstname",
             lastName: "Please enter Lastname",
             gender: "Please Select Gender ",
             dob: "Please select DOB",
             email: {
                email: "The email should be in the format: abc@domain.tld"
              },
             phoneNumber: "Please enter Phone",
             address: "Please enter  Address",
             street: "Please enter Street",
             pincode: "Please enter  Pincode"
        },
        
    });
});
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
                    //  console.log(typeof response);
                        var dataInJson = JSON.parse(response);
                        $(".modal-content #firstName").val(dataInJson.items[0].firstName);
                        $(".modal-content #lastName").val(dataInJson.items[0].lastName);
                        $(".modal-content #title").val(dataInJson.items[0].title);
                        $(".modal-content #gender").val(dataInJson.items[0].gender);                    
                        $(".modal-content #address").val(dataInJson.items[0].address);
                        $(".modal-content #street").val(dataInJson.items[0].street);
                        $(".modal-content #pincode").val(dataInJson.items[0].pincode);
                        $(".modal-content #email").val(dataInJson.items[0].email);
                        $(".modal-content #phoneNumber").val(dataInJson.items[0].phoneNumber);
                        $(".modal-content #contactID").val(dataInJson.items[0].contactID);
                        var now = new Date(dataInJson.items[0].dob);
                        var day = ("0" + now.getDate()).slice(-2);
                        var month = ("0" + (now.getMonth() + 1)).slice(-2);
                       var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
                       $(".modal-content #dob").val(today);
                        if(dataInJson.items[0].attachment){
                            var editSrc = "./contactimages/"+dataInJson.items[0].attachment;
                            $("#edit-imgsrc").attr('src', editSrc);   
                        }else{
                            if(dataInJson.items[0].gender =="Male"){
                                var editSrc = "./images/no-man.png";
                                $("#edit-imgsrc").attr('src', editSrc); 
                            }else{
                                var editSrc = "./images/no-female.jpg";
                                $("#edit-imgsrc").attr('src', editSrc); 
                            } 
                        }
                        } 
                        else {                  
                            alert('Error!');    
                        }                    
            }
     }); 
});
$("#loginForm").validate({
    rules: { 
        userName: {
            required: true,
         },
         password: {
            required: true,
         }
    },
    messages: {
        userName: {
            required: "Please enter your Username"
         },
         password: {
            required: "Please provide Your password"
         }
    }
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
    var contactID = $('#contactID').val();
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
            pincode: pincode,
            contactID: contactID
        },
        success: function(objResponse ) { 
            if (objResponse.SUCCESS){ 
                alert('Contact Updated successfully');           
            } 
            else {       
                alert('Error!');  
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
$(document).ready(function() {
    $("#contact").validate({
        rules: {
             title: "required",
             firstName: "required",
             lastName: "required",
             gender: "required",
             dob: "required",
             email: {
                required: true,
                email: true
             },
             phone: "required",
             address: "required",
             street: "required",
             phoneNumber:"required"
        },
        messages: {
             title: "Please select title",
             firstName: "Please enter Firstname",
             lastName: "Please enter Lastname",
             gender: "Please Select Gender ",
             dob: "Please select DOB",
             email: {
                email: "The email should be in the format: abc@domain.tld"
              },
             phone: "Please enter Phone",
             address: "Please enter  Address",
             street: "Please enter Street",
             phoneNumber: "Please enter  Pincode"
        },
        
    });
});

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