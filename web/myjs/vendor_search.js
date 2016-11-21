$(document).ready(function () {
    $('#search_button').click(function ()
    {
       
        term = $('#search').val();
        service_id=$('#service_id').val();
       
         option = $('#search_filter option:selected').val();
         alert(option);
       
        $.ajax({
            type: "post",
            url: "controllers/vendor_search.jsp",
            data: "term="+term+"&service_id="+service_id+"&option="+option,
            success: function (msg) {
               $('#content').html(msg);
             
            },
            error: function (error) {
                alert(error);

            }

        });

    });

});