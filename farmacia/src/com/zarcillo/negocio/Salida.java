package com.zarcillo.negocio;

import com.zarcillo.dao.AmortizacionClienteDAO;
import com.zarcillo.dao.ComprobanteEmitidoDAO;
import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.DocumentoDAO;
import com.zarcillo.dao.ExistenciaDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.dao.MovimientoDAO;
import com.zarcillo.dao.NumeracionDAO;
import com.zarcillo.dao.OrdenLineaDAO;
import com.zarcillo.dao.PeriodoDAO;
import com.zarcillo.domain.AmortizacionCliente;
import com.zarcillo.domain.Anulacion;
import com.zarcillo.domain.Cliente;
import com.zarcillo.domain.ComprobanteEmitido;
import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.DetalleAnulacion;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.MotivoAnulacion;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.MotivoSalida;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Numeracion;
import com.zarcillo.domain.OrdenLinea;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.SituacionPedido;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.util.OrdenarPorIdproductoMovimiento;
import com.zarcillo.util.OrdenarPorNordenMovimiento;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Salida extends DescargaLote {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private PeriodoDAO periododao;
    @Autowired
    private ExistenciaDAO existenciadao;
    @Autowired
    private LoteDAO lotedao;
    @Autowired
    private OrdenLineaDAO ordenlineadao;

    public Integer registrar(RegistroSalida regsalida) {
        try {
            regsalida.setDfecreg(new Date());
            Periodo periodo = periododao.buscarPorFecha(new Date());
            regsalida.setIdperiodo(periodo);
            // fin se establece el periodo
            String cglosa = "";
            regsalida.setCglosa(cglosa);
            regsalida.calcula(regsalida.getIdperiodo().getNigv());
            //////// SITUACION PEDIDO
            regsalida.setIdsituacion(SituacionPedido.DIGITADO);
            //////// SITUACION PEDIDO
            cruddao.registrar(regsalida);

            List<OrdenLinea> listaOrdenLinea = ordenlineadao.listaPorIdunidad(regsalida.getIdunidad().getIdunidad());
            List<Movimiento> listaMovimiento = regsalida.getMovimientoCollection();
            Collections.sort(listaMovimiento, new OrdenarPorIdproductoMovimiento());
            for (OrdenLinea ol : listaOrdenLinea) {
                for (Movimiento m : listaMovimiento) {
                    //zARREGLAR
                    if (m.getIdproducto().getIdsublinea().getIdlinea().getIdlinea().equals(ol.getIdlinea().getIdlinea())) {
                        m.setNorden(ol.getNorden());
                    } else {
                        if (m.getNorden().equals(999)) {
                            m.setNorden(999);
                        }
                    }
                }
            }
            Collections.sort(listaMovimiento, new OrdenarPorNordenMovimiento());

            Existencia existencia;
            for (Movimiento m : listaMovimiento) {
                existencia = existenciadao.buscarPorIdalmacenPorIdproducto(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());
                //Descargo del Stock
                // si solo es entero
                if (m.getNcantidad() > 0) {
                    existencia.setNstock(existencia.getNstock() - m.getNcantidad());
                } else {
                    // si es menudeo y tengo stock de menudeo
                    if (existencia.getNstockm() > m.getNcantidadm()) {
                        existencia.setNstockm(existencia.getNstockm() - m.getNcantidadm());
                    } else {
                        BigDecimal cantidadsalida = new BigDecimal(m.getNcantidadm()).divide(new BigDecimal(m.getIdproducto().getNmenudeo()), 2, BigDecimal.ROUND_HALF_UP);
                        if (Numero.isMayor(cantidadsalida, Numero.uno)) {
                            throw new ExceptionZarcillo("La cantidad vendida en fraccion es mayor a la cantidad de menudeo asignada");
                        } else {
                            existencia.setNstockm(existencia.getNstockm() - m.getNcantidadm());
                            /// cantidad de salida
                        }
                    }
                }



                //Descargo del temporal
                //existencia.setNtemporal(existencia.getNtemporal() - m.getNcantidad());
                cruddao.actualizar(existencia);

                m.setIdregsalida(regsalida);
                m.setCtipmov("S");
                m.setNstock(existencia.getNstock());
                m.setNstockm(existencia.getNstockm());                
                m.setNmenudeo(existencia.getIdproducto().getNmenudeo());
                m.setIdmovimiento(null);
                cruddao.registrar(m);
            }

            //Se elimina el log del registro
//            if (regsalida.getNidlog() != null) {
//                Logusuario logusuario = logusuariodao.buscar(regsalida.getNidlog());
//                List<Detallelog> listadetalle = detallelogdao.lista(regsalida.getNidlog());
//
//                for (Detallelog d : listadetalle) {
//                    detallelogdao.eliminar(d);
//                }
//
//                logusuariodao.eliminar(logusuario);
//            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getCause().getMessage());
        }
        return regsalida.getIdregsalida();
    }

    public RegistroSalida lotes(RegistroSalida regsalida) {
        try {
            List<Movimiento> listaMovimientos = regsalida.getMovimientoCollection();
            List<Movimiento> listaLotesAgregados = new ArrayList<>();
            List<Movimiento> listaBorrarMovimientos = new ArrayList<>();

            for (Movimiento m : listaMovimientos) {
                //Descarga de lote
                // si es nulo descargo lote
//                if (m.getClote() != null) {
//                    // si esta vacio descargo lote
//                    if (!m.getClote().isEmpty()) {
//                        // cuando el lote es ingresado manualmente
//                        Lote lote = lotedao.buscarPorIdalmacenPorIdproductoPorCloteParaVenta(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto(), m.getClote().trim());
//                        if (lote.getIdlote() == null) {
//                            throw new ExceptionZarcillo("El Lote " + m.getClote() + "\ndel Producto:" + m.getIdproducto() + "\n ¡No existe!");
//                        } else {
//                            lote.setNstock(lote.getNstock() - m.getNcantidad());
//                            lote.setNstockm(lote.getNstockm() - m.getNcantidadm());
//                            cruddao.actualizar(lote);
//                        }
//                    } else {
//                        List<Movimiento> listaMovimientosLotes = super.descargar(m);
//                        listaBorrarMovimientos.add(m);
//                        listaLotesAgregados.addAll(listaMovimientosLotes);
//                    }
//
//                } else {
                List<Movimiento> listaMovimientosLotes = super.descargar(m);                
                listaBorrarMovimientos.add(m);
                listaLotesAgregados.addAll(listaMovimientosLotes);
//                }

            }

            listaMovimientos.removeAll(listaBorrarMovimientos);
            listaMovimientos.addAll(listaLotesAgregados);
            regsalida.setMovimientoCollection(listaMovimientos);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
        return regsalida;
    }

    public RegistroSalida llaves(RegistroSalida regsalida) {
        List<Movimiento> listaMovimientos = regsalida.getMovimientoCollection();
        int id = 0;
        for (Movimiento m : listaMovimientos) {
            m.setIdmovimiento(id);
            id = id + 1;
        }
        regsalida.setMovimientoCollection(listaMovimientos);
        return regsalida;

    }
}
