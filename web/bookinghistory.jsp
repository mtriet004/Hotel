<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DTO.Book"%>
<%@page import="java.util.List"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lịch sử đặt phòng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
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
<body style="background-image:url('images/bh3.jpg');">
    <div class="container">
        <h1 class="text-center">Lịch sử đặt phòng</h1>
        <%
            List<Book> bookList = (List<Book>) request.getAttribute("bookList");
        %>
        <div class="col-12 mb-3 mb-lg-5">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Ngày tạo</th>
                            <th>Giá tiền</th>
                            <th> Số lượng người</th>
                            <th>CCCD</th>
                            <th>Ngày nhận</th>
                            <th>Ngày trả</th>
                            <th>Room ID</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (bookList != null && !bookList.isEmpty()) {
                                for (Book book : bookList) {
                        %>
                        <tr>
                            <td style="color:white; font-weight: bold;"><%= book.getBookId()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getDateCreated()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getPrice()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getNumberOfPeople()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getIdentityCard()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getCheckinDate()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getCheckoutDate()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getRoomId()%></td>
                            <td style="color:white; font-weight: bold;"><%= book.getStatus()%></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>


                    </tbody>
                </table>
            </div>
            <h4 style="color:white">Không tìm thấy lịch sử đặt phòng cho số CCCD của bạn.</h4>

            <%
                }
            %>
        </div>
    </div>
    <button class="btn btn-primary btn-back" onclick="window.location.href = 'homepage'">Quay lại</button>
</body>
