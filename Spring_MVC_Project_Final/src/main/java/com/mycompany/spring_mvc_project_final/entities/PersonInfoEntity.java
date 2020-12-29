/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.Gender;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author NO1
 */
@MappedSuperclass
public class PersonInfoEntity {

    @Column(length = 100)
    @NotBlank(message = "This field is required")
    @Email(message = "The email incorrect syntax")
    private String email;

    @Column(name = "full_name")
    @NotBlank(message = "This field is required")
    @Pattern(regexp = "[a-zA-Z]+[ a-zA-Z]*", message = "Full Name incorrect syntax")
    @Length(min = 3, max = 30)
    private String fullName;

    @NotNull(message = "Please enter a phone")
    @Pattern(regexp = "(^$|[0-9]{10})", message = "The phone incorrect syntax")
    private String phone;

    @NotNull(message = "Please enter a address")
    private String address;

    @Column(name = "card_id")
    @NotNull(message = "Please enter a Identity Card Number")
    @Pattern(regexp = "(^[0-9]{8,12}$)", message = "Please enter 8 to 12 numbers")
    private String cardId;

    @Temporal(TemporalType.DATE)
    @Column(name = "birth_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthDate;

    @Enumerated(EnumType.STRING)
    private Gender gender = Gender.MALE;

    public PersonInfoEntity() {
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

}
