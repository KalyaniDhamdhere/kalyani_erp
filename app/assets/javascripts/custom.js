
$(function(){
	$("#stud").validate({
		rules: {
			"student[name]":{
					required: true
			},
			"student[email]":{
				required: true
			}
		},
		messages: {
			"student[name]":{
				required: "name is required"
			},
			"student[email]":{
				required: "email is required"
			}
		},
		errorPlacement: function(error,element){
			error.css('color','red')
			error.insertAfter(element.parent(element));
		}
	});

	$("#success-alert").alert();
    $("#success-alert").fadeTo(3000, 500).slideUp(500, function(){
    $("#success-alert").alert('close');
    });   
});
