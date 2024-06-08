<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <title>Quản lý khuyến mãi</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
</head>
<body style="background-image:url('images/bg5.jpg');">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="overflow-hidden card table-nowrap table-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Quản lý khuyến mãi</h4>
                        <a href="discount" class="btn btn-light btn-sm"><h4 class="mb-0">Thêm khuyến mãi</h4></a>   
                        <a href="admin" class="btn btn-light btn-sm"><h4 class="mb-0">Quay lại</h4></a>                   
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                                <tr>
                                    <th>Mã khuyến mãi</th>
                                    <th>Phần trăm giảm giá</th>
                                    <th>Ngày bắt đầu</th>
                                    <th>Ngày kết thúc</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="discount" items="${list_discount}">
                                    <tr>
                                        <td>${discount.code}</td>
                                        <td>${discount.discountPercent}</td>
                                        <td>${discount.dateBegin}</td>
                                        <td>${discount.dateExpire}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${discount.status == 1}">
                                                    <form action="togglediscountstatus" method="post">
                                                        <input type="hidden" name="code" value="${discount.code}">
                                                        <input type="hidden" name="status" value="0">
                                                        <button type="submit" class="btn badge bg-success">Active</button>
                                                    </form>
                                                </c:when>
                                                <c:when test="${discount.status == 0}">
                                                    <form action="togglediscountstatus" method="post">
                                                        <input type="hidden" name="code" value="${discount.code}">
                                                        <input type="hidden" name="status" value="1">
                                                        <button type="submit" class="btn badge bg-danger">Inactive</button>
                                                    </form>
                                                </c:when>
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
</body>
