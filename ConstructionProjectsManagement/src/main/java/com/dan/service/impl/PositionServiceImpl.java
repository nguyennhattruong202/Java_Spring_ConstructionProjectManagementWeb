/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dan.service.impl;

import com.dan.pojo.Position;
import com.dan.repository.PositionRepository;
import com.dan.service.PositionService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PositionServiceImpl implements PositionService {
    
    @Autowired
    private PositionRepository positionRepository;
    
    @Override
    public List<Position> getPosition(boolean active) {
        return this.positionRepository.getPosition(active);
    }
    
    @Override
    public Position findPositionById(int id, boolean active) {
        return this.positionRepository.findPositionById(id, active);
    }
    
    @Override
    public void removed(int id) {
        this.positionRepository.removed(id);
    }
    
    @Override
    public boolean updatePosition(int id, String name, String description) {
        return this.positionRepository.updatePosition(id, name, description);
    }
    
    @Override
    public Position addPosition(String name, String description) {
        return this.positionRepository.addPosition(name, description);
    }
    
    @Override
    public Map<String, String> getPosition() {
        return this.positionRepository.getPosition();
    }

    @Override
    public void update(Position position) {
        this.positionRepository.update(position);
    }
}
