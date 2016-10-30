function update_about() {

    about = $('#about_text').val();

    $('#about_content').html('<p>' + about + '</p>');

    $.ajax({
        type: "post",
        url: "controllers/storefront/update_about.jsp",
        data: "about=" + about,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Introduction content updated', 'fadeOut': true});
        },
        error: function (error) {
            alert(error);

        }
    });
}

function update_vision() {

    vision = $('#vision_text').val();

    $('#vision_content').html('<p>' + vision + '</p>');

    $.ajax({
        type: "post",
        url: "controllers/storefront/update_vision.jsp",
        data: "vision=" + vision,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Vision content updated', 'fadeOut': true});
        },
        error: function (error) {
            alert(error);

        }
    });
}

function update_location() {

    latitude = $('#latitude').val();
    longitude = $('#longitude').val();
    zoom_level = $('#zoom_level').val();
    map_type = $('#map_type').val();
    
    if(map_type==="1"){
        map_type="ROADMAP";
    }else if(map_type==="2"){
        map_type="SATELLITE";
    }else if(map_type==="3"){
        map_type="HIBRID";
    }else if(map_type==="4"){
        map_type="TERRAIN";
    }

    latitude_value = latitude;
    longitude_value = longitude;
    zoom_level_value = parseInt(zoom_level);
    map_type_value = map_type;

    initialize();

    $.ajax({
        type: "post",
        url: "controllers/storefront/update_location.jsp",
        data: "latitude=" + latitude + "&longitude=" + longitude + "&zoom_level=" + zoom_level+"&map_type="+map_type,
        success: function (msg) {

            $.rustaMsgBox({'mode': 'info', 'content': 'Location updated', 'fadeOut': true});
        },
        error: function (error) {
            alert(error);

        }
    });
}

function update_contact() {

    contact_no = $('#contact_no').val();
    email = $('#email').val();
    website_url = $('#website_url').val();
    working_hours = $('#working_hours').val();
    address1 = $('#address1').val();
    address2 = $('#address2').val();
    city = $('#city').val();

    $('#contact_no_content').html(contact_no);
    $('#email_content').html(email);
    $('#website_url_content').html(website_url);
    $('#working_hours_content').html(working_hours);
    $('#address_content').html(address1 + ", " + address2 + ", " + city);

    $.ajax({
        type: "post",
        url: "controllers/storefront/update_contact.jsp",
        data: "contact_no=" + contact_no + "&email=" + email + "&website_url=" + website_url + "&working_hours=" + working_hours + "&address1=" + address1 + "&address2=" + address2 + "&city=" + city,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Contact updated', 'fadeOut': true});
        },
        error: function (error) {
            alert(error);

        }
    });
}

function update_pricing() {


    
    $.ajax({
        type: "post",
        url: "controllers/update_storefront.jsp",
        data: "post_id=" + post_id + "&type=" + type + "&count=" + count,
        success: function (msg) {
            document.getElementById(post_id).innerHTML = '<i class="pe-7s-like2"></i>' + count;
        },
        error: function (error) {
            alert(error);

        }
    });
}