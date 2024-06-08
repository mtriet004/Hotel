<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quán lý khách hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
</head>

<body style="background-image:url('images/bg7.jpg');">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="overflow-hidden card table-nowrap table-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Quản lý khách hàng</h5>
                        <a href="admin" class="btn btn-light btn-sm"><h5 class="mb-0">Quay lại</h5></a>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                                <tr>
                                    <th>Tên</th>
                                    <th>Giới tính</th>
                                    <th>Số điện thoại</th>
                                    <th>Email</th>
                                    <th>Vai trò</th>
                                    <th>Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="account" items="${accounts}">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div>
                                                    <div class="h6 mb-0 lh-1">${account.fullName}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${account.sex}</td>
                                        <td>${account.phone}</td>
                                        <td>${account.email}</td>
                                        <td>${account.role.roleName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${account.status == 0}">
                                                    <form action="toggleaccountstatus" method="post">
                                                        <input type="hidden" name="phone" value="${account.phone}">
                                                        <input type="hidden" name="newStatus" value="1"> <!-- Blocking status -->
                                                        <button type="submit" class="btn badge bg-danger">Block</button>
                                                    </form>
                                                </c:when>
                                                <c:when test="${account.status == 1}">
                                                    <form action="toggleaccountstatus" method="post">
                                                        <input type="hidden" name="phone" value="${account.phone}">
                                                        <input type="hidden" name="newStatus" value="0"> <!-- Unblocking status -->
                                                        <button type="submit" class="btn badge bg-success">Unblock</button>
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
