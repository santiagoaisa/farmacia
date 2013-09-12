package com.zarcillo.dao;

import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.dto.anulacion.CorrelativoComprobante;
import java.util.Date;
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
public class ComprobanteEmitidoDAOImpl implements ComprobanteEmitidoDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public ComprobanteEmitido buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunidad, Integer iddocumento, String cserie, String cnumero) {
        return (ComprobanteEmitido) em.createNamedQuery("ComprobanteEmitido.findByIdunidadByIddocumentoByCserieByCnumero").setParameter("idunidad", idunidad).setParameter("iddocumento", iddocumento).setParameter("cserie", cserie).setParameter("cnumero", cnumero).getSingleResult();
    }

    @Override
    public ComprobanteEmitido buscarPorIdregsalida(Integer idregsalida) {
        return (ComprobanteEmitido) em.createNamedQuery("ComprobanteEmitido.findByIdregsalida").setParameter("idregsalida", idregsalida).getSingleResult();
    }

    @Override
    public ComprobanteEmitido buscarPorIdcomprobante(Integer idcomprobante) {
        return (ComprobanteEmitido) em.createNamedQuery("ComprobanteEmitido.findByIdcomprobante").setParameter("idcomprobante", idcomprobante).getSingleResult();
    }

    @Override
    public List<ComprobanteEmitido> listaPorIdunidadPorIdclientePorNano(Integer idunidad, Integer idcliente, Integer nano) {
        return em.createNamedQuery("ComprobanteEmitido.findByIdunidadByIdclienteByNano").setParameter("idunidad", idunidad).setParameter("idcliente", idcliente).setParameter("nano", nano).getResultList();
    }

    @Override
    public List<ComprobanteEmitido> listaPendientesPorFechasPendientes(Date dfecha1, Date dfecha2) {
        return em.createNamedQuery("ComprobanteEmitido.findByDfechasPendientes").setParameter("dfecha1", dfecha1).setParameter("dfecha2", dfecha2).getResultList();
    }

    @Override
    public List<CorrelativoComprobante> listaPorIddocumentoPorCseriePorFechas(Integer iddocumento, String cserie, Date fecha1, Date fecha2) {       
        String sql = " select idcomprobante as id,iddocumento,cserie,cnumero,dfecemi as dfecha "
                + " from comprobante_emitido "
                + " where iddocumento=:iddocumento and  dfecemi BETWEEN :fecha1 and :fecha2 and cserie=:cserie "
                + " order by cnumero ";

        List<CorrelativoComprobante> lista = em.createNativeQuery(sql, CorrelativoComprobante.class).setParameter("iddocumento", iddocumento).setParameter("cserie", cserie).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();
        return lista;
    }
}
