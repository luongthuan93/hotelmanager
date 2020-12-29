/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author NO1
 */
@Entity
@Table(name = "credit_card")
public class CreditCardEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private double balance;

    private String name;

    private String number;

    @Temporal(TemporalType.DATE)
    @Column(name = "exp_date")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date expDate;

    @Column(name = "ccv_code")
    private int ccvCode;

    @OneToMany(mappedBy = "creditCard", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PaymentEntity> payments;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public int getCcvCode() {
        return ccvCode;
    }

    public void setCcvCode(int ccvCode) {
        this.ccvCode = ccvCode;
    }

    public List<PaymentEntity> getPayments() {
        return payments;
    }

    public void setPayments(List<PaymentEntity> payments) {
        this.payments = payments;
    }

}
