<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Report Income</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #1c1c1c;
                color: #eaeaea;
                padding-top: 20px;
            }
            .container {
                margin-top: 50px;
                background-color: #2c2c2c;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            }
            .table {
                margin-top: 20px;
            }
            .table th, .table td {
                text-align: center;
                vertical-align: middle;
            }
            .table thead th {
                background-color: #4a4a4a;
                color: #eaeaea;
            }
            .table tbody tr:nth-child(even) {
                background-color: #3a3a3a;
            }
            h1 {
                color: #eaeaea;
                font-weight: 700;
            }
            h2 {
                color: #eaeaea;
                font-weight: 600;
            }
            .total-income {
                margin-top: 30px;
                padding: 20px;
                background-color: #4a4a4a;
                color: #eaeaea;
                text-align: center;
                border-radius: 10px;
            }
            .btn-info {
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }
            .btn-warning {
                background-color: #ffc107;
                border-color: #ffc107;
            }
            .btn-primary {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .btn-primary:hover {
                background-color: #5a6268;
                border-color: #545b62;
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
    <body style="background-image: url('images/rp2.jpg')">
        <div class="container">
            <h1 class="text-center">Báo cáo doanh thu</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Ngày tạo</th>
                        <th>Giá </th>
                    </tr>
                </thead>
                <tbody style="color:white">
                    <c:forEach var="booking" items="${bookings}">
                        <c:if test="${booking.status eq 3}">
                            <tr>
                                <td>${booking.bookId}</td>
                                <td>${booking.dateCreated}</td>
                                <td>${booking.price}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <div class="total-income">
                <h2>Tổng doanh thu: ${totalIncome}</h2>
            </div>
        </div>
        <button class="btn btn-primary btn-back" onclick="window.location.href = 'admin'">Quay lại</button>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
