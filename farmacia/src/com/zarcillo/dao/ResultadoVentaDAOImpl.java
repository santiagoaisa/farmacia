package com.zarcillo.dao;

import com.zarcillo.dto.caja.CobroPorDocumento;
import com.zarcillo.estadistica.VentaPorDocumento;
import com.zarcillo.estadistica.VentaPorProducto;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

/**
 *
 * @author saisa
 */
@Repository
public class ResultadoVentaDAOImpl implements ResultadoVentaDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<CobroPorDocumento> listaVentaPorDocumentoPorIdunidadPorIdusuarioPorFechas(Integer idunidad, Integer idusuario, Date fecha1, Date fecha2) {
        String sql = " select random() as id,c.idregsalida,c.iddocumento,c.cserie,c.cnumero,c.idcondicion,c.dfecemi,c.nimporte,c.nacuenta,c.nsaldo,a.idtipo,a.dfecreg as dfecmov,a.nimporte as nmonto, "
                + " 0.00 as nefectivo,0.00 as ntdebito,0.00 as ntcredito,0.00 as ntotal "                
                + " from registro_salida r,comprobante_emitido c,amortizacion_cliente a "
                + " where r.idregsalida=c.idregsalida and c.idcomprobante=a.idcomprobante and c.idunidad=:idunidad  and a.dfecha between :fecha1 and :fecha2 and a.idusuario=:idusuario "
                + " ORDER BY c.iddocumento,c.cserie,c.cnumero ";

        return em.createNativeQuery(sql, CobroPorDocumento.class).setParameter("idunidad", idunidad).setParameter("idusuario", idusuario).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();
    }

    @Override
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidaPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        String sql = "select random() as id, m.idproducto,m.idalmacen,m.ncantidad as nentero,m.ncantidadm as nfraccion,sum(nsubtot) as nsubtot,sum(ncosuni*(m.ncantidad +m.ncantidadm )) as nsubcos,0.00 as nprecos,0.00 as nprecio,0.00 as nutilidad "
                + " from registro_salida r,movimiento m,comprobante_emitido c,motivo_salida mo "
                + " where r.idregsalida=m.idregsalida and c.idregsalida=r.idregsalida and mo.idmotivo=r.idmotivo "
                + " and mo.bventa=true and r.idunidad=:idunidad and r.dfecha between :fecha1 and :fecha2 "
                + " group by m.idproducto,m.idalmacen,m.ncantidad,m.ncantidadm ";

        return em.createNativeQuery(sql, VentaPorProducto.class).setParameter("idunidad", idunidad).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();

    }

    @Override
    public List<VentaPorDocumento> listaVentaPorDocumentoPorIdunidadPorIdvendedorPorFechas(Integer idunidad, Integer idvendedor, Date fecha1, Date fecha2) {
        String sql = "select random() as id,c.idregsalida,c.iddocumento,c.dfecemi,c.cserie,c.cnumero,c.idcondicion,c.nafecto,c.ninafecto,c.nigv,c.nredondeo,c.nimporte,c.ncosto,0.00 as nutilidad "
                + " from registro_salida r,comprobante_emitido c,motivo_salida mo "
                + " where c.idregsalida=r.idregsalida and mo.idmotivo=r.idmotivo "
                + " and mo.bventa=true and r.idvendedor=:idvendedor and r.idunidad=:idunidad and r.dfecha between :fecha1 and :fecha2 ";

        return em.createNativeQuery(sql, VentaPorDocumento.class).setParameter("idunidad", idunidad).setParameter("idvendedor", idvendedor).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();
    }
}
