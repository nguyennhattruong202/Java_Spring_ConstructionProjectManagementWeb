/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dan.repository;

import com.dan.pojo.Partner;
import java.util.List;

public interface PartnerRepository {

    List<Partner> getPartner();

    void removePartner(int id);
}
