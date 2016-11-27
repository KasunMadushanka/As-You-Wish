<html>
    <head>
        <style>
            body { font: normal normal normal 10px/1.5 Arial, Helvetica, sans-serif; }

            .ui-dialog-osx {
                -moz-border-radius: 0 0 8px 8px;
                -webkit-border-radius: 0 0 8px 8px;
                border-radius: 0 0 8px 8px; border-width: 0 8px 8px 8px;
            }
        </style>
    </head>
    <body>
        <p>Hello World!
        </p>

        <div id="dialog-message" title="Important information">
            <span class="ui-state-default"><span class="ui-icon ui-icon-info" style="float:left; margin:0 7px 0 0;"></span></span>
            <div style="margin-left: 23px;">
                <p>
                    We're closed during the winter holiday from 21st of December, 2010 until 10th of January 2011.
                    <br /><br />
                    Our hotel will reopen at 11th of January 2011.<br /><br />
                    Another line which demonstrates the auto height adjustment of the dialog component.
                </p></div>
        </div>
        
        <script>
            $("#dialog-message").dialog({
                modal: true,
                draggable: false,
                resizable: false,
                position: ['center', 'top'],
                show: 'blind',
                hide: 'blind',
                width: 400,
                dialogClass: 'ui-dialog-osx',
                buttons: {
                    "I've read and understand this": function() {
                        $(this).dialog("close");
                    }
                }
            });


            setInterval(function(){
              $('#dialog-message').dialog('open');
            },2000);
            
        </script>   
    </body>
</html>


