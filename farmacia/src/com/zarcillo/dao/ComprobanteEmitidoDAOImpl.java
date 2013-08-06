package com.zarcillo.dao;

import com.zarcillo.domain.ComprobanteEmitido;
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

    @PersistenceContext(type = PersistenceContextType.EXTENDED)
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
}
