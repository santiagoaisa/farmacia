package com.zarcillo.dao;

import com.zarcillo.domain.Documento;
import java.util.List;
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

    @Override
    public Documento buscarPorCcodigosunat(String ccodigosunat) {
        return (Documento) em.createNamedQuery("Documento.findByCcodigosunat").setParameter("ccodigosunat", ccodigosunat).getSingleResult();
    }

    
    
    @Override
    public List<Documento> listaPorBcompra() {
        return em.createNamedQuery("Documento.findByBcompra").getResultList();
    }

    @Override
    public List<Documento> listaPorBventa() {
        return em.createNamedQuery("Documento.findByBventa").getResultList();
    }

    @Override
    public List<Documento> listaPorBpago() {
        return em.createNamedQuery("Documento.findByBpago").getResultList();
    }

    @Override
    public List<Documento> listaGeneral() {
        return em.createNamedQuery("Documento.findAll").getResultList();
    }
    
    
    
    
    
}
