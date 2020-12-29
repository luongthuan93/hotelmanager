/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *

 * @author NO1
=======
 * @author lamde

 */
@Repository
public interface PaymentRepository extends CrudRepository<PaymentEntity, Integer>{
    
    List<PaymentEntity> findByPaymentDateBetween(Date startDate, Date endDate);
    List<PaymentEntity> findByBooking_Id(int id);
    
    @Query(value = "SELECT * FROM payment WHERE booking_id = ?1", nativeQuery = true)
    PaymentEntity findBookingIdGetPayment(int bookingId);

}
