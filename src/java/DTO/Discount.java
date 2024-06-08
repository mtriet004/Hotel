/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Discount implements Serializable {

    private String code;
    private int discountPercent;
    private Date dateBegin;
    private Date dateExpire;
    private int status;

    public Discount() {
    }

    public Discount(String code, int discountPercent, Date dateBegin, Date dateExpire, int status) {
        this.code = code;
        this.discountPercent = discountPercent;
        this.dateBegin = dateBegin;
        this.dateExpire = dateExpire;
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(Date dateBegin) {
        this.dateBegin = dateBegin;
    }

    public Date getDateExpire() {
        return dateExpire;
    }

    public void setDateExpire(Date dateExpire) {
        this.dateExpire = dateExpire;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
