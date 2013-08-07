package com.zarcillo.service;

import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.RegistroSalidaDAO;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.SituacionPedido;
import com.zarcillo.negocio.Dia;
import java.text.DecimalFormat;
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
@Service("colaImpresionService")
@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class ColaImpresionServiceImpl implements ColaImpresionService {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private RegistroSalidaDAO regsalidadao;
    @Autowired
    private ComprobanteEmitidoDAO comprobantedao;
    @Autowired
    private MovimientoDAO movimientodao;
    @Autowired
    private NumeracionDAO numeraciondao;
    @Autowired
    private PeriodoDAO periododao;

    @Override
    @Transactional
    public ComprobanteEmitido crearDocumento(Integer idregsalida) {
        try {
            RegistroSalida regsalida = regsalidadao.buscarPorIdregsalida(idregsalida);

            //////// SITUACION PEDIDO
            regsalida.setIdsituacion(SituacionPedido.IMPRESO);
            //////// SITUACION PEDIDO

            //Devolver el Detalle Cargado
            // y evitar el error de lazy , no borrar
            List<Movimiento> lista = movimientodao.listaPorIdregsalida(regsalida.getIdregsalida());
            regsalida.setMovimientoCollection(lista);
            //Devolver el Detalle Cargado

            DecimalFormat formato = new DecimalFormat("000000");
            Numeracion numeracion;
            String numero;

            //si es Factura 

            numeracion = numeraciondao.incrementar(regsalida.getIdunidad().getIdunidad(), regsalida.getIddocumento().getIddocumento());
            numero = formato.format(numeracion.getNnumero());
            regsalida.setCserie(numeracion.getCserie());
            regsalida.setCnumero(numero);

            regsalida.setDfecimp(new Date());
            regsalida.setBimpreso(true);

            ComprobanteEmitido comprobante = new ComprobanteEmitido();
            comprobante.setCserie(numeracion.getCserie());
            comprobante.setCnumero(numero);

            comprobante.setDfecemi(regsalida.getDfecha());
            comprobante.setNplazo(regsalida.getNplazo());

            comprobante.setDfecven(Dia.sumarDias(regsalida.getDfecha(), regsalida.getNplazo()));
            comprobante.setNinafecto(regsalida.getNinafecto());
            comprobante.setNafecto(regsalida.getNafecto());
            comprobante.setNigv(regsalida.getNigv());
            comprobante.setNimporte(regsalida.getNimporte());
            comprobante.setNsaldo(regsalida.getNimporte());
            comprobante.setNfleven(regsalida.getNfleven());
            comprobante.setNredondeo(regsalida.getNredondeo());
            comprobante.setIdregsalida(regsalida);
            comprobante.setIdcliente(regsalida.getIdcliente());
            comprobante.setIdunidad(regsalida.getIdunidad());
            comprobante.setIdvendedor(regsalida.getIdvendedor());
            comprobante.setNcosto(regsalida.getNcosto());
            comprobante.setIdusuario(regsalida.getIdusuario());
            // inicio se establece el periodo

            Periodo periodo = periododao.buscarPorFecha(regsalida.getDfecha());
            regsalida.setIdperiodo(periodo);
            // fin se establece el periodo
            //fin de periodo
            regsalida.setDfecven(comprobante.getDfecven());
            cruddao.actualizar(regsalida);

            cruddao.registrar(comprobante);


            return comprobante;
        } catch (Exception e) {
            throw new ExceptionZarcillo(e.getMessage());
        }
    }
}
