package com.zarcillo.service;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.RegistroEntradaDAO;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.dto.almacen.DetalleIngreso;
import com.zarcillo.negocio.Entrada;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author saisa
 */
@Service("registroEntradaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RegistroEntradaServiceImpl extends Entrada implements RegistroEntradaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private RegistroEntradaDAO registroentradadao;
    @Autowired
    private MovimientoDAO movimientodao;

    @Override
    @Transactional
    public RegistroEntrada registrarIngreso(RegistroEntrada regentrada) {
        super.registrar(regentrada);
        return regentrada;
    }

    @Override
    @Transactional
    public void anularIngreso(Integer idregentrada) {
        super.eliminar(idregentrada);
    }

    @Override
    public RegistroEntrada buscarPorIdalmacenPorIdregentrada(Integer idalmacen, Integer idregentrada) {
        try {
            return registroentradadao.buscarPorIdalmacenPorIdregentrada(idalmacen, idregentrada);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe en Ingreso :" + idregentrada);
        }
    }

    @Override
    public List<DetalleIngreso> listaDetalleIngreso(Integer idregentrada) {
        List<Movimiento> listaMovimientos = movimientodao.listaPorIdregentrada(idregentrada);
        List<DetalleIngreso> listaIngreso = new ArrayList<DetalleIngreso>();

        DetalleIngreso detalle;
        for (Movimiento m : listaMovimientos) {
            detalle = new DetalleIngreso();
            detalle.setId(m.getIdmovimiento());
            detalle.setIdproducto(m.getExistencia().getIdproducto());

            detalle.setNcantidad(m.getNcantidad());
            detalle.setBinafec(m.getBinafecto());
            detalle.setNcosuni(m.getNcosuni());
            detalle.setNvalven(m.getNvaluni());
            detalle.setCfecven(m.getCfecven());
            detalle.setClote(m.getClote());
            detalle.setNsubtot(m.getNsubtot());
            listaIngreso.add(detalle);
        }
        return listaIngreso;
    }

    @Override
    public List<RegistroEntrada> listaPorFechas(Integer idalmacen, Date dfecha1, Date dfecha2) {
        return registroentradadao.listaPorFechas(idalmacen, dfecha1, dfecha2);
    }

    @Override
    public List<RegistroEntrada> listaPorIdalmacenPorIdproveedorPorNano(Integer idalmacen, String idproveedor, Integer nano) {
        return registroentradadao.listaPorIdalmacenPorIdproveedorPorNano(idalmacen, idproveedor, nano);
    }
    
    
    
}
