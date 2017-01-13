
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>
    <!-- Header -->
    <body class="has-side-panel side-panel-left fullwidth-page">

        <% if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        <%}%> 

        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%if (session.getAttribute("type").equals("customer")) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("vendor")) {%>
            <%@ include file="/static/vendor_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("visitor")) {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Terms and Conditions of Use</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="divider bg-lightest">
                    <div class="container">

                        <div class='innerText'>

                            <p>
                                <strong>
                                    1. Terms
                                </strong>
                            </p>

                            <p>
                                By accessing this web site, you are agreeing to be bound by these 
                                web site Terms and Conditions of Use, all applicable laws and regulations, 
                                and agree that you are responsible for compliance with any applicable local 
                                laws. If you do not agree with any of these terms, you are prohibited from 
                                using or accessing this site. The materials contained in this web site are 
                                protected by applicable copyright and trade mark law.
                            </p>

                            <p>
                                <strong>
                                    2. User License
                                </strong>
                            </p>

                            <ol type="a">
                                <li>
                                    Permission is granted to temporarily download one copy of the materials 
                                    (information or software) on Cybersoft's web site for personal, 
                                    non-commercial transitory viewing only. This is the grant of a license, 
                                    not a transfer of title, and under this license you may not:

                                    <ol type="i">
                                        <li>modify or copy the materials;</li>
                                        <li>use the materials for any commercial purpose, or for any public display (commercial or non-commercial);</li>
                                        <li>attempt to decompile or reverse engineer any software contained on Cybersoft's web site;</li>
                                        <li>remove any copyright or other proprietary notations from the materials; or</li>
                                        <li>transfer the materials to another person or "mirror" the materials on any other server.</li>
                                    </ol>
                                </li>
                                <li>
                                    This license shall automatically terminate if you violate any of these restrictions and may be terminated by Cybersoft at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.
                                </li>
                            </ol>
  <br>
                            <p>
                                <strong>
                                    3. Disclaimer
                                </strong>
                            </p>

                            <ol type="a">
                                <li>
                                    The materials on Cybersoft's web site are provided "as is". Cybersoft makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, Cybersoft does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet web site or otherwise relating to such materials or on any sites linked to this site.
                                </li>
                            </ol>
                            <br>
                            <p>
                                <strong>
                                    4. Limitations
                                </strong>
                            </p>

                            <p>
                                In no event shall Cybersoft or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on Cybersoft's Internet site, even if Cybersoft or a Cybersoft authorized representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.
                            </p>

                            <p>
                                <strong>
                                    5. Revisions and Errata
                                </strong>
                            </p>

                            <p>
                                The materials appearing on Cybersoft's web site could include technical, typographical, or photographic errors. Cybersoft does not warrant that any of the materials on its web site are accurate, complete, or current. Cybersoft may make changes to the materials contained on its web site at any time without notice. Cybersoft does not, however, make any commitment to update the materials.
                            </p>

                            <p>
                                <strong>
                                    6. Links
                                </strong>
                            </p>

                            <p>
                                Cybersoft has not reviewed all of the sites linked to its Internet web site and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Cybersoft of the site. Use of any such linked web site is at the user's own risk.
                            </p>

                            <p>
                                <strong>
                                    7. Site Terms of Use Modifications
                                </strong>
                            </p>

                            <p>
                                Cybersoft may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.
                            </p>

                            <p>
                                <strong>
                                    8. Governing Laws
                                </strong>
                            </p>

                            <p>
                                Any claim relating to Cybersoft's web site shall be governed by the laws of the State of Colombo without regard to its conflict of law provisions.
                            </p>

                            <p>
                                General Terms and Conditions applicable to Use of a Web Site.
                            </p>

                        </div>
                    </div>

                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Calendar Event Data -->
        <script src="js/calendar-events-data.js"></script>
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>


    </body>

</html>