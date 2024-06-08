/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.ExtraPrice;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class ExtraPriceDAO extends DBContext{
    public ExtraPrice getExtraPrice(int extraPriceId) {
        try {
            String sql = "SELECT extraPriceId, foreignPercent, threePeoplePercent FROM EXTRAPRICE WHERE extraPriceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, extraPriceId);
            ResultSet rs = ps.executeQuery();
            ExtraPrice extraPrice = new ExtraPrice();

            while (rs.next()) {
                extraPrice.setExtraPriceId(rs.getString("extraPriceId"));
                extraPrice.setForeignPercent(rs.getFloat("foreignPercent"));
                extraPrice.setThreePeoplePercent(rs.getFloat("threePeoplePercent"));
            }
            return extraPrice;
        } catch (SQLException ex) {
            Logger.getLogger(ExtraPriceDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public void updateExtraPrice(int extraPriceId, float foreignPercent, float threePeoplePercent) {
        try {
            String sql = "UPDATE EXTRAPRICE SET foreignPercent = ?, threePeoplePercent = ? WHERE extraPriceId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setFloat(1, foreignPercent);
            ps.setFloat(2, threePeoplePercent);
            ps.setInt(3, extraPriceId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ExtraPriceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
