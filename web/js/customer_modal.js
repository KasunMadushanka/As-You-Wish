$(function () {

    new_post_form = $('#new_post_form');
    comment_form=$('#comment_form');
    visitor_sign_up_form=$('#visitor_sign_up_form');
    visitor_sign_in_form=$('#visitor_sign_in_form');

    divForms = $('#div-forms');
    
    modalAnimateTime = 300;
    msgAnimateTime = 150;
    msgShowTime = 2000;

    current_form = null;
    current = null;

    window.close_modal=function () {
        current_form = null;
        $('#login-modal').modal('hide');
    };

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
    
     window.visitor_sign_in = function () {
        if (current_form === null) {
            if (current !== null) {
                document.getElementById(current).style.display = "none";
            }
            document.getElementById("visitor_sign_in_form").style.display = "";
            $('#login-modal').modal({
                show: 'true'
            });
        } else {
            modalAnimate(current_form, visitor_sign_in_form);
        }
        current_form = visitor_sign_in_form;
        current = "visitor_sign_in_form";
    };
    
    window.visitor_sign_up = function () {
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