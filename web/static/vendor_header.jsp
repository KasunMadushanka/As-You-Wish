<%@page import="java.util.ArrayList"%>
<%
    ArrayList services = (ArrayList) session.getAttribute("services");
%>
<script src="myjs/logout.js"></script>
<header id="header" class="header">
    <div id="n"></div>
    <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
        <div class="header-nav-wrapper">
            <div class="container">
                <nav>
                    <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
                        <div id="side-panel-trigger" class="side-panel-trigger"><a href="#"><i class="fa fa-bars font-24 text-gray-silver"></i></a></div>
                        <ul class="menuzord-menu">
                            <li><a href="#">News Blog</a>
                                <ul class="dropdown">
                                    <%for (int i = 0; i < services.size(); i++) {
                                            String[] values = (String[]) services.get(i);%>
                                    <li><a href="vendor_blog.jsp?id=<%=(String) session.getAttribute("id")%>&service=<%=values[0]%>"><%=values[1]%></a></li>
                                        <%}%>
                                </ul>
                            </li>
                            <li><a href="#events">Pricing</a></li>
                            <li><a href="#">Gallery</a>
                                <ul class="dropdown">
                                    <%for (int i = 0; i < services.size(); i++) {
                                            String[] values = (String[]) services.get(i);%>
                                    <li><a href="vendor_gallery.jsp?id=<%=(String) session.getAttribute("id")%>&service=<%=values[0]%>"><%=values[1]%></a></li>
                                        <%}%>
                                </ul>
                            </li>
                            <li><a href="#">Storefront</a>
                                <ul class="dropdown">
                                    <%for (int i = 0; i < services.size(); i++) {
                                            String[] values = (String[]) services.get(i);%>
                                    <li><a href="storefront.jsp?id=<%=(String) session.getAttribute("id")%>&service=<%=values[0]%>"><%=values[1]%></a></li>
                                        <%}%>
                                </ul>
                            </li>
                            <li><a href="#"><img id="bell" src="images/bell1.png" style="position: relative;top: -5px;margin-left:8px;margin-right: 4px;" width="25" height="25"></a>
                                <ul id="notification" class="dropdown">    
                                </ul>
                                <script>
                                    $(document).ready(function () {

                                        $.ajax({
                                            type: "post",
                                            url: "controllers/check_notifications.jsp",
                                            data: "id=" + '<%=session.getAttribute("id")%>' + "&type=" + '<%=session.getAttribute("type")%>',
                                            success: function (msg) {
                                                if (msg !== "") {
                                                    $("#bell").attr("src", "images/bell2.png");
                                                     $('#notification').append(msg);
                                                }else{
                                                   $('ul').not(':has(li)').remove();
                                                }
                                               
                                            },
                                            error: function (error) {
                                                
                                            }

                                        });
                                    });
                                </script>
                            </li>
                            <li><a href="#"><img src="<%=session.getAttribute("image_url")%>" class="img-circle" style="position: relative;top: -10px;margin-left:4px;margin-right: 8px;" width="40" height="40"></a>
                                <ul class="dropdown">                             
                                    <li><a href="vendor_account.jsp">My Account</a></li>
                                    <li><a href="" onclick="logout();
                                            return false;">Sign Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>