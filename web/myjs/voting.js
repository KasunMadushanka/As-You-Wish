function vote(contestant_id) {

    $.ajax({
        type: "post",
        url: "controllers/voting_system/update_vote.jsp",
        data: "contestant_id=" + contestant_id,
        success: function (msg) {
            check_status();
        },
        error: function (error) {
            alert(error);

        }
    });

}

function check_status() {

    $.ajax({
        type: "post",
        url: "controllers/voting_system/check_status.jsp",
        dataType: "json",
        success: function (msg) {
            if (msg.length === 0) {
                $('#table_div').find('button').attr('disabled', false);
            } else if (msg.length === 3) {
                $('#table_div').find('button').attr('disabled', true);
            } else {
                $('#table_div').find('button').attr('disabled', false);
                for (i = 0; i < msg.length; i++) {
                    $('#button' + msg[i]).attr('disabled', true);
                }
            }
        },
        error: function (error) {
            alert(error);
        }
    });

}