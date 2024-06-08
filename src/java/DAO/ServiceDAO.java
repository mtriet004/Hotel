package DAO;

import DTO.HasService;
import DTO.Service;
import DTO.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServiceDAO extends DBContext {

    public int addService(Service service) {
        int generatedServiceId = -1; // Default value in case of failure
        try {
            // Insert service details into Service table
            String insertServiceQuery = "INSERT INTO [dbo].[Service] (serviceName, status) VALUES (?, ?);";
            PreparedStatement psInsertService = connection.prepareStatement(insertServiceQuery, Statement.RETURN_GENERATED_KEYS);
            psInsertService.setString(1, service.getServiceName());
            psInsertService.setString(2, service.getStatus());
            psInsertService.executeUpdate();

            // Get the auto-generated serviceId
            ResultSet generatedKeys = psInsertService.getGeneratedKeys();
            if (generatedKeys.next()) {
                generatedServiceId = generatedKeys.getInt(1);
            } else {
                // Handle failure to get auto-generated key
                throw new SQLException("Failed to get auto-generated service ID.");
            }

            // Close prepared statement
            psInsertService.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return generatedServiceId;
    }

    public List<Service> getAllServices() {
        List<Service> servicesList = new ArrayList<>();
        try {
            String sql = "SELECT [ServiceId], [ServiceName], [Status] FROM [dbo].[Service];";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int serviceId = rs.getInt("ServiceId");
                String serviceName = rs.getString("ServiceName");
                String status = rs.getString("Status");

                // Tạo đối tượng Service và thêm vào danh sách
                Service service = new Service(serviceId, serviceName, status);
                servicesList.add(service);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return servicesList;
    }

    public void assignServiceToTypes(int serviceId, List<Integer> selectedTypeIds) {
        try {
            // Gán serviceId cho từng typeId được chọn trong bảng HasService
            for (int typeId : selectedTypeIds) {
                addServiceToHasService(serviceId, typeId);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List<Integer> getTypeIdsFromTypeTable() throws SQLException {
        List<Integer> typeIds = new ArrayList<>();
        String sql = "SELECT TypeId FROM [dbo].[Type];";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int typeId = rs.getInt("TypeId");
            typeIds.add(typeId);
        }
        rs.close();
        ps.close();
        return typeIds;
    }

    private void addServiceToHasService(int serviceId, int typeId) throws SQLException {
        String sql = "INSERT INTO [dbo].[HasService] (serviceId, typeId) VALUES (?, ?);";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, serviceId);
        ps.setInt(2, typeId);
        ps.executeUpdate();
        ps.close();
    }

    public void updateServiceStatus(int serviceId, String status) {
        try {
            String sql = "UPDATE [dbo].[Service] SET [Status]=? WHERE [ServiceId]=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, serviceId);
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateService(Service service) {
        try {
            String query = "UPDATE [dbo].[Service] SET serviceName = ? WHERE serviceId = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, service.getServiceName());
            ps.setInt(2, service.getServiceId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void toggleService(int serviceId, String serviceStatus) {
        try {
            String sql = "UPDATE Service SET Status = ? WHERE ServiceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, serviceStatus);
            ps.setInt(2, serviceId);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Service> getServicesByRoomType(int typeId) {
        try {
            String sql = "SELECT * FROM Service WHERE typeId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();

            List<Service> services = new ArrayList<>();
            while (rs.next()) {
                Service service = new Service();
                service.setServiceId(rs.getInt("ServiceId"));
                service.setServiceName(rs.getString("ServiceName"));
                service.setStatus(rs.getString("Status"));
                services.add(service);
            }

            rs.close();
            ps.close();
            return services;
        } catch (SQLException ex) {
            Logger.getLogger(RoomsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Service getServiceByServiceId(int ServiceId) {
        try {
            String sql = "SELECT [ServiceName], [Status]\n"
                    + "FROM [dbo].[Service]\n"
                    + "WHERE [ServiceId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ServiceId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Service service = new Service();
                service.setServiceId(ServiceId);
                service.setServiceName(rs.getNString("ServiceName"));
                service.setStatus(rs.getString("Status"));
                return service;
            }
            return null;
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public String getTypeNameByServiceId(int serviceId) {
        String typeName = "";
        try {
            String sql = "SELECT t.TypeName "
                    + "FROM [dbo].[Type] t "
                    + "JOIN [dbo].[HasService] hs ON t.[TypeId] = hs.[TypeId] "
                    + "WHERE hs.[ServiceId] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serviceId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                typeName = rs.getString("TypeName");
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return typeName;
    }

}
