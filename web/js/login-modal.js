$(function () {

    var formLoginCustomer = $('#customer-login-form');
    var formLoginVendor = $('#vendor-login-form');
    var formLost = $('#lost-form');
    var formEmailSent = $('#email-sent-form');
    var divForms = $('#div-forms');
    var modalAnimateTime = 300;
    var msgAnimateTime = 150;
    var msgShowTime = 2000;

    $("form").submit(function () {
        switch (this.id) {
            case "customer-login-form":
                var lg_username = $('#login_username').val();
                var lg_password = $('#login_password').val();
                if (lg_username == "ERROR") {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                } else {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                }
                return false;
                break;
            case "vendor-login-form":
                var lg_username = $('#login_username').val();
                var lg_password = $('#login_password').val();
                if (lg_username == "ERROR") {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "error", "glyphicon-remove", "Login error");
                } else {
                    msgChange($('#div-login-msg'), $('#icon-login-msg'), $('#text-login-msg'), "success", "glyphicon-ok", "Login OK");
                }
                return false;
                break;
            case "lost-form":
                var ls_email = $('#lost_email').val();
                if (ls_email == "ERROR") {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "error", "glyphicon-remove", "Send error");
                } else {
                    msgChange($('#div-lost-msg'), $('#icon-lost-msg'), $('#text-lost-msg'), "success", "glyphicon-ok", "Send OK");
                }
                return false;
                break;
            default:
                return false;
        }
        return false;
    });

    $('#login_lost_customer').click(function () {
        modalAnimate(formLoginCustomer, formLost);
    });
    $('#login_lost_vendor').click(function () {
        modalAnimate(formLoginVendor, formLost);
    });
    $('#lost_login').click(function () {
        modalAnimate(formLost, formLoginCustomer);
    });
    $('#login_vendor').click(function () {
        modalAnimate(formLoginCustomer, formLoginVendor);
    });
    $('#login_customer').click(function () {
        modalAnimate(formLoginVendor, formLoginCustomer);
    });
    window.switch_email_sent = function () {
        modalAnimate(formLost, formEmailSent);
    };
    $('#confirm_button').click(function () {

        $('#login-modal').modal('hide');
      
    });

    function modalAnimate(oldForm, newForm) {
        var oldH = oldForm.height();
        var newH = newForm.height();
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

    function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass, $msgText) {
        var $msgOld = $divTag.text();
        msgFade($textTag, $msgText);
        $divTag.addClass($divClass);
        $iconTag.removeClass("glyphicon-chevron-right");
        $iconTag.addClass($iconClass + " " + $divClass);
        setTimeout(function () {
            msgFade($textTag, $msgOld);
            $divTag.removeClass($divClass);
            $iconTag.addClass("glyphicon-chevron-right");
            $iconTag.removeClass($iconClass + " " + $divClass);
        }, $msgShowTime);
    }
});