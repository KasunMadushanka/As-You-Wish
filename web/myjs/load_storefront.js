function load_about() {

    $.ajax({
        type: "post",
        url: "controllers/storefront/load_about.jsp",
        data: null,
        success: function (msg) {
            $('#about_form').html(msg);
            load_about_form();
        },
        error: function (error) {
           $.rustaMsgBox({'mode': 'error', 'content': 'Cannot open', 'fadeOut': true});

        }
    });
}

function load_vision() {

    $.ajax({
        type: "post",
        url: "controllers/storefront/load_vision.jsp",
        data: null,
        success: function (msg) {
           $('#vision_form').html(msg);
            load_vision_form();
        },
        error: function (error) {
          $.rustaMsgBox({'mode': 'error', 'content': 'Cannot open', 'fadeOut': true});

        }
    });
}


function load_location() {

    $.ajax({
        type: "post",
        url: "controllers/storefront/load_location.jsp",
        data: "about=" + about,
        success: function (msg) {
            $('#location_form').html(msg);
            load_location_form();
        },
        error: function (error) {
             $.rustaMsgBox({'mode': 'error', 'content': 'Cannot open', 'fadeOut': true});
        }
    });
}


function load_contact() {

    $.ajax({
        type: "post",
        url: "controllers/storefront/load_contact.jsp",
        data: null,
        success: function (msg) {
            $('#contact_form').html(msg);
            load_contact_form();
        },
        error: function (error) {
             $.rustaMsgBox({'mode': 'error', 'content': 'Cannot open', 'fadeOut': true});
        }
    });
}

function load_pricing() {

            load_pricing_form();
   
}



