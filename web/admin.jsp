<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Focus - Bootstrap Admin Dashboard </title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="ad/images/favicon.png">
        <link rel="stylesheet" href="ad/vendor/owl-carousel/css/owl.carousel.min.css">
        <link rel="stylesheet" href="ad/vendor/owl-carousel/css/owl.theme.default.min.css">
        <link href="ad/vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
        <link href="ad/css/style.css" rel="stylesheet">
    </head>

    <body>

        <!--*******************
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="sk-three-bounce">
                <div class="sk-child sk-bounce1"></div>
                <div class="sk-child sk-bounce2"></div>
                <div class="sk-child sk-bounce3"></div>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->

        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="line"></span><span class="line"></span><span class="line"></span>
                    </div>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
                Header start
            ***********************************-->
            <div class="header">
                <div class="header-content">
                    <nav class="navbar navbar-expand">
                        <div class="collapse navbar-collapse justify-content-between">
                            <div class="header-left">
                            </div>
                            <ul class="navbar-nav header-right">
                                <li class="nav-item dropdown header-profile">
                                    <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                                        <i class="mdi mdi-account"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a href="profile" class="dropdown-item">
                                            <i class="icon-user"></i>
                                            <span class="ml-2">Profile </span>
                                        </a>
                                        <a href="logout" class="dropdown-item">
                                            <i class="icon-key"></i>
                                            <span class="ml-2">Logout </span>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="quixnav">
                <div class="quixnav-scroll">
                    <ul class="metismenu" id="menu">
                        <li class="nav-label first">Main Menu</li>
                        <li>
                            <a href="roommanager" aria-expanded="false">
                                <i class="icon icon-single-04"></i>
                                <span class="nav-text">Manage rooms</span>
                            </a>
                        </li>
                        <li>
                            <a href="servicemanager" aria-expanded="false">
                                <i class="icon icon-app-store"></i>
                                <span class="nav-text">Manage services</span>
                            </a>
                        </li>

                        <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                                    class="icon icon-chart-bar-33"></i><span class="nav-text">Manage discount</span></a>
                            <ul aria-expanded="false">
                                <li><a href="managediscount">View discount</a></li>
                                <li><a href="discount">Add discount</a></li>

                            </ul>
                        </li>
                        <li>
                            <a href="customermanage" aria-expanded="false">
                                <i class="icon-people"></i>
                                <span class="nav-text"> Manage customer</span>
                            </a>
                        </li>
                        <li>
                            <a href="priceconfig" aria-expanded="false">
                                <i class="icon icon-analytics"></i>
                                <span class="nav-text">Manage price</span>
                            </a>
                        </li>
                        <li>
                            <a href="managebooking" aria-expanded="false">
                                <i class="icon-calender"></i>
                                <span class="nav-text">Manage booking</span>
                            </a>
                        </li>
                        <li>
                            <a href="reportincome" aria-expanded="false">
                                <i class="icon-calculator"></i>
                                <span class="nav-text">Report income</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body">
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">Doanh thu trong tuần</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-xl-12 col-lg-8">
                                                    <canvas id="daily-income-chart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4 class="card-title">New Bookings</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Identity Card</th>
                                                            <th>Room ID</th>
                                                            <th>Number of People</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="booking" items="${latestBookings}">
                                                            <tr>
                                                                <td>${booking.bookId}</td>
                                                                <td>${booking.identityCard}</td>
                                                                <td>${booking.roomId}</td>
                                                                <td>${booking.numberOfPeople}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${booking.status == 3}">
                                                                            <span class="badge badge-success">Done</span>
                                                                        </c:when>
                                                                        <c:when test="${booking.status == 4}">
                                                                            <span class="badge badge-danger">Remove</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="badge badge-warning">Pending</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-3 col-md-12">
                            <div class="row">
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <div class="card">
                                        <div class="stat-widget-two card-body">
                                            <div class="stat-content">
                                                <div class="stat-text">Total Income</div>
                                                <div class="stat-digit">${totalIncome}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
            Scripts
        ***********************************-->
        <!-- Required vendors -->
        <script src="ad/vendor/global/global.min.js"></script>
        <script src="ad/js/quixnav-init.js"></script>
        <script src="ad/js/custom.min.js"></script>

        <!-- Vectormap -->
        <script src="ad/vendor/raphael/raphael.min.js"></script>
        <script src="ad/vendor/morris/morris.min.js"></script>

        <script src="ad/vendor/circle-progress/circle-progress.min.js"></script>
        <script src="ad/vendor/chart.js/Chart.bundle.min.js"></script>

        <script src="ad/vendor/gaugeJS/dist/gauge.min.js"></script>

        <!--  flot-chart js -->
        <script src="ad/vendor/flot/jquery.flot.js"></script>
        <script src="ad/vendor/flot/jquery.flot.resize.js"></script>

        <!-- Owl Carousel -->
        <script src="ad/vendor/owl-carousel/js/owl.carousel.min.js"></script>

        <!-- Counter Up -->
        <script src="ad/vendor/jqvmap/js/jquery.vmap.min.js"></script>
        <script src="ad/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
        <script src="ad/vendor/jquery.counterup/jquery.counterup.min.js"></script>

        <script src="ad/js/dashboard/dashboard-1.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
        <script>
// Ensure the dailyIncomeData is available globally
            var dailyIncomeData = [];

            <c:forEach var="dayIncome" items="${dailyIncome}">
            dailyIncomeData.push(${dayIncome});
            </c:forEach>

// Check if the dailyIncomeData is defined
            if (dailyIncomeData.length > 0) {
                // Define a function to create the chart
                function createChart() {
                    var ctx = document.getElementById('daily-income-chart').getContext('2d');
                    var chart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'],
                            datasets: [{
                                    label: 'Doanh thu hàng ngày',
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderColor: 'rgba(75, 192, 192, 1)',
                                    borderWidth: 1,
                                    data: dailyIncomeData // Use dailyIncomeData here
                                }]
                        },
                        options: {
                            scales: {
                                yAxes: [{
                                        ticks: {
                                            beginAtZero: true
                                        }
                                    }]
                            }
                        }
                    });
                }

                // Call the createChart function after the DOM is fully loaded
                document.addEventListener('DOMContentLoaded', createChart);
            } else {
                console.error('dailyIncomeData is not defined. Check if it is properly initialized in your JSP.');
            }
        </script>



    </body>

</html>
