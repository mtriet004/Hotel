<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link rel="stylesheet" href="css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tìm phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style2.css"/>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: navy;
        }
        th {
            background-color: #20c997;
            color: navy;
        }
        tr:nth-child(even) {
            background-color: #20c997;
        }
    </style>
</head>
<body style="background-image: url('images/bag.jpg');">
    <form action="confirmbooking">
        <div class='container-fluid row'>
            <div class="col-12 col-md-6">
                <div id="protagonist" class="col-12">
                    <div class="mt-3"> 
                        <!-- Booking Account Details -->
                        <div class="row">
                            <div class="col-6">
                                <p style="color:navy"><strong>Họ và tên:</strong> ${bookingAccount.fullName}</p>
                            </div>
                            <div class="col-6">
                                <p style="color:navy"><strong>Giới tính:</strong> ${bookingAccount.sex}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p style="color:navy"><strong>Quốc tịch:</strong> ${bookingAccount.type}</p>
                            </div>
                            <div class="col-6">
                                <p style="color:navy"><strong>Mã số CCCD:</strong> ${bookingAccount.identityCard}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <p style="color:navy"><strong>Số điện thoại:</strong> ${bookingAccount.phone}</p>
                            </div>
                            <div class="col-6">
                                <p style="color:navy"><strong>Email:</strong> ${bookingAccount.email}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row container-fluid col-12 col-md-6 mt-3">
                <div id="roominfo" class="col-12">
                    <table class="table mb-0 table-striped">
                        <caption style="color:navy">Danh sách phòng đã đặt</caption>
                        <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>Số phòng</th>
                                <th>Loại phòng</th>
                                <th>Dịch vụ</th>
                                <th>Ngày nhận</th>
                                <th>Ngày trả</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${selectedRoom.roomNumber}</td>
                                <td>${selectedRoom.type.typeName}</td>
                                <td>
                                    <ul>
                                        <c:forEach var="service" items="${selectedRoom.type.list_service}">
                                            <li>${service.serviceName}</li>
                                            </c:forEach>
                                    </ul>
                                </td>
                                <td>${dateStartStr}</td>
                                <td>${dateEndStr}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-12">
                    <table class="table mb-0 table-striped">
                        <caption style="color:navy">Danh sách người đi cùng</caption>
                        <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>Họ và Tên</th>
                                <th>CCCD</th>
                                <th>Giới tính</th>
                                <th>Quốc tịch</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var='roommate' items="${listroommate}">
                                <tr>
                                    <td>${roommate.name}</td>
                                    <td>${roommate.identityNumber}</td>
                                    <td>${roommate.sex}</td>
                                    <td>${roommate.type}</td>
                            <input type="hidden" value="${roommate.name}" name="roommatename">
                            <input type="hidden" value="${roommate.identityNumber}" name="identitynumber">
                            <input type="hidden" value="${roommate.sex}" name="roommatesex">
                            <input type="hidden" value="${roommate.type}" name="roommatetype">
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <input type="hidden" name="dateStartStr" value="${dateStartStr}">
                <input type="hidden" name="dateEndStr" value="${dateEndStr}">
                <input type="hidden" name="selectedRoomId" value="${selectedRoom.roomId}">
                <input type="hidden" name="roompriceorigin" value="${roompriceorigin}">
                <input type="hidden" name="hostEmail" value="${bookingAccount.phone}">
                <input type="hidden" name="hostPhone" value="${bookingAccount.phone}">
                <input type="hidden" id="discountedPrice" name="discountedPrice">

                <div class="col-12 text-right">
                    <p>Start Date: <c:out value="${dateStartStr}" default="n/a" /></p>
                    <p>End Date: <c:out value="${dateEndStr}" default="n/a" /></p>
                    <p>Number of Days: ${days}</p>
                    <p>Price: <span id="roomPrice">${roompriceorigin}</span></p>
                    <p>
                        Discount Code: <input type="text" id="discountCode" name="discountCode">
                        <button type="button" onclick="applyDiscount()">Apply Discount</button>
                    </p>
                    <p id="discountMessage" style="color: red;"></p>
                    <button class="btn btn-primary position-relative" type="submit" style="color:navy; background-color: #20c997;">Tiếp tục</button>
                </div>
            </div>
        </div>
        <div class="col-12 text-left">
            <button class="btn btn-primary position-relative mt-3" type="button" style="color:navy; background-color: #20c997;" onclick="goBack()"">Quay về</button>
        </div>
    </form>
    <c:forEach var="discount" items="${allDiscounts}">
        <input type="hidden" class="discountCode" value="${discount.code}">
        <input type="hidden" class="discountPercent" value="${discount.discountPercent}">
    </c:forEach>




    <script>
        function applyDiscount() {
            // Get all discount codes, percentages, statuses, and expiration dates into arrays
            let discountCodes = [];
            let discountPercents = [];
            let discountStatuses = [];
            let discountExpirations = [];
            document.querySelectorAll('.discountCode').forEach((element, index) => {
                discountCodes[index] = element.value;
            });
            document.querySelectorAll('.discountPercent').forEach((element, index) => {
                discountPercents[index] = parseFloat(element.value);
            });
            document.querySelectorAll('.discountStatus').forEach((element, index) => {
                discountStatuses[index] = parseInt(element.value);
            });
            document.querySelectorAll('.discountExpiration').forEach((element, index) => {
                discountExpirations[index] = new Date(element.value); // Assuming expiration dates are stored as Date objects
            });

            // Get the user inputted discount code
            let inputCode = document.getElementById('discountCode').value;
            let discountMessage = document.getElementById('discountMessage');
            discountMessage.textContent = ''; // Clear any previous messages

            // Find the discount code and apply the discount if it's active and not expired
            let discountIndex = discountCodes.indexOf(inputCode);
            if (discountIndex >= 0) {
                let discountPercent = discountPercents[discountIndex];
                let discountStatus = discountStatuses[discountIndex];
                let discountExpiration = discountExpirations[discountIndex];
                let roomPriceElement = document.getElementById('roomPrice');
                let originalPrice = parseFloat(roomPriceElement.dataset.originalPrice); // Assuming the original price is stored in a data attribute
                let discountedPrice = originalPrice * (1 - discountPercent / 100);

                // Check if the discount is active and not expired
                let currentDate = new Date();
                if (discountStatus === 1 && currentDate < discountExpiration) {
                    roomPriceElement.textContent = discountedPrice.toFixed(2);
                    document.getElementById('discountedPrice').value = discountedPrice.toFixed(2);
                } else {
                    if (discountStatus !== 1) {
                        discountMessage.textContent = 'This discount code is inactive.';
                    } else if (currentDate >= discountExpiration) {
                        discountMessage.textContent = 'This discount code has expired.';
                    }
                }
            } else {
                discountMessage.textContent = 'Invalid discount code';
            }
        }



        document.addEventListener('DOMContentLoaded', (event) => {
            // Store the original price in a data attribute for easy access
            let roomPriceElement = document.getElementById('roomPrice');
            roomPriceElement.dataset.originalPrice = parseFloat(roomPriceElement.textContent);
        });

        function goBack() {
            window.history.back();
        }
    </script>

</body>
