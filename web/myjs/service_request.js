function send_request(vendor_id, pricing_id) {

    $.confirm({
        animationSpeed: 750,
        title: 'Confirm!',
        content: 'Are you sure?!',
        confirm: function () {

            $.ajax({
                type: "post",
                url: "controllers/service_request/send_request.jsp",
                data: "vendor_id=" + vendor_id + "&pricing_id=" + pricing_id,
                success: function (msg) {
                    swal({title: 'Request Sent!', text: '', type: 'success', confirmButtonText: 'OK'});

                },
                error: function (error) {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Cannot send', 'fadeOut': true});
                }
            });
        }
    });
}

function load_service_request(customer_id, request_id) {

    $.ajax({
        type: "post",
        url: "controllers/service_request/load_request.jsp",
        data: "customer_id=" + customer_id + "&request_id=" + request_id,
        success: function (msg) {
            $('#service_request_form').html(msg);
            load_request();
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'An error occured. Caddddddddnnot display comments', 'fadeOut': true});

        }
    });
}

function process_request(request_id, status) {

    $.confirm({
        animationSpeed: 750,
        title: 'Confirm!',
        content: 'Are you sure?!',
        confirm: function () {

            $.ajax({
                type: "post",
                url: "controllers/service_request/process_request.jsp",
                data: "request_id=" + request_id + "&status=" + status,
                success: function (msg) {
                    if (status === '3') {
                        swal({title: 'Request Accepted!', text: '', type: 'success', confirmButtonText: 'OK'});
                    } else if (status === '4') {
                        swal({title: 'Request Discarded!', text: '', type: 'success', confirmButtonText: 'OK'});
                    }
                },
                error: function (error) {
                    $.rustaMsgBox({'mode': 'error', 'content': 'Error occured', 'fadeOut': true});

                }

            });
        }
    });
}

