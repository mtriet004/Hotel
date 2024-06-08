/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.HasService;
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
public class HasServiceDAO extends DBContext {

    public List<Integer> getTypeIdsByServiceId(int serviceId) {
        List<Integer> typeIds = new ArrayList<>();
        try {
            String sql = "SELECT TypeId FROM HasService WHERE ServiceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, serviceId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                typeIds.add(rs.getInt("TypeId"));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(HasService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return typeIds;
    }
}
