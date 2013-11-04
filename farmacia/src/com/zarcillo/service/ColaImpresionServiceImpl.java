package com.zarcillo.service;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.dao.RegistroSalidaDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Moneda;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.SituacionPedido;
import com.zarcillo.domain.TipoPago;
import com.zarcillo.domain.Usuario;
import com.zarcillo.negocio.Dia;
import com.zarcillo.negocio.Numero;
import java.math.BigDecimal;
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
    @Autowired
    private AmortizacionClienteDAO amortizaciondao;
    @Autowired
    private DocumentoDAO documentodao;

    @Override
    @Transactional
    public ComprobanteEmitido crearDocumento(RegistroSalida regsalida, TipoPago tipo, Usuario usuario) {
        try {
            //////// SITUACION PEDIDO
            RegistroSalida r = regsalidadao.buscarPorIdregsalida(regsalida.getIdregsalida());
            if (r.getBimpreso()) {
                throw new ExceptionZarcillo("La Operacion ya fue Impresa");
            }
            
            if (regsalida.getIdcliente().getBnoredondeo()) {
                regsalida.setNimporte(regsalida.getNimporte().subtract(regsalida.getNredondeo()));
                regsalida.setNredondeo(Numero.cero);
            }

            Periodo periodo = periododao.buscarPorFecha(new Date());
            regsalida.setIdsituacion(SituacionPedido.IMPRESO);
            //////// SITUACION PEDIDO

            //Devolver el Detalle Cargado
            // y evitar el error de lazy , no borrar
            List<Movimiento> lista = movimientodao.listaPorIdregsalida(regsalida.getIdregsalida());
            regsalida.setMovimientoCollection(lista);
            //Devolver el Detalle Cargado

            if (regsalida.getIdcliente().getCruc() == null && regsalida.getIdcliente().getCdni() == null) {
                throw new ExceptionZarcillo("El cliente no tiene documento de identidad rebice por favor");
            }

            if (regsalida.getIdcliente().getCruc() != null) {
                if (!regsalida.getIdcliente().getCruc().isEmpty()) {
                    regsalida.setIddocumento(documentodao.buscarPorCcodigosunat(Documento.FACTURA_SUNAT.getCcodigosunat()));
                }
            }


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
            comprobante.setIdcondicion(regsalida.getIdcondicion());
            comprobante.setDfecemi(regsalida.getDfecha());
            comprobante.setNplazo(regsalida.getNplazo());
            comprobante.setIddocumento(regsalida.getIddocumento());
            comprobante.setIdperiodo(periodo);
            comprobante.setDfecreg(new Date());
            comprobante.setDfecven(Dia.sumarDias(regsalida.getDfecha(), regsalida.getNplazo()));
            comprobante.setNinafecto(regsalida.getNinafecto());
            comprobante.setNafecto(regsalida.getNafecto());
            comprobante.setNigv(regsalida.getNigv());
            comprobante.setNimporte(regsalida.getNimporte());
            comprobante.setNsaldo(regsalida.getNimporte());
            comprobante.setNfleven(regsalida.getNfleven());
            comprobante.setNredondeo(regsalida.getNredondeo());
            comprobante.setIdmoneda(regsalida.getIdmoneda());
            comprobante.setIdregsalida(regsalida);
            comprobante.setIdcliente(regsalida.getIdcliente());
            comprobante.setIdunidad(regsalida.getIdunidad());
            comprobante.setIdvendedor(regsalida.getIdvendedor());
            comprobante.setNcosto(regsalida.getNcosto());
            comprobante.setIdusuario(regsalida.getIdusuario());
            // inicio se establece el periodo
            regsalida.setIdperiodo(periodo);
            // fin se establece el periodo
            //fin de periodo
            regsalida.setDfecven(comprobante.getDfecven());
            
            
            cruddao.actualizar(regsalida);

            cruddao.registrar(comprobante);

            if (comprobante.getIdcondicion().getBcontado()) {
                AmortizacionCliente amortizacion = new AmortizacionCliente();
                amortizacion.setIdcomprobante(comprobante);
                amortizacion.setIddocumento(comprobante.getIddocumento());
                amortizacion.setIdtipo(tipo);
                amortizacion.setIdmoneda(Moneda.SOLES);
                amortizacion.setIdperiodo(periodo);
                amortizacion.setIdusuario(usuario);
                amortizacion.setIdvendedor(regsalida.getIdvendedor());
                amortizacion.setNimporte(comprobante.getNimporte());
                amortizacion.setNtipocambio(Numero.uno);
                amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                amortizacion.setDfecha(new Date());

                //
                amortizacion.setDfecreg(new Date());
                amortizacion.setIdperiodo(periodo);
                amortizacion.setIdcomprobante(comprobante);
                BigDecimal nimporteamortizar = amortizacion.getNimporte();
                //CUENTAS PAGAR Y AMORTIZAZION TIENEN IGUAL MONEDA
                if (comprobante.getIdmoneda().getIdmoneda().equals(amortizacion.getIdmoneda().getIdmoneda())) {
                    nimporteamortizar = amortizacion.getNimporte();
                    amortizacion.setNimportes(nimporteamortizar.multiply(amortizacion.getNtipocambio()));
                } else {
                    //SI CUENTAS PAGAR ES SOLES
                    if (comprobante.getIdmoneda().getBnacional()) {
                        //SI CUENTAS PAGAR ES SOLES Y LA AMORTIZACION ES EN MONEDA EXTRANJERA
                        if (!amortizacion.getIdmoneda().getBnacional()) {
                            amortizacion.setNimportes(amortizacion.getNimporte().multiply(amortizacion.getNtipocambio()));
                            nimporteamortizar = amortizacion.getNimportes();
                        }
                    } else {
                        //SI CUENTAS PAGAR ES MONEDA EXTRANJERA Y LA AMORTIZACION ES EN SOLES
                        if (amortizacion.getIdmoneda().getBnacional()) {
                            nimporteamortizar = amortizacion.getNimporte().divide(amortizacion.getNtipocambio(), 2, BigDecimal.ROUND_HALF_UP);
                            amortizacion.setIdmoneda(comprobante.getIdmoneda());
                            amortizacion.setNimportes(amortizacion.getNimporte());
                            amortizacion.setNimporte(nimporteamortizar);
                        }
                    }//FIN SI CUENTAS PAGAR ES SOLES
                }//FIN SI MONEDAS SONIGUALES

                cruddao.registrar(amortizacion);

                comprobante.setNacuenta(comprobante.getNacuenta().add(nimporteamortizar));
                comprobante.setNsaldo(comprobante.getNsaldo().subtract(nimporteamortizar));
                if (Numero.isCero(comprobante.getNsaldo())) {
                    comprobante.setDfeccan(amortizacion.getDfecha());
                }
                cruddao.actualizar(comprobante);
            }




            return comprobante;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }


    }
}
