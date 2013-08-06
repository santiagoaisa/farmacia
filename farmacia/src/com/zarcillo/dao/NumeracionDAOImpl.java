package com.zarcillo.dao;

import com.zarcillo.domain.Numeracion;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class NumeracionDAOImpl implements NumeracionDAO{
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Numeracion incrementar(Integer idunineg, Integer iddocumento) {
        Numeracion numeracion=(Numeracion) em.createNamedQuery("Numeracion.findByIdunidadByIddocumento").setParameter("idunidad",idunineg).setParameter("iddocumento",iddocumento).getSingleResult();
        numeracion.setNnumero(numeracion.getNnumero()+1);
        em.merge(numeracion);
        return numeracion ;
    }

    @Override
    public Numeracion buscarPorIdunidadPorIddocumento(Integer idunidad, Integer iddocumento) {
        return (Numeracion) em.createNamedQuery("Numeracion.findByIdunidadByIddocumento").setParameter("idunidad",idunidad).setParameter("iddocumento", iddocumento).getSingleResult();
    }

    @Override
    public Numeracion buscarPorIddocumentoPorCserie(Integer idunidad, Integer iddocumento, Integer cserie) {
        return (Numeracion) em.createNamedQuery("Numeracion.findByIdunidadByIddocumentoByCserie").setParameter("idunidad",idunidad).setParameter("iddocumento", iddocumento).setParameter("cserie",cserie).getSingleResult();
    }

    @Override
    public Numeracion buscarPorIdnumeracion(Integer idnumeracion) {
        return (Numeracion) em.createNamedQuery("Numeracion.findByIdnumeracion").setParameter("idnumeracion",idnumeracion).getSingleResult();
    }

    
    
}
