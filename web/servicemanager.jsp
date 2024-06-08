<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <title>Quản lý dịch vụ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css" integrity="sha256-mmgLkCYLUQbXn0B1SRqzHar6dCnv9oZFPEC1g1cwlkk=" crossorigin="anonymous" />
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
    <link rel="stylesheet" href="css/style9.css"/>
</head>
<body style="background-image:url('images/bg3.jpg');">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="overflow-hidden card table-nowrap table-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">Quản lý Dịch vụ</h4>
                        <a href="addservice" class="btn btn-light btn-sm"><h4 class="mb-0">Thêm Dịch vụ</h4></a>   
                        <a href="admin" class="btn btn-light btn-sm"><h4 class="mb-0">Quay lại</h4></a>                   
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                                <tr>
                                    <th>Tên dịch vụ</th>
                                    <th>Loại phòng</th>
                                    <th>Trạng thái</th>
                                    <th>Xóa</th>
                                    <th>Cập nhật</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="service" items="${list_service}">
                                    <c:if test="${service.getStatus() != 'hidden'}">
                                        <tr>
                                            <td>${service.getServiceName()}</td>
                                            <td>
                                                <c:forEach var="typeName" items="${serviceTypeNamesMap[service.getServiceId()]}" varStatus="loop">
                                                    ${typeName}
                                                    <c:if test="${!loop.last}">, </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>
                                                <c:if test="${service.getStatus() == 'available'}">
                                                    <form action="toggleservice" method="post">
                                                        <input type="hidden" name="selectedServiceId" value="${service.getServiceId()}">
                                                        <input type="hidden" name="serviceStatus" value="${service.getStatus()}">
                                                        <button type="submit" class="btn badge bg-success">Hoạt động</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${service.getStatus() == 'unavailable'}">
                                                    <form action="toggleservice" method="post">
                                                        <input type="hidden" name="selectedServiceId" value="${service.getServiceId()}">
                                                        <input type="hidden" name="serviceStatus" value="${service.getStatus()}">
                                                        <button type="submit" class="btn badge bg-danger">Tạm ngưng</button>
                                                    </form>
                                                </c:if>
                                            </td>
                                            <td>
                                                <form action="deleteservice" method="post">
                                                    <input type="hidden" name="serviceId" value="${service.getServiceId()}">
                                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Delete" 
                                                       onclick="event.preventDefault();
                                                               if (window.confirm('Bạn có chắc muốn xóa dịch vụ này?'))
                                                                   this.closest('form').submit();">
                                                        <i class="far fa-trash-alt"></i>
                                                    </a>
                                                </form>
                                            </td>
                                            <td>
                                                <form action="updateservice" method="get">
                                                    <input type="hidden" name="serviceId" value="${service.getServiceId()}">
                                                    <a href="#" data-toggle="tooltip" title="" data-original-title="Edit" 
                                                       onclick="event.preventDefault();
                                                               if (window.confirm('Bạn có chắc muốn cập nhật dịch vụ này?'))
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
