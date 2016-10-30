$(document).ready(function () {
    $('#search_button').click(function ()
    {
        term = $('#search').val();
        
       
        $.ajax({
            type: "post",
            url: "controllers/vendor_search.jsp",
            data: "term="+term+"&service=1",
            success: function (msg) {
               $('#content').html(msg);
             
            },
            error: function (error) {
                alert(error);

            }

        });

    });

});