$(document).ready(function () {
    $('#visitor_sign_in_button').click(function ()
    {
        email = $('#visitor_sign_in_email').val();

        $.ajax({
            type: "post",
            url: "controllers/visitor_sign_in.jsp",
            data: "email=" + email,
            success: function (msg) {

                if (msg === "valid") {
                    $.rustaMsgBox({'mode': 'info', 'content': 'You are signed in', 'fadeOut': true});
                    close_modal();
                    //if (page === "voting") {
                        check_status();
                    //}
                } else if (msg === "invalid") {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Sign in invalid', 'fadeOut': true});
                }
            },
            error: function (error) {
                alert(error);

            }
        });

    });
});