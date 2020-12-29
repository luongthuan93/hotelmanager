/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NO1
 */
@Repository
public interface BookingRepository extends CrudRepository<BookingEntity, Integer>{
    
    List<BookingEntity> findByCheckin(Date checkin);
    List<BookingEntity> findByCheckout(Date checkout);
    List<BookingEntity> findByBookingDateBetween(Date startDate, Date endDate);
    
    @Query("SELECT DISTINCT b FROM BookingEntity b LEFT JOIN FETCH b.bookingDetails bd LEFT JOIN FETCH bd.services WHERE b.id = ?1")
    Optional<BookingEntity> findBookingByIDQuery(int id);
    

    @Query("SELECT DISTINCT b FROM BookingEntity b LEFT JOIN FETCH b.bookingDetails WHERE b.id = ?1")
    Optional<BookingEntity> findBookingByIDQueryBookingDetails(int id);
    
    BookingEntity findByBookingNumber(String bookingNumber);
   
    @Query(value = "SELECT * FROM booking WHERE user_id = ?1", nativeQuery = true)
    List<BookingEntity> getBookingByUserID(int id);

}
