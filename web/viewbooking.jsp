<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
    <title>Đơn đặt hàng của bạn</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #333;
            font-family: 'Roboto', 'Arial', sans-serif;
            padding-top: 20px;
        }
        .container {
            background-color: #DCDCDC;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        h1, h3 {
            color: #333;
            border-bottom: 2px solid #000;
            padding-bottom: 10px;
            margin-bottom: 20px;
            font-family: 'Georgia', serif;
        }
        table {
            background-color: #ffffff;
            color: #333;
        }
        th {
            background-color: #000;
            color: #ffffff;
        }
        .btn-info {
            background-color: #5bc0de;
            border: none;
        }
        .btn-danger {
            background-color: #d9534f;
            border: none;
        }
        .btn-warning {
            background-color: #f0ad4e;
            border: none;
        }
        .btn-primary {
            background-color: #0275d8;
            border: none;
        }
        .btn {
            margin: 0 5px;
        }
        .collapse {
            margin-top: 10px;
        }
        textarea {
            margin-right: 10px;
        }
        .btn-back {
            position: fixed;
            bottom: 20px;
            left: 20px;
            background-color: #6c757d;
            border-color: #6c757d;
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
    </style>
</head>
<body style="background-image: url('images/vb5.jpg')">
    <div class="container">
        <h1 class="text-center">Đơn đặt hàng của bạn</h1>
        <div class="row">
            <div class="col-md-6">
                <!-- Waiting Bookings Section -->
                <div id="waiting">
                    <h3>Đang chờ duyệt</h3>
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Ngày booking</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                                <th>Hủy đơn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                <c:if test="${Booking.status == 0}">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${Booking.getDateCreated()}</td>
                                        <td>${Booking.getStatus()}</td>
                                        <td>
                                            <button data-bookingid="${Booking.bookId}" class="btn btn-info" onclick="openPopup(this)">Chi tiết</button>
                                        </td>
                                        <td>
                                            <form action="cancelbooking" method="post">
                                                <input type="hidden" name="bookingId" value="${Booking.bookId}">
                                                <input type="submit" class="btn btn-danger" value="Hủy đơn">
                                            </form>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Confirmed Bookings Section -->
                <div id="confirmed">
                    <h3>Đang hoạt động</h3>
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Ngày booking</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                <c:if test="${Booking.status == 1 || Booking.status == 2}">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${Booking.dateCreated}</td>
                                        <td>${Booking.status}</td>
                                        <td>
                                            <button data-bookingid="${Booking.bookId}" class="btn btn-info" onclick="openPopup(this)">Chi tiết</button>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-6">
                <!-- Finished Bookings Section -->
                <div id="finished">
                    <h3>Đã hoàn thành</h3>
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Ngày booking</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                <c:if test="${Booking.status == 3}">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${Booking.dateCreated}</td>
                                        <td>${Booking.status}</td>
                                        <td>
                                            <button data-bookingid="${Booking.bookId}" class="btn btn-info" onclick="openPopup(this)">Chi tiết</button>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Cancelled Bookings Section -->
                <div id="cancelled">
                    <h3>Đơn đã bị hủy</h3>
                    <table class="table table-hover table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Ngày booking</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="Booking" items="${userBooking}" varStatus="loop">
                                <c:if test="${Booking.status == 4}">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${Booking.dateCreated}</td>
                                        <td>${Booking.status}</td>
                                        <td>
                                            <button data-bookingid="${Booking.bookId}" class="btn btn-info" onclick="openPopup(this)">Chi tiết</button>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-back" onclick="window.location.href = 'homepage'">Quay lại</button>

    <script>
        function openPopup(button) {
            // Get bookId from the 'data-bookingid' attribute of the button
            var bookId = button.getAttribute('data-bookingid');

            // URL of the servlet bookingdetail
            var url = "detailbooking?bookId=" + bookId;

            // Popup window attributes
            var width = 800;
            var height = 600;
            var left = (screen.width - width) / 2;
            var top = (screen.height - height) / 2;

            // Open popup window
            window.open(url, "_blank", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
        }
    </script>
</body>
