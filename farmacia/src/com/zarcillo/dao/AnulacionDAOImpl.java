package com.zarcillo.dao;

import com.zarcillo.domain.Anulacion;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class AnulacionDAOImpl implements AnulacionDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Anulacion> listaPorFechas(Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("Anulacion.findByFechas").setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }

    @Override
    public List<String> listaSeriesPorIdunidadPorIddocumentoPorFechas(Integer idunidad, Integer iddocumento, Date fecha1, Date fecha2) {
        String sql = " select  cast(min(cserie) as character varying) "
                + " from comprobante_emitido   where dfecemi BETWEEN :fecha1 and :fecha2 and idunidad=:idunidad  and iddocumento=:iddocumento "
                + " group by cserie order by cserie ";

        List<String> lista = em.createNativeQuery(sql).setParameter("idunidad", idunidad).setParameter("iddocumento", iddocumento).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();

        return lista;
    }

    @Override
    public String minimoPorIddocumentoPorCserie(Integer iddocumento, String cserie, Date fecha1, Date fecha2) {
        String sql = " select  cast(min(cnumero) as character varying) "
                + " from comprobante_emitido where iddocumento=:iddocumento and dfecemi between :fecha1 and :fecha2 and cserie=:cserie "
                + " group by cserie ";

        String numero = "0";
        try {
            numero = (String) em.createNativeQuery(sql).setParameter("iddocumento", iddocumento).setParameter("cserie", cserie).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getSingleResult();
        } catch (NoResultException e) {
            numero = "0";
        }
        return numero;
    }

    @Override
    public String maximoPorIddocumentoPorCserie(Integer iddocumento, String cserie, Date fecha1, Date fecha2) {
        String sql = " select  cast(max(cnumero) as character varying) "
                + " from comprobante_emitido where iddocumento=:iddocumento and dfecemi between :fecha1 and :fecha2 and cserie=:cserie "
                + " group by cserie ";

        String numero = "0";
        try {
            numero = (String) em.createNativeQuery(sql).setParameter("iddocumento", iddocumento).setParameter("cserie", cserie).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getSingleResult();
        } catch (NoResultException e) {
            numero = "0";
        }

        return numero;
    }
}
