$(document).ready(function () {

    $('#customer_login_button').click(function ()
    {
        customer_login();
    });

    $('#customer_login_password').keydown(function (e) {
        if (e.which === 13) {
            customer_login();
            return false;
        }
    });

    $('#vendor_login_button').click(function ()
    {
        vendor_login();
    });

    $('#vendor_login_password').keypress(function (e) {
        if (e.which === 13) {
            vendor_login();
            return false;
        }
    });

});

function customer_login() {

    email = $('#customer_login_email').val();
    password = $('#customer_login_password').val();

    if (email !== "") {
        if (password !== "") {
            $.ajax({
                type: "post",
                url: "controllers/login.jsp",
                data: "email=" + email + "&password=" + password + "&user_type=" + "customer",
                success: function (msg) {
                    if (msg !== "invalid") {
                        document.location = 'couple_blog.jsp';

                    } else {
                        $.rustaMsgBox({'mode': 'error', 'content': 'Login invalid', 'fadeOut': true});
                    }
                },
                error: function (error) {
                    alert(error);

                }

            });
        } else {
            $.rustaMsgBox({'mode': 'error', 'content': 'Please enter your password', 'fadeOut': true});
        }
    } else {
        $.rustaMsgBox({'mode': 'error', 'content': 'Please enter your username', 'fadeOut': true});
    }
}

function vendor_login() {

    email = $('#vendor_login_email').val();
    password = $('#vendor_login_password').val();

    if (email !== "") {
        if (password !== "") {
            $.ajax({
                type: "post",
                url: "controllers/login.jsp",
                data: "email=" + email + "&password=" + password + "&user_type=" + "vendor",
                success: function (msg) {
                    if (msg !== "invalid") {
                        document.location = 'vendor_blog.jsp?service=' + msg;

                    } else {
                        $.rustaMsgBox({'mode': 'error', 'content': 'Login invalid', 'fadeOut': true});
                    }
                },
                error: function (error) {
                    alert(error);

                }

            });
        } else {
            $.rustaMsgBox({'mode': 'error', 'content': 'Please enter your password', 'fadeOut': true});
        }
    } else {
        $.rustaMsgBox({'mode': 'error', 'content': 'Please enter your username', 'fadeOut': true});
    }
}

