function update_contest_settings() {

    contest_title = $('#contest_title').val();
    schedule_from = $('#datetimepicker3').val();
    schedule_to = $('#datetimepicker4').val();
    applications_from = $('#applications_from').val();
    alert(applications_from);
    applications_to = $('#applications_to').val();
    limit_of_contestants = $('#limit_of_contestants').val();
    max_votes = $('#max_votes').val();
    votes_per_contestant = $('#votes_per_contestant').val();
    display_positions = $('#display_positions').is(':checked');
    display_votes = $('#display_votes').is(':checked');

    $.ajax({
        type: "post",
        url: "controllers/update_contest_settings.jsp",
        data: "contest_title=" + contest_title + "&scheduled_from=" + schedule_from + "&scheduled_to=" + schedule_to + "&applications_from=" + applications_from + "&applications_to=" + applications_to + "&limit_of_contestants=" + limit_of_contestants + "&max_votes=" + max_votes + "&votes_per_contestant=" + votes_per_contestant + "&display_positions=" + display_positions + "&display_votes=" + display_votes,
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Changes Applied Successfully', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot Apply', 'fadeOut': true});
        }
    });

}

function host_contest(){
   
    $.ajax({
        type: "post",
        url: "controllers/switch_contest.jsp",
        data: "status="+"active",
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'New Contest Started', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot host', 'fadeOut': true});
        }
    });
}

function discard_contest(){
  
    $.ajax({
        type: "post",
        url: "controllers/switch_contest.jsp",
        data: "status="+"inactive",
        success: function (msg) {
            $.rustaMsgBox({'mode': 'info', 'content': 'Currently running contest discarded', 'fadeOut': true});
        },
        error: function (error) {
            $.rustaMsgBox({'mode': 'error', 'content': 'Cannot discard', 'fadeOut': true});
        }
    });
}
