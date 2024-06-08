<%-- 
    Document   : service
    Created on : Mar 13, 2024, 10:12:42 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Dịch Vụ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
        <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
        <meta name="author" content="FREEHTML5.CO" />


        <!-- Facebook and Twitter integration -->
        <meta property="og:title" content=""/>
        <meta property="og:image" content=""/>
        <meta property="og:url" content=""/>
        <meta property="og:site_name" content=""/>
        <meta property="og:description" content=""/>
        <meta name="twitter:title" content="" />
        <meta name="twitter:image" content="" />
        <meta name="twitter:url" content="" />
        <meta name="twitter:card" content="" />

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">
        <!-- <link href='https://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700italic,900,700,900italic' rel='stylesheet' type='text/css'> -->

        <!-- Stylesheets -->
        <!-- Dropdown Menu -->
        <link rel="stylesheet" href="css/superfish.css">
        <!-- Owl Slider -->
        <!-- <link rel="stylesheet" href="css/owl.carousel.css"> -->
        <!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
        <!-- Date Picker -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.min.css">
        <!-- CS Select -->
        <link rel="stylesheet" href="css/cs-select.css">
        <link rel="stylesheet" href="css/cs-skin-border.css">

        <!-- Themify Icons -->
        <link rel="stylesheet" href="css/themify-icons.css">
        <!-- Flat Icon -->
        <link rel="stylesheet" href="css/flaticon.css">
        <!-- Icomoon -->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div id="fh5co-wrapper">
            <div id="fh5co-page">
                <div id="fh5co-header">
                    <header id="fh5co-header-section">
                        <div class="container">
                            <div class="nav-header">
                                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
                                <h1 id="fh5co-logo"><a href="homepage">BPLH</a></h1>
                                <nav id="fh5co-menu-wrap" role="navigation">
                                    <ul class="sf-menu" id="fh5co-primary-menu">
                                        <li><a href="homepage">Trang Chủ</a></li>
                                        <li>
                                            <a class="active" href="room" class="fh5co-sub-ddown">Phòng</a>
                                            <ul class="fh5co-sub-menu">
                                                <li><a href="#">Deluxe Family Triple</a></li>
                                                <li><a href="#">Executive Suite</a></li>
                                                <li><a href="#">Deluxe King</a></li>
                                                <li><a href="#">Royal Suite</a></li> 
                                                <li><a href="#">Presidential Suite</a></li> 
                                                <li><a href="#">Deluxe Twin</a></li> 
                                            </ul>
                                        </li>
                                        <li><a href="service">Dịch Vụ</a></li>
                                        <li><a href="blog">Bài Viết</a></li>
                                        <li><a href="contact">Liên Hệ</a></li>
                                            <c:if test="${loggedInAccount == null}">
                                            <li><a href="login">Đăng Nhập</a></li>
                                            <li><a href="signup">Đăng Ký</a></li>
                                            </c:if>
                                            <c:if test="${loggedInAccount != null}">
                                            <li>
                                                <a class="fh5co-sub-ddown">${loggedInAccount.fullName}</a>
                                                <ul class="fh5co-sub-menu">
                                                    <li><a href="#">Thông tin cá nhân</a></li>
                                                    <li><a href="#">Lịch sử đặt phòng </a></li> 
                                                    <hr class="dropdown-divider">
                                                    <c:if test="${loggedInAccount.role.roleId == 1}">
                                                        <li><a href="#">Quản lí phòng</a></li>
                                                        <li><a href="#">Báo cáo doanh thu</a></li>
                                                        <hr class="dropdown-divider">
                                                    </c:if>
                                                    <li><a href="logout">Logout </a></li>
                                                </ul>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </header>

                </div>
                <!-- end:fh5co-header -->
                <div class="fh5co-parallax" style="background-image: url(images/sv1.jpg);" data-stellar-background-ratio="0.5">
                    <div class="overlay"></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-center fh5co-table">
                                <div class="fh5co-intro fh5co-table-cell">
                                    <h1 class="text-center">Dịch vụ tận tâm, trải nghiệm hoàn hảo</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div id="fh5co-services-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-location-pin"></i></span>
                                    <div class="desc">
                                        <h3>Địa Điểm Thuận Tiện</h3>
                                        <p>Được xây dựng ở nơi có giao thông thuận tiện, cảnh quan xung quanh sạch, đẹp. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-alarm-clock"></i></span>
                                    <div class="desc">
                                        <h3>Mở Cửa 24/7</h3>
                                        <p>Lễ tân, bảo vệ túc trực 24/24h, đảm bảo trải nghiệm của bạn luôn là tốt nhất ở mọi thời điểm.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-calendar"></i></span>
                                    <div class="desc">
                                        <h3>Đặt Phòng</h3>
                                        <p>Cung cấp nhiều sự lựa chọn tùy thuộc vào nhu cầu của bạn, đa dạng về phương thức thanh toán. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-user"></i></span>
                                    <div class="desc">
                                        <h3>Nhân Viên Thân Thiện</h3>
                                        <p>Nhân viên phục vụ có tay nghề cao, đúng theo quy trình kỹ thuật nghiệp vụ, chất lượng phục vụ hoàn hảo.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-signal"></i></span>
                                    <div class="desc">
                                        <h3>Wifi Miễn Phí</h3>
                                        <p>Cho bạn những trải nghiệm Wifi tuyệt vời với độ trễ thấp cùng tốc độ tối ưu nhất bất kể bạn ở đâu trong khách sạn.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="services">
                                    <span><i class="ti-menu"></i></span>
                                    <div class="desc">
                                        <h3>Delicious Meal</h3>
                                        <p>Thực đơn đa dạng được nấu bởi các đầu bếp hàng đầu, đem đến cho bạn những trải nghiệm thăng hoa của vị giác. </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <footer id="footer" class="fh5co-bg-color">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="copyright">
                                    <p><small>&copy; 2016-2024. <br> All Rights Reserved. <br>
                                            Designed by MT <br> 
                                            </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h3>Doanh Nghiệp</h3>
                                                        <ul class="link">
                                                            <li><a href="#">Về Chúng Tôi</a></li>
                                                            <li><a href="#">Các Loại Phòng</a></li>
                                                            <li><a href="#">Chăm Sóc Khách Hàng</a></li>
                                                            <li><a href="#">Liên Hệ</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h3>Dịch Vụ</h3>
                                                        <ul class="link">
                                                            <li><a href="#">Nhà Hàng</a></li>
                                                            <li><a href="#">Bar</a></li>
                                                            <li><a href="#">Đưa Đón</a></li>
                                                            <li><a href="#">Hồ Bơi</a></li>
                                                            <li><a href="#">Spa</a></li>
                                                            <li><a href="#">Gym</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <h3>Đóng Góp</h3>
                                                        <p>Hãy cho chúng tôi biết thêm về những trải nghiệm của bạn. Cảm ơn bạn vì đã đồng hành cùng chúng tôi.</p>
                                                        <form action="#" id="form-subscribe">
                                                            <div class="form-field">
                                                                <input type="email" placeholder="Địa chỉ email" id="email">
                                                                <input type="submit" id="submit" value="Gửi">
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <ul class="social-icons">
                                                    <li>
                                                        <a href="#"><i class="icon-twitter-with-circle"></i></a>
                                                        <a href="#"><i class="icon-facebook-with-circle"></i></a>
                                                        <a href="#"><i class="icon-instagram-with-circle"></i></a>
                                                        <a href="#"><i class="icon-linkedin-with-circle"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                </div>
                            </div>
                            </footer>

                        </div>
                        <!-- END fh5co-page -->

                    </div>
                    <!-- END fh5co-wrapper -->

                    <!-- Javascripts -->
                    <script src="js/jquery-2.1.4.min.js"></script>
                    <!-- Dropdown Menu -->
                    <script src="js/hoverIntent.js"></script>
                    <script src="js/superfish.js"></script>
                    <!-- Bootstrap -->
                    <script src="js/bootstrap.min.js"></script>
                    <!-- Waypoints -->
                    <script src="js/jquery.waypoints.min.js"></script>
                    <!-- Counters -->
                    <script src="js/jquery.countTo.js"></script>
                    <!-- Stellar Parallax -->
                    <script src="js/jquery.stellar.min.js"></script>
                    <!-- Owl Slider -->
                    <!-- // <script src="js/owl.carousel.min.js"></script> -->
                    <!-- Date Picker -->
                    <script src="js/bootstrap-datepicker.min.js"></script>
                    <!-- CS Select -->
                    <script src="js/classie.js"></script>
                    <script src="js/selectFx.js"></script>
                    <!-- Flexslider -->
                    <script src="js/jquery.flexslider-min.js"></script>

                    <script src="js/custom.js"></script>
                    <!--Start of Tawk.to Script-->
                    <script type="text/javascript">
                        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                        (function () {
                            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                            s1.async = true;
                            s1.src = 'https://embed.tawk.to/66029bc4a0c6737bd124dda3/1hpt30uln';
                            s1.charset = 'UTF-8';
                            s1.setAttribute('crossorigin', '*');
                            s0.parentNode.insertBefore(s1, s0);
                        })();
                    </script>
                    <!--End of Tawk.to Script-->
                    </body>
                    </html>
