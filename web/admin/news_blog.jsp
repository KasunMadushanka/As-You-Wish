<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%    String id = (String) session.getAttribute("id");

    session.setAttribute("page", "news_blog");

    ArrayList list = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select nb.*,a.name,a.img from news_blog nb inner join adminac a on nb.admin_id=a.admin_id");
    while (rs.next()) {

        String data[] = new String[10];

        data[0] = rs.getString("nb.post_id");
        data[1] = rs.getString("nb.date");
        data[2] = rs.getString("nb.time");
        data[3] = rs.getString("nb.title");
        data[4] = rs.getString("nb.content");
        data[5] = rs.getString("nb.image_url");
        data[6] = rs.getString("nb.likes");
        data[7] = rs.getString("nb.comments");
        data[8] = rs.getString("a.name");
        data[9] = rs.getString("a.img");

        list.add(data);

    }
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

        <script src="myjs/new_post.js"></script>
        <script src="myjs/image_upload.js"></script>
        <script src="myjs/update_post.js"></script>

    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">News Blog</a></li>
                </ol>

                <h1 class="page-header">Timeline<small>  News Blog</small></h1>

                <div style="position: relative;top:-30 px;left:975px;padding-bottom: 15px;"> 
                    <a href="#modal-post" class="btn btn-sm btn-success" data-toggle="modal">Write New Post</a>
                </div>

                <!-- end page-header -->

                <!-- begin timeline -->
                <ul class="timeline">
                    <%for (int i = 0; i < list.size(); i++) {
                            String fields[] = (String[]) list.get(i);
                    %>
                    <li>
                        <!-- begin timeline-time -->
                        <div class="timeline-time">
                            <span class="date"><%=fields[1]%></span>
                            <span class="time"><%=fields[2]%></span>
                        </div>
                        <!-- end timeline-time -->
                        <!-- begin timeline-icon -->
                        <div class="timeline-icon">
                            <a href="javascript:;"><i class="fa fa-comments"></i></a>
                        </div>
                        <!-- end timeline-icon -->
                        <!-- begin timeline-body -->
                        <div class="timeline-body">
                            <div class="timeline-header">
                                <span class="userimage"><img src="<%=fields[9]%>" alt="" /></span>
                                <span class="username"><%=fields[8]%></span>
                            </div>
                            <div class="timeline-content">
                                <h4 class="template-title">
                                    <%=fields[3]%>
                                </h4>
                                <p class="m-t-20">
                                    <img src="<%=fields[5]%>" alt="" />
                                </p>
                                <p><%=fields[4]%></p>                            
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <a id="<%=fields[0]%>" href="" onclick="update_like(<%=fields[0]%>,<%=fields[6]%>); return false;"><i class="fa fa-thumbs-up fa-fw"></i><%=fields[6]%></a>
                                <a style="position: relative;left:20px;"><i class="fa fa-comments fa-fw"></i><span id="comments_count<%=fields[0]%>"><%=fields[7]%></span></a>                             
                                <a href="" onclick="view_comments(<%=fields[0]%>); return false;" style="position: relative;left:425px;"><i class="fa fa-comments fa-fw"></i> View Comments</a>
                            </div>
                            <input id="text<%=fields[0]%>" class="form-control" onkeypress="update_comment(<%=fields[0]%>, event)" placeholder="Write a comment..."/>
                        </div>

                    </li>
                    <%}%>

                </ul>


            </div>

        </div>

        <div class="modal fade" id="modal-post">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Write New Post</h4>
                    </div>
                    <div class="modal-body">

                        <img id="output" style="padding-bottom: 20px;"/>

                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                output.width = 570;
                                output.height = 350;


                                output.src = URL.createObjectURL(event.target.files[0]);

                            };
                        </script>
                        <div class="form-group">
                            <label for="form_title">Subject</label>
                            <input id="form_title" name="form_title" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="form_content">Content</label>
                            <textarea id="form_content" name="form_content" class="form-control" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-4">
                            <form id="form_upload_news_blog">
                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                            </form>
                        </div>
                        <div class="col-md-8">
                            <a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
                            <button type="button" class="btn btn-sm btn-success" onclick="new_post()">Post</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-comments">
            <div id="modal-comments" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Comments</h4>
                    </div>
                    <div id="comments-form" class="modal-body">
                       
                    </div>
                </div>
            </div>
        </div>



        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>


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

        <script src="assets/js/jquery.rustaMsgBox.js"></script>
    </body>

</html>

