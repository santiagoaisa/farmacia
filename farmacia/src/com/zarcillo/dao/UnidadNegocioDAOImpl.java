package com.zarcillo.dao;

import com.zarcillo.domain.UnidadNegocio;
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
public class UnidadNegocioDAOImpl implements UnidadNegocioDAO{
    
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public UnidadNegocio busqueda(Integer idunidad) {
        return (UnidadNegocio) em.createNamedQuery("UnidadNegocio.findByIdunidad").setParameter("idunidad", idunidad).getSingleResult();
    }

    @Override
    public List<UnidadNegocio> listaPorClogin(String clogin) {
        String sql="select distinct n.* from  unidad_negocio n,usuario u,acceso a,almacen al where a.idusuario=u.idusuario and al.idalmacen=a.idalmacen and n.idunidad=al.idunidad  and u.clogin=:clogin order by n.cnomunidad";
        return em.createNativeQuery( sql,UnidadNegocio.class).setParameter("clogin",clogin).getResultList() ;
    }
    
    
    
}
