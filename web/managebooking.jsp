
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
    <style>
        #bookingTable{
            display: flex;
            justify-content: center;
            flex-direction: column;
        }
        #bookingTable > div{
            background-color: white;
            width: 100%;
            margin: 2%;
            border-radius: 18px;
            border: 1px solid;
        }
        .btn-back {
            position: fixed;
            bottom: 20px;
            left: 20px;
            background-color: #6c757d;
            border-color: #6c757d;
            color: #eaeaea;
        }
        .btn-back:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
    </style>
</head>
<body style="background-color:#dfefff">
    <h1 class="text-center">Quản lý đơn hàng</h1>
    <div class="col-12 mb-3 mb-lg-5">
        <div class="table-responsive">
            <div id="waiting">
                <h3>Đang chờ duyệt</h3>
                <table class="table mb-0">
                    <thead class="small text-uppercase bg-body text-muted">
                        <tr>
                            <td style="color:black; font-weight: bold;">BookingId</td>
                            <td style="color:black; font-weight: bold;">CCCD</td>
                            <td style="color:black; font-weight: bold;">Ngày đặt</td>
                            <td style="color:black; font-weight: bold;">Trạng thái</td>
                            <td style="color:black; font-weight: bold;">Chi tiết</td>
                            <td style="color:black; font-weight: bold;">Check in</td>
                            <td style="color:black; font-weight: bold;">Hủy đơn</td>
                        </tr>
                    </thead>
                    <c:if test="${allBooking != null}">
                        <tbody>
                            <c:forEach var="Booking" items="${allBooking}">
                                <c:if test="${Booking.status == 0}">
                                    <tr>
                                        <td>${Booking.bookId}</td>
                                        <td>${Booking.identityCard}</td>
                                        <td>${Booking.dateCreated}</td>
                                        <td>Đang chờ duyệt</td>
                                        <td>
                                            <form>
                                                <input type="button" data-bookingid="${Booking.bookId}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="proceedbooking" method="post">
                                                <input type="hidden" name="status" value="1">
                                                <input type="hidden" name="bookingId" value="${Booking.bookId}">
                                                <input type="submit" class="btn btn-success" value="Xác nhận đơn">
                                            </form>
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
                    </c:if>
                </table>
            </div>

            <div id="confirmed">
                <h3>Đã xác nhận</h3>
                <table class="table mb-0">
                    <thead class="small text-uppercase bg-body text-muted">
                        <tr>
                            <td style="color:black; font-weight: bold;">BookingId</td>
                            <td style="color:black; font-weight: bold;">CCCD</td>
                            <td style="color:black; font-weight: bold;">Ngày đặt</td>
                            <td style="color:black; font-weight: bold;">Trạng thái</td>
                            <td style="color:black; font-weight: bold;">Chi tiết</td>
                            <td style="color:black; font-weight: bold;">Check in</td>
                            <td style="color:black; font-weight: bold;">Hủy đơn</td>
                        </tr>
                    </thead>

                    <c:if test="${allBooking != null}">
                        <tbody>
                            <c:forEach var="Booking" items="${allBooking}">
                                <c:if test="${Booking.status == 1}">
                                    <tr>
                                        <td style="color:black; font-weight: bold;">${Booking.bookId}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.identityCard}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.dateCreated}</td>
                                        <td style="color:black; font-weight: bold;">Đã xác nhận</td>
                                        <td style="color:black; font-weight: bold;">
                                            <form>
                                                <input type="button" data-bookingid="${Booking.bookId}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                            </form>
                                        </td>
                                        <td style="color:black; font-weight: bold;">
                                            <form action="proceedbooking" method="post">
                                                <input type="hidden" name="status" value="2">
                                                <input type="hidden" name="bookingId" value="${Booking.bookId}">
                                                <input type="submit" class="btn btn-success" value="Đã checkin">
                                            </form>
                                        </td>
                                        <td style="color:black; font-weight: bold;">
                                            <form action="cancelbooking" method="post">
                                                <input type="hidden" name="identityCard" value="${Booking.identityCard}">
                                                <input type="hidden" name="bookingId" value="${Booking.bookId}">
                                                <input type="submit" class="btn btn-danger" value="Hủy đơn">
                                            </form>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div>

            <div id="checkedin">
                <h3>Đang xử lý</h3>
                <table class="table mb-0">
                    <thead class="small text-uppercase bg-body text-muted">
                        <tr>
                            <td style="color:black; font-weight: bold;">BookingId</td>
                            <td style="color:black; font-weight: bold;">CCCD</td>
                            <td style="color:black; font-weight: bold;">Ngày đặt</td>
                            <td style="color:black; font-weight: bold;">Trạng thái</td>
                            <td style="color:black; font-weight: bold;">Chi tiết</td>
                            <td style="color:black; font-weight: bold;">Hoàn thành đơn</td>
                        </tr>
                    </thead>
                    <c:if test="${allBooking != null}">
                        <tbody>
                            <c:forEach var="Booking" items="${allBooking}">
                                <c:if test="${Booking.status == 2}">
                                    <tr>
                                        <td style="color:black; font-weight: bold;">${Booking.bookId}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.identityCard}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.dateCreated}</td>
                                        <td style="color:black; font-weight: bold;">Đang xử lý</td>
                                        <td style="color:black; font-weight: bold;">
                                            <form>
                                                <input type="button" data-bookingid="${Booking.bookId}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="proceedbooking" method="post">
                                                <input type="hidden" name="status" value="3">
                                                <input type="hidden" name="bookingId" value="${Booking.bookId}">
                                                <input type="submit" class="btn btn-success" value="Hoàn thành">
                                            </form>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div>

            <div id="finished">
                <h3>Đã hoàn thành</h3>
                <table class="table mb-0">
                    <thead class="small text-uppercase bg-body text-muted">
                        <tr>
                            <td style="color:black; font-weight: bold;">BookingId</td>
                            <td style="color:black; font-weight: bold;">CCCD</td>
                            <td style="color:black; font-weight: bold;">Ngày đặt</td>
                            <td style="color:black; font-weight: bold;">Trạng thái</td>
                            <td style="color:black; font-weight: bold;">Chi tiết</td>
                        </tr>
                    </thead>
                    <c:if test="${allBooking != null}">
                        <tbody>
                            <c:forEach var="Booking" items="${allBooking}">
                                <c:if test="${Booking.status == 3}">
                                    <tr>
                                        <td style="color:black; font-weight: bold;">${Booking.bookId}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.identityCard}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.dateCreated}</td>
                                        <td style="color:black; font-weight: bold;">Đã hoàn thành</td>
                                        <td style="color:black; font-weight: bold;">
                                            <form>
                                                <input type="button" data-bookingid="${Booking.bookId}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                            </form>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div>

            <div id="cancelled">
                <h3>Đơn đã bị hủy</h3>
                <table class="table mb-0">
                    <thead class="small text-uppercase bg-body text-muted">
                        <tr>
                            <td style="color:black; font-weight: bold;">BookingId</td>
                            <td style="color:black; font-weight: bold;">CCCD</td>
                            <td style="color:black; font-weight: bold;">Ngày đặt</td>
                            <td style="color:black; font-weight: bold;">Trạng thái</td>
                            <td style="color:black; font-weight: bold;">Chi tiết</td>
                        </tr>
                    </thead>
                    <c:if test="${allBooking != null}">
                        <tbody>
                            <c:forEach var="Booking" items="${allBooking}">
                                <c:if test="${Booking.status == 4}">
                                    <tr>
                                        <td style="color:black; font-weight: bold;">${Booking.bookId}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.identityCard}</td>
                                        <td style="color:black; font-weight: bold;">${Booking.dateCreated}</td>
                                        <td style="color:black; font-weight: bold;">Đã bị hủy</td>
                                        <td style="color:black; font-weight: bold;">
                                            <form>
                                                <input type="button" data-bookingid="${Booking.bookId}" class="btn btn-info" value="Chi tiết" onclick="openPopup(this)">
                                            </form>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div>
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
        </div>
    </div>
    <button class="btn btn-primary btn-back" onclick="window.location.href = 'admin'">Quay lại</button>

</body>
