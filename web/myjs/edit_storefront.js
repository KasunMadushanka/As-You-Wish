function load_front_images(customer_id,request_id) {
  
    $.ajax({
        type: "post",
        url: "controllers/service_request/load_request.jsp",
        data: "customer_id=" + customer_id+"&request_id="+request_id,
        success: function (msg) {
            $('#service_request_form').html(msg);
            load_();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Caddddddddnnot display comments', 'fadeOut': true});

        }
    });
}

function load_about() {
  alert('ss');
    $.ajax({
        type: "post",
        url: "controllers/service_request/load_request.jsp",
        data: "customer_id=" + customer_id+"&request_id="+request_id,
        success: function (msg) {
            $('#about_form').html(msg);
            load_about();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Caddddddddnnot display comments', 'fadeOut': true});

        }
    });
}

function load_vision(customer_id,request_id) {
  
    $.ajax({
        type: "post",
        url: "controllers/service_request/load_request.jsp",
        data: "customer_id=" + customer_id+"&request_id="+request_id,
        success: function (msg) {
            $('#service_request_form').html(msg);
            load_();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Caddddddddnnot display comments', 'fadeOut': true});

        }
    });
}

function load_pricing(customer_id,request_id) {
  
    $.ajax({
        type: "post",
        url: "controllers/service_request/load_request.jsp",
        data: "customer_id=" + customer_id+"&request_id="+request_id,
        success: function (msg) {
            $('#service_request_form').html(msg);
            load_();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Caddddddddnnot display comments', 'fadeOut': true});

        }
    });
}