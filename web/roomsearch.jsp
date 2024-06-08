<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quán lý khách hàng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
        <link rel="stylesheet" href="css/style9.css"/>
    </head>

    <body style="background-image:url('images/bg2.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-12 mb-3 mb-lg-5">
                    <div class="overflow-hidden card table-nowrap table-card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0">Tìm phòng</h5>
                            <a href="homepage" class="btn btn-light btn-sm"><h5 class="mb-0">Quay lại </h5></a>
                        </div>
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead class="small text-uppercase bg-body text-muted">
                                    <tr>
                                        <th>Số phòng</th>
                                        <th>Loại phòng</th>
                                        <th>Trạng thái</th>
                                        <th class='text-center'>Đặt phòng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${roomquery != null}">
                                        <c:forEach var="room" items="${roomquery}">
                                        <form action="selectroom" method="post" >
                                            <tr>

                                                <td>${room.roomNumber}</td>
                                                <td>${room.type.typeName}</td>
                                                <td>
                                                    <c:if test="${room.status == 'available'}">
                                                        <button class="btn badge bg-success" disabled>Hoạt động</button>
                                                    </c:if>
                                                    <c:if test="${room.status == 'unavailable'}">

                                                        <button class="btn badge bg-danger" disabled>Tạm ngưng</button>
                                                    </c:if>
                                                </td>
                                                <td>

                                                    <input type="hidden" name="selectedRoomId" value="${room.roomId}" >
                                                    <c:if test="${room.status != 'available'}">
                                                        <input type="submit" disabled class="btn btn-danger btn-lg btn-block" value="Unavailable">
                                                    </c:if>
                                                    <c:if test="${room.status == 'available'}">
                                                        <input type="submit" class="btn btn-outline-success btn-lg btn-block" value="Book now">
                                                        <input type="hidden" name="dateStartStr" value="${dateStartStr}" >
                                                        <input type="hidden" name="dateEndStr" value="${dateEndStr}"/>
                                                    </c:if>
                                                </td>
                                                
                                            </tr>
                                        </form>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
