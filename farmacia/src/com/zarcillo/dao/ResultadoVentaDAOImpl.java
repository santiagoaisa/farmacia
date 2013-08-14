package com.zarcillo.dao;

import com.zarcillo.dto.venta.VentaPorProducto;
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
    public List<VentaPorProducto> listaVentaPorProductoPorIdunidaPorFechas(Integer idunidad, Date fecha1, Date fecha2) {
        String sql = "select random() as id, m.idproducto,m.idalmacen,m.ncantidad as nentero,m.ncantidadm as nfraccion,sum(nsubtot) as nsubtot,sum(ncosuni*(m.ncantidad +m.ncantidadm )) as ncostot,0.00 as nprecos,0.00 as nprecio,0.00 as nutilidad "
                + " from registro_salida r,movimiento m,comprobante_emitido c,motivo_salida mo "
                + " where r.idregsalida=m.idregsalida and c.idregsalida=r.idregsalida and mo.idmotivo=r.idmotivo "
                + " and mo.bventa=true and r.idunidad=:idunidad and r.dfecha between :fecha1 and :fecha2 "
                + " group by m.idproducto,m.idalmacen,m.ncantidad,m.ncantidadm ";

        return em.createNativeQuery(sql, VentaPorProducto.class).setParameter("idunidad", idunidad).setParameter("fecha1", fecha1).setParameter("fecha2", fecha2).getResultList();

    }
}
