/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.VoteEntity;
import com.mycompany.spring_mvc_project_final.repository.VoteRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author NO1
 */
@Service
public class VoteService {
    
    @Autowired
    private VoteRepository voteRepository;
    
    public List<VoteEntity> getAllVotes(){
        return (List<VoteEntity>) voteRepository.findAll();
    }
    
    public void deleteVote(int id){
        voteRepository.deleteById(id);
    }
    
    public VoteEntity findVotebyId(int id){
        Optional<VoteEntity> vote = voteRepository.findById(id);
        if(vote.isPresent()){
            return vote.get();
        }
        
        return new VoteEntity();
    }
}
