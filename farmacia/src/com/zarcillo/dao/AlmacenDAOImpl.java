package com.zarcillo.dao;

import com.zarcillo.domain.Almacen;
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
public class AlmacenDAOImpl implements AlmacenDAO {

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager em;

    @Override
    public Almacen busqueda(Integer idalmacen) {
        return (Almacen) em.createNamedQuery("Almacen.findByIdalmacen").setParameter("idalmacen", idalmacen).getSingleResult();
    }

    @Override
    public List<Almacen> listaPorClogin(String clogin) {
        String sql = "select distinct  a.* from  almacen a,usuario u,acceso b  where u.idusuario=b.idusuario and a.idalmacen=b.idalmacen and u.clogin=:clogin ORDER BY a.idalmacen ";
        return em.createNativeQuery(sql, Almacen.class).setParameter("clogin", clogin).getResultList();

    }

    @Override
    public List<Almacen> listaGeneral() {
        return em.createNamedQuery("Almacen.findAll").getResultList();
    }
    
    
    
    
}
