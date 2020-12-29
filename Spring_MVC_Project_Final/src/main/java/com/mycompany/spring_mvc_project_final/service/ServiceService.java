/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class ServiceService {
    
    @Autowired
    private ServiceRepository serviceRepository;
    
    public List<ServiceEntity> getAllServices(){
        return (List<ServiceEntity>)serviceRepository.findAll();
    }
    
    public void saveService(ServiceEntity serviceEntity,String action){
        
        if(action.equalsIgnoreCase("add")){
            List<ImageEntity> images = serviceEntity.getImages();
            for(ImageEntity image:images){
                image.setService(serviceEntity);
                serviceEntity.setImages(images);
            }
        }
        serviceRepository.save(serviceEntity);
    }
    
    public ServiceEntity getServicebyId(int id){
        Optional<ServiceEntity> service = serviceRepository.findById(id);
        if(service.isPresent()){
            return service.get();
        }else{
            return new ServiceEntity();
        }
        
    }
    
    public ServiceEntity getServicebyQueryId(int id){
        Optional<ServiceEntity> service = serviceRepository.findServiceQueryById(id);
        if(service.isPresent()){
            return service.get();
        }else{
            return new ServiceEntity();
        }
        
    }
}
