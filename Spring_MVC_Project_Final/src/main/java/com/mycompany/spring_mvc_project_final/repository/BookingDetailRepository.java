/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author NO1
 */
@Repository
public interface BookingDetailRepository extends CrudRepository<BookingDetailEntity, Integer>{
    
    @Query("SELECT DISTINCT b FROM BookingDetailEntity b LEFT JOIN FETCH b.services WHERE b.id = ?1 ")
    Optional<BookingDetailEntity> findBookingDetaiByIDQuery(int id);
    
    @Query(value = "SELECT * FROM booking_detail WHERE booking_id = ?1", nativeQuery = true)
    List<BookingDetailEntity> findByBooking(int id);
    
}
