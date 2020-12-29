/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;



import java.util.List;


import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.repository.PaymentRepository;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
<<<<<<< HEAD
 * @author NO1
 */
@Service
public class PaymentService {
    
    @Autowired
    private PaymentRepository paymentRepository;
    
    public List<PaymentEntity> getPaymentByBooking(int id){
        return paymentRepository.findByBooking_Id(id);
    }

    public void savePayment(PaymentEntity paymentEntity){
        paymentRepository.save(paymentEntity);

    }
    
    public PaymentEntity findByBooking(int bookingId){
        return paymentRepository.findBookingIdGetPayment(bookingId);
    }
    
    public List<PaymentEntity> getAllPayment(){
        return (List<PaymentEntity>)paymentRepository.findAll();
    }
    
    public List<PaymentEntity> getAllPaymentByPaymentDate(Date startDate, Date endDate){
        return paymentRepository.findByPaymentDateBetween(startDate, endDate);
    }
    
}
