package com.zarcillo.dao;

import com.zarcillo.domain.Documento;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class DocumentoDAOImpl implements DocumentoDAO{
    
     @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Documento busqueda(Integer iddocumento) {
        return (Documento) em.createNamedQuery("Documento.findByIddocumento").setParameter("iddocumento", iddocumento).getSingleResult();
    }
    
}
