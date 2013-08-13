/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zarcillo.dao;

import com.zarcillo.domain.MotivoAnulacion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author THIAGO
 */
@Repository
public class MotivoAnulacionDAOImpl implements MotivoAnulacionDAO{
    
    @PersistenceContext
    private EntityManager em;

    @Override
    public List<MotivoAnulacion> listaGeneral() {
        return em.createNamedQuery("MotivoAnulacion.findAll").getResultList();
    }
    
    
    
}
