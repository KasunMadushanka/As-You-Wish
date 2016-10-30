$(document).ready(function () {
    $('#reset_button').click(function ()
    {
        id = $('#user_id').val();
        type = $('#type').val();

        new_password = $('#new_password').val();
        re_enter_password = $('#re_enter_password').val();

        if (new_password.length !== 0 && re_enter_password.length !== 0) {
            if (new_password.length >= 6) {
                if (new_password === re_enter_password) {

                    $.ajax({
                        type: "post",
                        url: "controllers/password_reset.jsp",
                        data: "id=" + id + "&type=" + type + "&password=" + new_password,
                        success: function (msg) {
                            document.location.href = "index.jsp";

                            $.ajax({
                                type: "post",
                                url: "EmailSendingServlet",
                                data: "recipient=" + msg + "&status=" + "reset_confirmation",
                                success: function (msg) {

                                },
                                error: function (error) {

                                }

                            });
                        },
                        error: function (error) {
                            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Please contact the customer support team', 'fadeOut': true});
                        }
                    });

                } else {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Passwords do not match', 'fadeOut': true});
                }
            } else {
                $.rustaMsgBox({'mode': 'error', 'content': 'Password must have atleast 6 characters', 'fadeOut': true});
            }
        } else {
            $.rustaMsgBox({'mode': 'error', 'content': 'Please fill the required fields', 'fadeOut': true});
        }
    });
});
