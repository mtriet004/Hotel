/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.Service;
import DTO.Type;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class TypeDAO extends DBContext {

    public Type getTypeInfo(int typeId) {
        try {
            String sql = "SELECT t.[TypeName], hs.ServiceId, t.[Price], t.[NumPeople]\n"
                    + "FROM [dbo].[Type] t JOIN [dbo].[HasService] hs ON t.TypeId = hs.TypeId\n"
                    + "WHERE t.TypeId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();
            Type t = new Type();
            ServiceDAO serviceDAO = new ServiceDAO();
            List<Service> list_service = new ArrayList<>();

            while (rs.next()) {
                t.setTypeId(typeId);
                t.setTypeName(rs.getNString("TypeName"));
                t.setPrice(rs.getFloat("Price"));
                t.setNumPeople(rs.getInt("NumPeople"));
                list_service.add(serviceDAO.getServiceByServiceId(rs.getInt("ServiceId")));
            }
            t.setList_service(list_service);
            return t;
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void updateRoomPrice(int typeId, float newPrice) {
        try {
            String sql = "UPDATE Type SET Price = ? WHERE TypeId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, newPrice);
            ps.setInt(2, typeId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateRoomPeople(int typeId, int newNumberOfPeople) {
        try {
            String sql = "UPDATE Type SET NumPeople = ? WHERE TypeId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, newNumberOfPeople);
            ps.setInt(2, typeId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getTypeNameByTypeId(int typeId) {
        try {
            String typeName = null;
            String sql = "SELECT TypeName FROM Type WHERE TypeId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                typeName = rs.getString("TypeName");
            }

            rs.close();
            ps.close();
            return typeName;
        } catch (SQLException ex) {
            Logger.getLogger(TypeDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
