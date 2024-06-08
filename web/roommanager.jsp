<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Quản lý phòng</title>

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
                        <h4 class="mb-0">Quản lý phòng</h4>
                        <a href="addroom" class="btn btn-light btn-sm"><h4 class="mb-0">Thêm phòng</h4></a>   
                        <a href="admin" class="btn btn-light btn-sm"><h4 class="mb-0">Quay lại</h4></a>                   
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                                <tr>
                                    <th>ID Phòng</th>
                                    <th>Số Phòng</th>
                                    <th>Trạng thái</th>
                                    <th>Loại ID</th>
                                    <th>Xóa</th>
                                    <th>Cập nhật</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="room" items="${list_room}">
                                    <c:if test="${room.getStatus() != '3'}">
                                        <tr>
                                            <td>${room.getRoomId()}</td>
                                            <td>${room.getRoomNumber()}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${room.status == 'available'}">
                                                        <form action="toggleroom" method="post">
                                                            <input type="hidden" name="selectedRoomId" value="${room.getRoomId()}">
                                                            <input type="hidden" name="roomStatus" value="${room.status}">
                                                            <button type="submit" class="btn badge bg-success">Hoạt động</button>
                                                        </form>
                                                    </c:when>
                                                    <c:when test="${room.status == 'unavailable'}">
                                                        <form action="toggleroom" method="post">
                                                            <input type="hidden" name="selectedRoomId" value="${room.getRoomId()}">
                                                            <input type="hidden" name="roomStatus" value="${room.status}">
                                                            <button type="submit" class="btn badge bg-danger">Tạm ngưng</button>
                                                        </form>
                                                    </c:when>
                                                </c:choose>

                                            </td>
                                            <td>${room.type.typeName}</td>
                                            <td>
                                                <form action="deleteroom" method="post">
                                                    <input type="hidden" name="roomId" value="${room.getRoomId()}">
                                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Delete" 
                                                       onclick="event.preventDefault(); if (window.confirm('Bạn có chắc muốn xóa phòng này?'))
                                                                   this.closest('form').submit();">
                                                        <i class="far fa-trash-alt"></i>
                                                    </a>
                                                </form>
                                            </td>

                                            <td>
                                                <form action="updateroom" method="get">
                                                    <input type="hidden" name="roomId" value="${room.roomId}">
                                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Edit" 
                                                       onclick="event.preventDefault(); if (window.confirm('Bạn có chắc muốn cập nhật phòng này?'))
                       this.closest('form').submit();">
                                                        <i class="fas fa-pencil-alt"></i>
                                                    </a>
                                                </form>
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
    </div>
</body>