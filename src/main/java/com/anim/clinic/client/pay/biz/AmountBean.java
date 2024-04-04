package com.anim.clinic.client.pay.biz;

public class AmountBean {

    private Integer total;
    private Integer tax_free;
    private Integer vat;
    private Integer point;
    private Integer discount;
    private Integer green_deposit;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getTax_free() {
        return tax_free;
    }

    public void setTax_free(Integer tax_free) {
        this.tax_free = tax_free;
    }

    public Integer getVat() {
        return vat;
    }

    public void setVat(Integer vat) {
        this.vat = vat;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getGreen_deposit() {
        return green_deposit;
    }

    public void setGreen_deposit(Integer green_deposit) {
        this.green_deposit = green_deposit;
    }

    @Override
    public String toString() {
        return "AmountBean{" +
                "total=" + total +
                ", tax_free=" + tax_free +
                ", vat=" + vat +
                ", point=" + point +
                ", discount=" + discount +
                ", green_deposit=" + green_deposit +
                '}';
    }
}