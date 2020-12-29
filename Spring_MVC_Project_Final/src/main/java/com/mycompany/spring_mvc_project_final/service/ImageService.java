/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.repository.ImageRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class ImageService {

    @Autowired
    private ImageRepository imageRepository;

    public void saveImage(ImageEntity image) {
        if (image != null) {
            imageRepository.save(image);
        }
    }

    public List<ImageEntity> getListImages() {
        return (List<ImageEntity>) imageRepository.findAll();
    }

    public List<ImageEntity> getImagesByRoomTypeId(int roomTypeId) {
        return imageRepository.findByRoomTypeId(roomTypeId);
    }
}
