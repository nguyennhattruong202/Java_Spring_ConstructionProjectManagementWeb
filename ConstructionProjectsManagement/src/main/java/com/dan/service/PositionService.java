/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dan.service;

import com.dan.pojo.Position;
import java.util.List;

public interface PositionService {

    List<Position> getPosition(boolean active, String kw);

    Position findPositionById(int id, boolean active);

    boolean removePosition(int id);

    boolean updatePosition(int id, String name, String description);
    
    Position addPosition(String name, String description);
}
