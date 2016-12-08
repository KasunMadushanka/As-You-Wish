<%@page import="java.util.ArrayList"%>
<%
    ArrayList services = (ArrayList) session.getAttribute("services");
%>

<header id="header" class="header">
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
                          
                            <li><a href="#">Gallery</a>
                                <ul class="dropdown">
                                    <%for (int i = 0; i < services.size(); i++) {
                                            String[] values = (String[]) services.get(i);%>
                                    <li><a href="vendor_gallery.jsp?id=<%=(String) session.getAttribute("id")%>&service=<%=values[0]%>"><%=values[1]%></a></li>
                                        <%}%>
                                </ul>
                            </li>
                            <li><a href="#">Calendar</a>
                                <ul class="dropdown">
                                    <%for (int i = 0; i < services.size(); i++) {
                                            String[] values = (String[]) services.get(i);%>
                                    <li><a href="calendar.jsp?id=<%=(String) session.getAttribute("id")%>&service=<%=values[0]%>"><%=values[1]%></a></li>
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
                            <li><a href="" onclick="logout(); return false;">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>