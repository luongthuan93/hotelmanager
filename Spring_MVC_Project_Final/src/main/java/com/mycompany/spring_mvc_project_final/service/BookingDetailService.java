/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class BookingDetailService {
    
    @Autowired
    private BookingDetailRepository bookingDetailRepository;
    

    public BookingDetailEntity getBookingDetailbyId(int id){
        Optional<BookingDetailEntity> bookingDetail = bookingDetailRepository.findBookingDetaiByIDQuery(id);
        if(bookingDetail.isPresent()){
            return bookingDetail.get();
        }else{
            return new BookingDetailEntity();
            
        }
    }
    
    public void saveBookingEntity(BookingDetailEntity bookingDetailEntity){
        bookingDetailRepository.save(bookingDetailEntity);
    }
    
    public void save(BookingDetailEntity bookingDetail) {
        bookingDetailRepository.save(bookingDetail);

    }
    
    public List<BookingDetailEntity> findByBooking(int id){
        return bookingDetailRepository.findByBooking(id);
    }
    
}
