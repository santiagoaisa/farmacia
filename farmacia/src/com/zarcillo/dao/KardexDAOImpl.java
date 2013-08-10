package com.zarcillo.dao;

import com.zarcillo.dto.almacen.Kardex;
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
public class KardexDAOImpl implements KardexDAO {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Kardex> listaEntradaPorIdalmacenPorIdproductoPorIdperiodo(Integer idalmacen, String idproducto, Integer idperiodo) {
        String sql = "select m.idmovimiento as id,m.idregentrada as noperacion,0 as nnro, date_part('day',r.dfecha) as ndia,r.dfecha as dfecmov,"
                + " d.cabrev, r.cserie as cserfac,r.cnumero as cfactura,'' as csergui,'' as cguia,m.ctipmov as ctipmov,p.idproveedor as idcodigo ,p.cnomprovee as cnombre,ncantidad as ncompra,"
                + " 0 as nventa,0 as nsaldo,m.clote,m.cfecven as cfecven,"
                + " m.idregentrada as nregentrada,m.idregsalida as nregsalida,m.ncosuni,m.ncantidad*m.ncosuni as nimporteentrada,0.00 as nimportesalida,0.00 as nimportesaldo,m.ndesfin,m.ndesbon,m.ndeslab,0.00 as nvaluni,'x' as idtransportista,'false' as banulado,false as bdevuelto,false as bresumen,u.cubigeo as cnomdistrito,u.cnomprovincia,u.cnomdepartamento, "
                + " ncantidadm as ncompram,0 as nventam,0 as nsaldom"                
                + " from movimiento m,registro_entrada r,proveedor p,documento d,ubigeo u "
                + " where r.iddocumento=d.iddocumento and  m.idregentrada=r.idregentrada and r.idproveedor=p.idproveedor and p.idubigeo=u.idubigeo and m.idalmacen=:idalmacen and  m.idproducto=:idproducto  and r.idperiodo=:idperiodo  ";

        return em.createNativeQuery(sql, Kardex.class).setParameter("idproducto", idproducto).setParameter("idalmacen", idalmacen).setParameter("idperiodo", idperiodo).getResultList();
    }

    @Override
    public List<Kardex> listaSalidaPorIdalmacenPorIdproductoPorIdperiodo(Integer idalmacen, String idproducto, Integer idperiodo) {
        String sql = " select m.idmovimiento as id,m.idregsalida as noperacion,0 as nnro, date_part('day',r.dfecha) as ndia,r.dfecha as dfecmov,"
                + " d.cabrev, r.cserie as cserfac,r.cnumero as cfactura,r.csergui,r.cnumgui as cguia,m.ctipmov as ctipmov,c.idcliente as idcodigo ,c.cnomcli as cnombre,0 as ncompra,"
                + " ncantidad as nventa,0 as nsaldo,m.clote,m.cfecven as cfecven,"
                + " m.idregsalida as nregsalida,m.idregentrada as nregentrada,m.ncosuni,0.00 as nimporteentrada,m.ncantidad*m.ncosuni as nimportesalida,0.00 as nimportesaldo,m.ndesfin,m.ndesbon,m.ndeslab,0.00 as nvaluni,'x' as idtransportista,r.banulado,false as bdevuelto,false as bresumen,u.cubigeo as cnomdistrito,u.cnomprovincia,u.cnomdepartamento, "                
                +" 0 as ncompram,ncantidadm as nventam,0 as nsaldom "
                + " from movimiento m,registro_salida r,cliente c,documento d,ubigeo u "
                + " where r.iddocumento=d.iddocumento and m.idregsalida=r.idregsalida and r.idcliente=c.idcliente and c.idubigeo=u.idubigeo and m.idalmacen=:idalmacen and  m.idproducto=:idproducto  and r.idperiodo=:idperiodo ";

        return em.createNativeQuery(sql, Kardex.class).setParameter("idproducto", idproducto).setParameter("idalmacen", idalmacen).setParameter("idperiodo", idperiodo).getResultList();
    }
}
