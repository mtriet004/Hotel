/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validator;

import DAO.AccountDAO;

/**
 *
 * @author ASUS
 */
public class validator {
    
    
       public boolean checkIfRegistered(String phone, String identityCard){
        AccountDAO accountsDAO = new AccountDAO();
        return accountsDAO.checkRegisteredAccount(phone,identityCard);
    }
}
