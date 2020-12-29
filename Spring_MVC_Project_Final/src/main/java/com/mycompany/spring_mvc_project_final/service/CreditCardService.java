/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.CreditCardEntity;
import com.mycompany.spring_mvc_project_final.repository.CreditCardRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lamde
 */
@Service
public class CreditCardService {
    
    @Autowired
    private CreditCardRepository creditCardRepository;
    
    public List<CreditCardEntity> getListCreditCard(){
        return (List<CreditCardEntity>) creditCardRepository.findAll();
    }
    
    public void saveCreditCard(CreditCardEntity CreditCardEntity){
        creditCardRepository.save(CreditCardEntity);
    }
    
    public CreditCardEntity findByNumberGetCreditCard(String number){
        return creditCardRepository.findByNumberGetCreditCard(number);
    }
    
    public CreditCardEntity findById(int id){
        Optional<CreditCardEntity> creditCard = creditCardRepository.findById(id);
        if (creditCard.isPresent()) {
            return creditCard.get();
        } else {
            return new CreditCardEntity();
        }
    }
    
    public CreditCardEntity findByNumberCard(String number){
        Optional<CreditCardEntity> creditCard = creditCardRepository.findByNumber(number);
        if (creditCard.isPresent()) {
            return creditCard.get();
        } else {
            return new CreditCardEntity();
        }
    }
}
