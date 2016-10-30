function process_payment() {

    card_holder_name = $('#card_holder_name').val();
    card_number = $('#card_number').val();
    cvv = $('#cvv').val();

    if (card_holder_name !== "") {
        if (card_number !== "") {
            if (card_number.length === 16) {
                if (cvv !== "") {
                    if (cvv.length === 3) {
                        $.ajax({
                            type: "post",
                            url: "controllers/process_payment.jsp",
                            data: "card_holder_name=" + card_holder_name + "&card_number=" + card_number + "&cvv=" + cvv,
                            success: function (msg) {
                                swal({title: 'Card Details verified!', text: '', type: 'success', confirmButtonText: 'OK'}, function () {
                                    window.location.href = 'vendor_activation.jsp';
                                });
                            },
                            error: function (error) {
                                alert(error);

                            }

                        });
                    } else {
                        $.rustaMsgBox({'mode': 'error', 'content': "CVV is invalid", 'fadeOut': true});
                    }
                } else {
                    $.rustaMsgBox({'mode': 'error', 'content': "CVV field is empty", 'fadeOut': true});
                }
            } else {
                $.rustaMsgBox({'mode': 'error', 'content': "Card number is invalid", 'fadeOut': true});
            }
        } else {
            $.rustaMsgBox({'mode': 'error', 'content': "Card number is empty", 'fadeOut': true});
        }
    } else {
        $.rustaMsgBox({'mode': 'error', 'content': "Card holder name is empty", 'fadeOut': true});
    }
}

function validate_cvv2() {


}

function card_number() {


}
