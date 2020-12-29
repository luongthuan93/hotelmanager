/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class PromotionService {
    
    @Autowired
    private PromotionRepository promotionRepository;
    
    public List<PromotionEntity> getAllPromotions(){
        return (List<PromotionEntity>)promotionRepository.getAllPromotionWithRoomType();
    }
    
    public void savePromotion(PromotionEntity promotionEntity){
        
        promotionRepository.save(promotionEntity);
    }
    
    public PromotionEntity findPromotionById(int id){
        Optional<PromotionEntity> promotion1 = promotionRepository.findPromotionWithImagesById(id);
        Optional<PromotionEntity> promotion2 = promotionRepository.findPromotionWithRoomTypeById(id);
        PromotionEntity promotion;
        if(promotion1.isPresent()){
            promotion = promotion1.get();
            promotion.setRoomTypes(promotion2.get().getRoomTypes());
            return promotion;
        }else{
            return new PromotionEntity();
        }
    }
    
    public List<PromotionEntity> getAllPromotion(){
        return (List<PromotionEntity>)promotionRepository.findAll();
    }
    
    public List<PromotionEntity> getAllPromotionAvailable(Date sDate,Date eDate){
        return (List<PromotionEntity>)promotionRepository.getAllPromotionAvailable(sDate, eDate);
    }
}
