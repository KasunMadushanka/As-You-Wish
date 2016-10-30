function send_email(email, status) {

    data = "recipient=" + email + "&status=" + status;

    if (status === "password_reset") {
        switch_email_sent();
    }

    if (status === "customer_message") {
        data = data = "recipient=" + email + "&status=" + status + "&subject=" + $('#form_subject').val() + "&message=" + $('#form_message').val();
    }
    
    $.ajax({
        type: "post",
        url: "EmailSendingServlet",
        data: data,
        success: function (msg) {
            if (status === "customer_message") {
                $.rustaMsgBox({'mode': 'info', 'content': 'Message sent', 'fadeOut': true});
            }
        },
        error: function (error) {
            alert(error);

        }

    });

}