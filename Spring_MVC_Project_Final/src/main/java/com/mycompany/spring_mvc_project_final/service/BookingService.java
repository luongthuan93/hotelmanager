/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author NO1
 */
@Service
public class BookingService {
    
    @Autowired
    private BookingRepository bookingRepository;
    
    public List<BookingEntity> getAllBookings(){
        return (List<BookingEntity>)bookingRepository.findAll();
    }
    
    public void deleteBooking(int id){
        bookingRepository.deleteById(id);
    }
    
    public List<BookingEntity>findByCheckinDate(Date checin){
        return bookingRepository.findByCheckin(checin);
    }
    
    public List<BookingEntity>findByCheckoutDate(Date checout){
        return bookingRepository.findByCheckout(checout);
    }
    
    public BookingEntity findBookingbyId(int id){
        Optional<BookingEntity> booking = bookingRepository.findBookingByIDQuery(id);
        if (booking.isPresent()) {
            return booking.get();
        } else {
            return new BookingEntity();
        }
        
    }
    
    public void saveBooking(BookingEntity bookingEntity){
        bookingRepository.save(bookingEntity);
    }
    
    public List<BookingEntity> searchBookingDate(Date startDate, Date endDate){
        return bookingRepository.findByBookingDateBetween(startDate, endDate);
    }
    
    public BookingEntity findbyId(int id){
        Optional<BookingEntity> booking = bookingRepository.findById(id);
        if (booking.isPresent()) {
            return booking.get();
        } else {
            return new BookingEntity();
        }
        
    }
    
    public void updateTotalPrice(int bookingId,double totalPrice){
        BookingEntity booking = findbyId(bookingId);
        if(booking.getId()>0){
            booking.setTotalPrice(booking.getTotalPrice()+totalPrice);
            bookingRepository.save(booking);
        }
    }
    

    public boolean deleteBookingDetailById(int bookingId,int bookingDetailId){
        BookingEntity booking = findbyId(bookingId);
        if(booking.getId()>0){
            List<BookingDetailEntity> listdetails = booking.getBookingDetails();
            List<BookingDetailEntity> bdes = new ArrayList<>();
            if(!CollectionUtils.isEmpty(listdetails)){
                for(BookingDetailEntity bde:listdetails){
                    if(bde.getId()!=bookingDetailId){
                        bdes.add(bde);
                    }
                }
            }else{
                return false;
            }
            booking.setBookingDetails(bdes);
            saveBooking(booking);
            return true;
        }
        return false;
    }
    
    public BookingEntity getBookingByToken(String bookingNumber){
        return bookingRepository.findByBookingNumber(bookingNumber);

    }
    
    public List<BookingEntity> getBookingByUserID(int id){
        return bookingRepository.getBookingByUserID(id);
    }
    
}
