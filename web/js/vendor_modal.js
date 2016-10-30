$(function () {

    slider_form = $('#slider_form');
    about_form = $('#about_form');
    vision_form = $('#vision_form');
    location_form = $('#location_form');
    contact_form = $('#contact_form');
    pricing_form = $('#pricing_form');
    calendar_form = $('#calendar_form');
    gallery_form = $('#gallery_form');
    new_post_form = $('#new_post_form');
    edit_post_form = $('#edit_post_form');
    comment_form = $('#comment_form');
    visitor_sign_up_form = $('#visitor_sign_up_form');

    divForms = $('#div-forms');

    modalAnimateTime = 300;
    msgAnimateTime = 150;
    msgShowTime = 2000;

    current_form = null;
    current = null;

    $('#close_button').click(function () {

        $('#login-modal').modal('hide');
        current_form = null;
    });

    $('#front_images').click(function () {
        divForms.css("height", 1221);
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("slider_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });

        } else {
            modalAnimate(current_form, slider_form);
        }
        current_form = slider_form;
        current = "slider_form";
    });

    $('#about').click(function () {
        divForms.css("height", 333);
        if (current_form === null) {
            if (current !== null) {

                document.getElementById(current).style.display = "none";
            }
            document.getElementById("about_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, about_form);
        }
        current_form = about_form;
        current = "about_form";
    });

    $('#vision').click(function () {
        divForms.css("height", 233);
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("vision_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, vision_form);
        }
        current_form = vision_form;
        current = "vision_form";
    });

    $('#location').click(function () {
        divForms.css("height", 267);
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("location_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, location_form);
        }
        current_form = location_form;
        current = "location_form";
    });

    $('#contact').click(function () {
        divForms.css("height", 443);
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("contact_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, contact_form);
        }
        current_form = contact_form;
        current = "contact_form";
    });

    $('#pricing').click(function () {
        divForms.css("height", 428);
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("pricing_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, pricing_form);
        }
        current_form = pricing_form;
        current = "pricing_form";
    });

    $('#calendar').click(function () {
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("calendar_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, calendar_form);
        }
        current_form = calendar_form;
        current = "calendar_form";
    });

    $('#gallery').click(function () {
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("gallery_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, gallery_form);
        }
        current_form = gallery_form;
        current = "gallery_form";
    });

    window.post = function (status) {

        if (status === 'new') {
            $('#form_title').val(null);
            $('#form_content').val(null);
            $('#output').attr('src', null);
        }

        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("new_post_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, new_post_form);
        }
        current_form = new_post_form;
        current = "new_post_form";
    };

    window.load_comments = function () {
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("comment_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, comment_form);
        }
        current_form = comment_form;
        current = "comment_form";
    };

    window.visitor_sign_up= function () {
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("visitor_sign_up_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, visitor_sign_up_form);
        }
        current_form = visitor_sign_up_form;
        current = "visitor_sign_up_form";
    };

    function modalAnimate(oldForm, newForm) {
        oldH = oldForm.height();
        newH = newForm.height();
        divForms.css("height", oldH);
        oldForm.fadeToggle(modalAnimateTime, function () {
            divForms.animate({height: newH}, modalAnimateTime, function () {
                newForm.fadeToggle(modalAnimateTime);
            });
        });
    }

    function msgFade(msgId, msgText) {
        msgId.fadeOut(msgAnimateTime, function () {
            $(this).text(msgText).fadeIn(msgAnimateTime);
        });
    }

    function msgChange(divTag, iconTag, textTag, divClass, iconClass, msgText) {
        msgOld = divTag.text();
        msgFade(textTag, msgText);
        divTag.addClass(divClass);
        iconTag.removeClass("glyphicon-chevron-right");
        iconTag.addClass(iconClass + " " + divClass);
        setTimeout(function () {
            msgFade(textTag, msgOld);
            divTag.removeClass(divClass);
            iconTag.addClass("glyphicon-chevron-right");
            iconTag.removeClass(iconClass + " " + divClass);
        }, msgShowTime);
    }

});


