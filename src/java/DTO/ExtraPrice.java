/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author ASUS
 */
public class ExtraPrice {
    private String extraPriceId;
    private float foreignPercent;
    private float threePeoplePercent;

    public ExtraPrice() {
    }

    public ExtraPrice(String extraPriceId, float foreignPercent, float threePeoplePercent) {
        this.extraPriceId = extraPriceId;
        this.foreignPercent = foreignPercent;
        this.threePeoplePercent = threePeoplePercent;
    }

    public String getExtraPriceId() {
        return extraPriceId;
    }

    public void setExtraPriceId(String extraPriceId) {
        this.extraPriceId = extraPriceId;
    }

    public float getForeignPercent() {
        return foreignPercent;
    }

    public void setForeignPercent(float foreignPercent) {
        this.foreignPercent = foreignPercent;
    }

    public float getThreePeoplePercent() {
        return threePeoplePercent;
    }

    public void setThreePeoplePercent(float threePeoplePercent) {
        this.threePeoplePercent = threePeoplePercent;
    }

   
    
}
