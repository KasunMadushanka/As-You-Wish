$(document).ready(function () {
    $('#visitor_sign_up_button').click(function ()
    {
        first_name = $('#visitor_first_name').val();
        last_name = $('#visitor_last_name').val();
        email = $('#visitor_sign_up_email').val();
         password = $('#visitor_sign_up_password').val();

        $.ajax({
            type: "post",
            url: "controllers/visitor_sign_up.jsp",
            data: "first_name=" +first_name+"&last_name="+last_name+"&email=" + email+"&password="+password,
            success: function (msg) {
                if(msg==="valid"){
               $.rustaMsgBox({'mode': 'info', 'content': 'Please check your email and verify', 'fadeOut': false});
                send_email(email,'visitor_verification');
            }else if(msg==="invalid"){
                 $.rustaMsgBox({'mode': 'warning', 'content': 'You have already registered. Please sign in', 'fadeOut': true});
            }
            },
            error: function (error) {
                alert(error);

            }
        });

    });
});