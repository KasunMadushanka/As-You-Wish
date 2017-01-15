


<% 
    
    String cus_id = request.getParameter("id"); 
    
    if(cus_id == null){
        response.sendRedirect("weddings.jsp");
    }
    else{
        
    }


    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT * FROM `customer_gallery` where customer_id ='"+cus_id+"' ");
    

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>
        <style>
                        ul1 {
              list-style-type: none;
            }

            .li1 {
              display: inline-block;
            }

            input[type="checkbox"][id^="cb"] {
              display: none;
            }

            label {
              border: 1px solid #fff;
              padding: 10px;
              display: block;
              position: relative;
              margin: 10px;
              cursor: pointer;
            }

            label:before {
              background-color: white;
              color: white;
              content: " ";
              display: block;
              border-radius: 50%;
              border: 1px solid grey;
              position: absolute;
              top: -5px;
              left: -5px;
              width: 25px;
              height: 25px;
              text-align: center;
              line-height: 28px;
              transition-duration: 0.4s;
              transform: scale(0);
            }

            label img {
              height: 130px;
              width: 220px;
              transition-duration: 0.2s;
              transform-origin: 50% 50%;
            }

            :checked + label {
              border-color: #ddd;
            }

            :checked + label:before {
              content: "✓";
              background-color: grey;
              transform: scale(1);
            }

            :checked + label img {
              transform: scale(0.9);
              box-shadow: 0 0 5px #333;
              z-index: -1;
            }
            
        </style>
    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
                <!-- end #header -->

                <!-- begin #sidebar -->
                <%
                    String pageTitle = "video";
                    String subPage = "setting_video";
                %>
                <%@ include file="static/navbar.jsp" %>
                <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Video</a></li>
                    <li class="active">Video Settings</li>
                </ol>

                <h1 class="page-header">Video Settings<small> </small></h1>
                <!-- end page-header -->
                
		<!-- begin row -->
                <div class="row">
                    <!-- begin col-10 -->
                    <div class="col-md-12">
			<!-- begin panel -->
                    <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title"> Settings </h4>
                        </div>
                        <div class="panel-body">
                            <section class="form-horizontal">
                                
                                <form action="controllers/insertVideo.jsp">
                                
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Video Title</label>
                                    <div class="col-md-9">
                                        <input id="title" name="title" type="text" class="form-control" placeholder="Our Journey Together" />
                                        <input type="hidden" name="ID" value="<%= cus_id  %>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Greeting Text</label>
                                    <div class="col-md-9">
                                        <input id="greeting" name="greeting" type="text" class="form-control" placeholder="Happy Wedded Life" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Image Selection</label>
                                    <div class="col-md-9">
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSelect" id="Man" checked="checked" value="Man"> Manually
                                            
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="radioSelect" id="Auto" value="Auto"> Automatically
                                            
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">No.of Images</label>
                                    <div class="col-md-4">
                                        <input id="image_count" name="image_count" type="text" class="form-control" placeholder="20" />
                                    </div>
                                </div>
                                
                                
                                <div class="form-group">
                                    <label class="col-md-2 control-label"></label>
                                    <div class="col-md-9">
                                       
                                        <button id="video_settings_button" type="submit"  class="btn btn-sm btn-success" >Submit Button</button>
                                    </div>
                                    
                                </div>
                            </section>
                        </div>
                                    
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-10 -->
                </div>
                <!-- end row -->
                
                <!-- #####################       Images              -->
                <div class="row" >
                    <!-- begin col-10 -->
                    <div class="col-md-12" >
			<!-- begin panel -->
                    <div class="panel panel-inverse" data-sortable-id="form-stuff-1" id="ImageBox">
                        <div class="panel-body">
                            <section class="form-horizontal">
                                <div>
                                    
                                    
                                        <ul>
                                            <%
                                                int i =1;
                                                while(rs.next()){ %>
                                                    
                                                <li class="li1"><input type="checkbox" id="cb<%= i %>" name="imgs" value="<%= i %>" />
                                                    
                                                    <label for="cb<%= i %>"><img src="../<%= rs.getString("image_url") %>" /></label>
                                                    </li>
                                                
                                                <%
                                                    
                                                    i++;
                                                }
                                            %>
                                            
                                            
                                          </ul>
                                            
                                            </form>
                                    </div>
                            </section>
                        </div>
                                    
                    </div>
                    <!-- end panel -->
                </div>
                <!-- end col-10 -->
                </div>
                
            </div>  

            <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>

        </div>

        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>

        <script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
        <script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
        <script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/js/table-manage-default.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>

        <script>
            $(document).ready(function () {
                App.init();
                TableManageDefault.init();
            });
            $('#myModal1').modal({
                show: true
            });
            
            //radioSelect
            
            
            
            
            $(document).ready(function() {
                
              $("#image_count").attr('disabled','disabled');
                
                
                $('input[type=radio][name=radioSelect]').change(function() {
                    
                    if (this.value == 'Man') {
                        $("#image_count").attr('disabled','disabled');
                        $("#ImageBox").show()();
                         
                    }
                    else if (this.value == 'Auto') {
                        $("#ImageBox").hide();
                        $("#image_count").removeAttr("disabled"); 
                        //
                    }
                });
            });
            
            

        </script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-53034621-1', 'auto');
            ga('send', 'pageview');
        </script>
    </body>

</html>

