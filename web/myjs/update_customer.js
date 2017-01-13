$(document).ready(function () {
    $('#update_button').click(function ()
    {

        if ($('#mr').is(':checked')) {
            title = "mr";
        } else if ($('#miss').is(':checked')) {
            title = "miss";
        } else {
            title = null;
        }

        first_name = $('#first_name').val();
        last_name = $('#last_name').val();
        partner_first_name = $('#partner_first_name').val();
        partner_last_name = $('#partner_last_name').val();
        mobile = $('#mobile').val();
        email = $('#email').val();
        address1 = $('#address1').val();
        address2 = $('#address2').val();
        city = $('#city').val();
        postal_code = $('#postal_code').val();
        password = $('#password').val();
        re_enter_password = $('#re-enter_password').val();

        if (title !== null) {
            if (first_name !== "") {
                if (last_name !== "") {
                    if (partner_first_name !== "") {
                        if (partner_last_name !== "") {
                            if (mobile !== "") {
                                if (mobile.length === 9) {
                                    if (email.length !== "") {
                                        if (email.indexOf("@") !== -1 && email.indexOf(".") !== -1) {
                                            if (address1 !== "") {
                                                if (city !== "") {
                                                    if (password === "" || password.length >= 6) {
                                                        if (!(password!=="" && re_enter_password === "")) {
                                                            if (password === re_enter_password) {

                                                                $.ajax({
                                                                    type: "post",
                                                                    url: "controllers/update_customer.jsp",
                                                                    data: "title=" + title + "&first_name=" + first_name + "&last_name=" + last_name + "&partner_first_name=" + partner_first_name +
                                                                            "&partner_last_name=" + partner_last_name + "&mobile=" + mobile + "&address1=" + address1 + "&address2" + address2 +
                                                                            "&city=" + city + "&postal_code=" + postal_code + "&password=" + password,
                                                                    success: function (msg) {
                                                                        get_path('customer_profile');
                                                                        swal({title: 'Your Account was updated successfully!', text: '', type: 'success', confirmButtonText: 'OK'});
                                                                    },
                                                                    error: function (error) {
                                                                        alert(error);
                                                                    }
                                                                });

                                                            } else {
                                                                $.rustaMsgBox({'mode': 'error', 'content': "Passwords do not match", 'fadeOut': true});
                                                            }
                                                        } else {
                                                            $.rustaMsgBox({'mode': 'error', 'content': "Re-enter given password", 'fadeOut': true});
                                                        }
                                                    } else {
                                                        $.rustaMsgBox({'mode': 'error', 'content': "Password length should be atleast 6 characters", 'fadeOut': true});
                                                    }
                                                } else {
                                                    $.rustaMsgBox({'mode': 'error', 'content': "Enter your city", 'fadeOut': true});
                                                }
                                            } else {
                                                $.rustaMsgBox({'mode': 'error', 'content': "Enter your address", 'fadeOut': true});
                                            }
                                        } else {
                                            $.rustaMsgBox({'mode': 'error', 'content': "Email is not valid", 'fadeOut': true});
                                        }
                                    } else {
                                        $.rustaMsgBox({'mode': 'error', 'content': "Enter your email address", 'fadeOut': true});
                                    }
                                } else {
                                    $.rustaMsgBox({'mode': 'error', 'content': "Mobile number is invalid", 'fadeOut': true});
                                }
                            } else {
                                $.rustaMsgBox({'mode': 'error', 'content': "Enter your mobile number", 'fadeOut': true});
                            }
                        } else {
                            $.rustaMsgBox({'mode': 'error', 'content': "Enter partner's last name", 'fadeOut': true});
                        }
                    } else {
                        $.rustaMsgBox({'mode': 'error', 'content': "Enter partner's first name", 'fadeOut': true});
                    }
                } else {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Enter your last name', 'fadeOut': true});
                }
            } else {
                $.rustaMsgBox({'mode': 'error', 'content': 'Enter your first name', 'fadeOut': true});
            }
        } else {
            $.rustaMsgBox({'mode': 'error', 'content': 'Select your title', 'fadeOut': true});
        }

    });
});

function check_email() {

    email = $('#email').val();

    $.ajax({
        type: "post",
        url: "controllers/check_email.jsp",
        data: "email=" + email + "&type=" + "customer",
        success: function (msg) {
            if (msg === "exists") {
                $.rustaMsgBox({'mode': 'error', 'content': 'Email address is already registered', 'fadeOut': true});
                $('#email').css("border", "1px solid red");
                return false;
            } else {
                $('#email').css("border", "");
                return true;
            }
        },
        error: function (error) {
            alert(error);
        }
    });

}

function check_mobile(event) {
    if (!(event.keyCode >= 48 && event.keyCode <= 57) || $('#mobile').val().length === 9) {
        event.preventDefault();
        return false;
    }
    return true;
}

