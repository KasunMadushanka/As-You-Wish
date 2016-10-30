$(document).ready(function () {
    $('#sign_up_button').click(function ()
    {
        if ($('#mr').is(':checked')) {
            title = "mr";
        } else {
            title = "miss";
        }

        first_name = $('#first_name').val();
        last_name = $('#last_name').val();
        mobile = $('#mobile').val();
        email = $('#email').val();
        address1 = $('#address1').val();
        address2 = $('#address2').val();
        city = $('#city').val();
        postal_code = $('#postal_code').val();
        password = $('#password').val();
        re_enter_password = $('#re-enter_password').val();

        company_name = $('#company_name').val();
        company_contact_no = $('#company_contact_no').val();
        company_email = $('#company_email').val();
        company_website_url = $('#company_website_url').val();
        company_fb_page = $('#company_fb_page').val();
        company_address1 = $('#company_address1').val();
        company_address2 = $('#company_address2').val();
        company_city = $('#company_city').val();
        company_postal_code = $('#company_postal_code').val();

        pricing = $('#pricing').html();

        service1 = $('#reception_hall_checkbox').is(':checked');
        service2 = $('#cake_designers_checkbox').is(':checked');
        service3 = $('#beauticians_checkbox').is(':checked');
        service4 = $('#bridal_dresses_checkbox').is(':checked');
        service5 = $('#groom_suits_checkbox').is(':checked');
        service6 = $('#photography_checkbox').is(':checked');
        service7 = $('#decorations_checkbox').is(':checked');
        service8 = $('#ent_groups_checkbox').is(':checked');
        service9 = $('#wedding_cars_checkbox').is(':checked');

        if (title !== null) {
            if (first_name !== "") {
                if (last_name !== "") {
                    if (mobile !== "") {
                        if (mobile.length === 9) {
                            if (email.length !== "") {
                                if (email.indexOf("@") !== -1 && email.indexOf(".") !== -1) {
                                    if (address1 !== "") {
                                        if (city !== "") {
                                            if (password !== "") {
                                                if (password.length >= 6) {
                                                    if (re_enter_password !== "") {
                                                        if (password === re_enter_password) {
                                                            if (company_name !== "") {
                                                                if (company_contact_no !== "") {
                                                                    if (company_contact_no.length === 9) {
                                                                        if (company_email === "" || (company_email.indexOf("@") !== -1 && company_email.indexOf(".") !== -1)) {
                                                                            if (company_address1 !== "") {
                                                                                if (company_city !== "") {

                                                                                    $.ajax({
                                                                                        type: "post",
                                                                                        url: "controllers/vendor_sign_up.jsp",
                                                                                        data: "title=" + title + "&first_name=" + first_name + "&last_name=" + last_name + "&mobile=" + mobile + "&email=" + email + "&address1=" + address1 + "&address2=" + address2 + "&city=" + city + "&postal_code" + postal_code + "&password=" + password + "&company_name=" + company_name + "&company_contact_no=" + company_contact_no + "&company_email=" + company_email + "&company_website_url=" + company_website_url + "&company_fb_page=" + company_fb_page + "&company_address1=" + company_address1 + "&company_address2=" + company_address2 + "&company_city=" + company_city + "&company_postal_code=" + company_postal_code + "&pricing=" + pricing + "&service1=" + service1 + "&service2=" + service2 + "&service3=" + service3 + "&service4=" + service4 + "&service5=" + service5 + "&service6=" + service6 + "&service7=" + service7 + "&service8=" + service8 + "&service9=" + service9,
                                                                                        success: function (msg) {
                                                                                            get_path('vendor_profile');
                                                                                            swal({title: 'Your Account was created successfully!', text: '', type: 'success', confirmButtonText: 'OK'}, function () {
                                                                                                window.location.href = 'email_verification.jsp';
                                                                                            });

                                                                                        },
                                                                                        error: function (error) {
                                                                                            alert(error);
                                                                                        }
                                                                                    });

                                                                                } else {
                                                                                    $.rustaMsgBox({'mode': 'error', 'content': "Enter company city", 'fadeOut': true});
                                                                                }
                                                                            } else {
                                                                                $.rustaMsgBox({'mode': 'error', 'content': "Enter company address", 'fadeOut': true});
                                                                            }
                                                                        } else {
                                                                            $.rustaMsgBox({'mode': 'error', 'content': "Company email is invalid", 'fadeOut': true});
                                                                        }
                                                                    } else {
                                                                        $.rustaMsgBox({'mode': 'error', 'content': "Company contact number is invalid", 'fadeOut': true});
                                                                    }
                                                                } else {
                                                                    $.rustaMsgBox({'mode': 'error', 'content': "Enter your company contact number", 'fadeOut': true});
                                                                }
                                                            } else {
                                                                $.rustaMsgBox({'mode': 'error', 'content': "Enter your company name", 'fadeOut': true});
                                                            }
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
                                                $.rustaMsgBox({'mode': 'error', 'content': "Enter a password", 'fadeOut': true});
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
        data: "email=" + email + "&type=" + "vendor",
        success: function (msg) {
            if (msg === "exists") {
                $.rustaMsgBox({'mode': 'error', 'content': 'Email address is already registered', 'fadeOut': true});
                $('#email').css("border", "1px solid red");
                return false;
            } else {
                $('#email').css("border", "");
            }
        },
        error: function (error) {
            alert(error);
        }
    });
    return true;
}

function check_mobile(id, event) {
    if (!(event.keyCode >= 48 && event.keyCode <= 57) || $('#' + id).val().length === 9) {
        event.preventDefault();
        return false;
    }
    return true;
}

