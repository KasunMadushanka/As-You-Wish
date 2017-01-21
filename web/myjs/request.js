$(document).ready(function () {
    $('#submit_button').click(function ()
    {
        tradition = $('#tradition').val();
        date = $('#date').val();
        
        var d = new Date();
        
        var m = d.getMonth()+1;
        var date = d.getDate();
        
        var outDate = (m<10 ? '0' : '' )+m + "/"+ (date<10?'0' : '' )+"/"+d.getFullYear();
        
        
        
        
        //
        time = $('#time').val();
        duration = $('#duration').val();
        no_of_guests = $('#no_of_guests').val();
        theme = $('#theme').val();
        additional_details = $('#additional_details').val();

        service1 = $('#service1_checkbox').is(':checked');
        service2 = $('#service2_checkbox').is(':checked');
        service3 = $('#service3_checkbox').is(':checked');
        service4 = $('#service4_checkbox').is(':checked');
        service5 = $('#service5_checkbox').is(':checked');
        service6 = $('#service6_checkbox').is(':checked');
        service7 = $('#service7_checkbox').is(':checked');
        service8 = $('#service8_checkbox').is(':checked');
        service9 = $('#service9_checkbox').is(':checked');

        decoration = false;

        if ($('#service1_decorations_checkbox1').is(':checked')) {
            decoration = true;
        }

        type1 = $('#service1_type option:selected').text();
        type2 = $('#service2_type option:selected').text();
        type3 = $('#service3_type option:selected').text();
        type4 = $('#service4_type option:selected').text();
        type5 = $('#service5_type option:selected').text();
        type6 = $('#service6_type option:selected').text();
        type7 = $('#service7_type option:selected').text();
        type8 = $('#service8_type option:selected').text();
        type9 = $('#service9_type option:selected').text();

        city1 = $('#service1_city option:selected').text();
        city2 = $('#service2_city option:selected').text();
        city3 = $('#service3_city option:selected').text();
        city4 = $('#service4_city option:selected').text();
        city5 = $('#service5_city option:selected').text();
        city6 = $('#service6_city option:selected').text();
        city7 = $('#service7_city option:selected').text();
        city8 = $('#service8_city option:selected').text();
        city9 = $('#service9_city option:selected').text();

        budget1 = $('#service1_budget').val();
        budget2 = $('#service2_budget').val();
        budget3 = $('#service3_budget').val();
        budget4 = $('#service4_budget').val();
        budget5 = $('#service5_budget').val();
        budget6 = $('#service6_budget').val();
        budget7 = $('#service7_budget').val();
        budget8 = $('#service8_budget').val();
        budget9 = $('#service9_budget').val();

        budget_option1 = $('#service1_around_budget_checkbox').is(':checked');
        budget_option2 = $('#service2_around_budget_checkbox').is(':checked');
        budget_option3 = $('#service3_around_budget_checkbox').is(':checked');
        budget_option4 = $('#service4_around_budget_checkbox').is(':checked');
        budget_option5 = $('#service5_around_budget_checkbox').is(':checked');
        budget_option6 = $('#service6_around_budget_checkbox').is(':checked');
        budget_option7 = $('#service7_around_budget_checkbox').is(':checked');
        budget_option8 = $('#service8_around_budget_checkbox').is(':checked');
        budget_option9 = $('#service9_around_budget_checkbox').is(':checked');

        services = [service1, service2, service3, service4, service5, service6, service7, service8, service9];
        budgets = [budget1, budget2, budget3, budget4, budget5, budget6, budget7, budget8, budget9];

        type1 += "/" + no_of_guests + "/" + decoration;

        data = [service1, type1, city1, budget1, budget_option1, service2, type2, city2, budget2, budget_option2, service3, type3, city3, budget3, budget_option3, service4, type4, city4, budget4, budget_option4, service5, type5, city5, budget5, budget_option5, service6, type6, city6, budget6, budget_option6, service7, type7, city7, budget7, budget_option7, service8, type8, city8, budget8, budget_option8, service9, type9, city9, budget9, budget_option9];
        
//        if(outDate > date ){
//            
            window.location.href = "request_results.jsp?data=" + data;
//            
//            
//        }
//        else{
//            
//            $.rustaMsgBox({'mode': 'error', 'content': 'Please Check the wedding date', 'fadeOut': true});
//        }
        
//        window.location.href = "request_results.jsp?data=" + data;

    });
});

function enable_content(button_id, div_id) {

    if ($('#' + button_id).is(':checked')) {
        $('#' + div_id).find('input,select').attr('disabled', false);
    } else {
        $('#' + div_id).find('input,select').attr('disabled', true);
    }


}

function validate_number(event) {
    if (!(event.keyCode >= 48 && event.keyCode <= 57)) {
        event.preventDefault();
        return false;
    }
    return true;
}
