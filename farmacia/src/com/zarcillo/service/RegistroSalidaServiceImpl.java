package com.zarcillo.service;

import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.RegistroSalidaDAO;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.negocio.Igv;
import com.zarcillo.negocio.Salida;
import java.text.DecimalFormat;
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
@Service("registroSalidaService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RegistroSalidaServiceImpl extends Salida implements RegistroSalidaService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private RegistroSalidaDAO registrosalidadao;
    @Autowired
    private MovimientoDAO movimientodao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    DecimalFormat formato = new DecimalFormat("000000");

    @Override
    @Transactional
    public void reemplazarNumeracion(Integer idregsalida, String cserie, String cnumero) {
        try {
            String cformato = formato.format(Integer.parseInt(cnumero.trim()));
            ComprobanteEmitido comprobante = comprobantedao.buscarPorIdregsalida(idregsalida);
            comprobante.setCserie(cserie);
            comprobante.setCnumero(cformato);
            cruddao.actualizar(comprobante);

            RegistroSalida regsalida = registrosalidadao.buscarPorIdregsalida(idregsalida);
            regsalida.setCserie(cserie);
            regsalida.setCnumero(cformato);
            cruddao.actualizar(regsalida);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    @Override
    public List<DetalleVenta> listaDetalleSalida(Integer idregsalida) {
        List<Movimiento> listaMovimientos = movimientodao.listaPorIdregsalida(idregsalida);
        List<DetalleVenta> listaDetalle = new ArrayList<>();

        DetalleVenta d;
        Existencia e;
        for (Movimiento m : listaMovimientos) {

            d = new DetalleVenta();
            d.setDfecha(m.getIdregsalida().getDfecha());
            d.setId(m.getIdmovimiento());
            e = new Existencia();
            e.setIdalmacen(m.getIdalmacen());
            e.setIdproducto(m.getIdproducto());
            d.setExistencia(e);
            //Utilizo setncantidad para que no se mezcle con setncanart que
            //se utiliza para calcular descuentos

            d.setNcantidad(m.getNcantidad());
            d.setNcanartm(m.getNcantidadm());
            d.setNcosuni(m.getNcosuni());
            d.setNcosunim(m.getNcosuni());
            d.setNdesfin(m.getNdesfin());
            d.setNdesbon(m.getNdesbon());
            d.setNdeslab(m.getNdeslab());
            d.setBinafec(m.getBinafecto());
            d.setNvaluni(m.getNvaluni());
            d.setNvalunim(m.getNvaluni());
            d.setNpreuni(Igv.importeDetalleVenta(m.getNvaluni(), m.getIdproducto().getBinafecto()));
            d.setNimporte(Igv.importeDetalleVenta(m.getNsubtot(), m.getIdproducto().getBinafecto()));
            d.setNsubtot(m.getNsubtot());
            d.setClote(m.getClote());
            d.setCfecven(m.getCfecven());

            if (m.getNcantidad() > 0) {
                d.setBfraccion(false);
            } else {
                if (m.getNcantidadm() > 0) {
                    d.setBfraccion(true);
                }
            }



            listaDetalle.add(d);
        }

        return listaDetalle;
    }

    @Override
    public RegistroSalida buscarPorIdunidadPorIdregsalida(Integer idunidad, Integer idregsalida) {
        try {
            return registrosalidadao.buscarPorIdunidadIdregsalida(idunidad, idregsalida);
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe la Salida con operacion : " + idregsalida);
        }
    }

    @Override
    public RegistroSalida buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(Integer idunineg, Integer iddocumento, String serie, String numero) {

        DecimalFormat formato = new DecimalFormat("000000");
        String cnumero = formato.format(Integer.parseInt(numero.trim()));
        RegistroSalida regsalida = null;
        try {
            ComprobanteEmitido comprobante = comprobantedao.buscarPorIdunidadPorIddocumentoPorCseriePorCnumero(idunineg, iddocumento, serie, cnumero);
            regsalida = comprobante.getIdregsalida();
        } catch (Exception e) {
            throw new ExceptionZarcillo("No existe El Documento : " + serie + cnumero);
        }

        return regsalida;
    }

    @Override
    public List<RegistroSalida> listaPorIdunidadPorMotivoPorFechas(Integer idunidad, Integer idmotivo, Date dfecha1, Date dfecha2) {
        return registrosalidadao.listaPorIdunidadPorIdmotivoPorFechas(idunidad, idmotivo, dfecha1, dfecha2);
    }
}
