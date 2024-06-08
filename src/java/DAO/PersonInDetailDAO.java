/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DTO.PersonInDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class PersonInDetailDAO extends DBContext {

    public void insertPersonInDetail(PersonInDetail person) {
        try {
            String sql = "INSERT INTO PersonInDetail (Name, IdentityNumber, Type, Email, Phone, Sex, BookId) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, person.getName());
            ps.setString(2, person.getIdentityNumber());
            ps.setString(3, person.getType());
            ps.setString(4, person.getEmail());
            ps.setString(5, person.getPhone());
            ps.setString(6, person.getSex());
            ps.setInt(7, person.getBookId());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PersonInDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<PersonInDetail> getPersonInDetail(int bookId) {
        ArrayList<PersonInDetail> personList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM PersonInDetail WHERE BookId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PersonInDetail person = new PersonInDetail();
                person.setName(rs.getString("Name"));
                person.setIdentityNumber(rs.getString("IdentityNumber"));
                person.setType(rs.getString("Type"));
                person.setEmail(rs.getString("Email"));
                person.setPhone(rs.getString("Phone"));
                person.setSex(rs.getString("Sex"));
                person.setPersonId(rs.getInt("PersonId"));
                personList.add(person);
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(PersonInDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return personList;
    }
}
