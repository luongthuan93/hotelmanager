/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ConvenientEntity;
import com.mycompany.spring_mvc_project_final.repository.ConvenientRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class ConvenientService {
    
    @Autowired
    private ConvenientRepository convenientRepository;
    
    public List<ConvenientEntity> getAllConvenients(){
        return (List<ConvenientEntity>)convenientRepository.findAll();
    }
    
    public void saveConvenient(ConvenientEntity convenientEntity){
        convenientRepository.save(convenientEntity);
    }
    
    public ConvenientEntity findConvenientById(int id){
        Optional<ConvenientEntity> convenient = convenientRepository.findById(id);
        if(convenient.isPresent()){
            return convenient.get();
        }else{
            return new ConvenientEntity();
        }
    }
}
