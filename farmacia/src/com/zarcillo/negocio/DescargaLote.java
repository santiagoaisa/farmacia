package com.zarcillo.negocio;

import com.zarcillo.dao.CrudDAO;
import com.zarcillo.dao.LoteDAO;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.service.ExceptionZarcillo;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

@Scope(value = "singleton", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DescargaLote {

    @Autowired
    private CrudDAO cruddao;
    @Autowired
    private LoteDAO lotedao;

    public List<Movimiento> descargar(Movimiento m) {
        List<Movimiento> listaMovimientos = new ArrayList<>();
        try {
             System.out.println("CANTIADD DE M:"+m.getNcantidad());
            if (m.getNcantidad() > 0) {
                //Lista de los lotes disponibles de la existencia enteros
                List<Lote> listaLote = lotedao.listaPorIdalmacenPorIdproductoParaVentaEntero(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());
                System.out.println("LOTES:"+listaLote.size());
                Movimiento movimiento;
                for (Lote l : listaLote) {
                    //Si la cantidad del lote es mayor o igual a la cantidad que se pide
                    if (l.getNstock() >= m.getNcantidad()) {
                        System.out.println("entro en loste");
                        movimiento = new Movimiento();
                        /// le asigno un id temporal                        
                        movimiento.setIdmovimiento(l.getIdlote().hashCode());
                        movimiento.setIdalmacen(m.getIdalmacen());
                        movimiento.setIdproducto(m.getIdproducto());
                        movimiento.setNcosuni(m.getNcosuni());
                        movimiento.setNvaluni(m.getNvaluni());
                        movimiento.setNdesfin(m.getNdesfin());
                        movimiento.setNdesbon(m.getNdesbon());
                        movimiento.setNdeslab(m.getNdeslab());

                        movimiento.setNcantidad(m.getNcantidad());
                        movimiento.setCfecven(l.getCfecven());
                        movimiento.setClote(l.getClote());
                        movimiento.setBinafecto(m.getBinafecto());
                        //Se crea un nuevo movimiento y se recalcula su subtotal
                        movimiento.calculaSubtotal();
                        // se pone a cero para q no se vuelva a descargar lotes
                        m.setNcantidad(0);
                        //Se añade a la lista que se devolvera
                        listaMovimientos.add(movimiento);
                        //Actualizo el Lote
                        l.setNstock(l.getNstock() - movimiento.getNcantidad());
                       
                        cruddao.actualizar(l);
                        break;
                    } else {
                        //Si la cantidad es menor se descuenta la cantidad solicitada
                        //menos la cantidad que se tienen en el lote
                        m.setNcantidad(m.getNcantidad() - l.getNstock());
                        movimiento = new Movimiento();
                        /// le asigno un id temporal
                        movimiento.setIdmovimiento(l.getIdlote().hashCode());                        
                        movimiento.setIdalmacen(m.getIdalmacen());
                        movimiento.setIdproducto(m.getIdproducto());
                        movimiento.setNcosuni(m.getNcosuni());
                        movimiento.setNvaluni(m.getNvaluni());
                        movimiento.setNdesfin(m.getNdesfin());
                        movimiento.setNdesbon(m.getNdesbon());
                        movimiento.setNdeslab(m.getNdeslab());

                        movimiento.setNcantidad(l.getNstock());
                        movimiento.setCfecven(l.getCfecven());
                        movimiento.setClote(l.getClote());
                        movimiento.setBinafecto(m.getBinafecto());
                        //Se crea un nuevo movimiento y se recalcula su subtotal
                        movimiento.calculaSubtotal();
                        //Se añade a la lista que se devolvera
                        listaMovimientos.add(movimiento);
                        //Actualizo el Lote
                        l.setNstock(l.getNstock() - movimiento.getNcantidad());
                        cruddao.actualizar(l);
                    }
                }

                //En el caso de que la cantidad solicitada no sea copada por los lotes
                //la cantidad sobrante no descarga lotes
                if (m.getNcantidad() > 0) {
                    movimiento = new Movimiento();
                    //AREGLAR                         
                    /// le asigno un id temporal
                    movimiento.setIdmovimiento(m.getIdproducto().hashCode());
                    movimiento.setIdalmacen(m.getIdalmacen());
                    movimiento.setIdproducto(m.getIdproducto());
                    movimiento.setNcosuni(m.getNcosuni());
                    movimiento.setNvaluni(m.getNvaluni());
                    movimiento.setNdesfin(m.getNdesfin());
                    movimiento.setNdesbon(m.getNdesbon());
                    movimiento.setNdeslab(m.getNdeslab());

                    movimiento.setNcantidad(m.getNcantidad());
                    movimiento.setBinafecto(m.getBinafecto());
                    movimiento.setClote("--");
                    movimiento.setCfecven("--");
                    //Se crea un nuevo movimiento y se recalcula su subtotal
                    movimiento.calculaSubtotal();
                    //Se añade a la lista que se devolvera
                    listaMovimientos.add(movimiento);
                }


            } else {
                //Lista de los lotes disponibles de la existencia fraccion
                List<Lote> listaLote = lotedao.listaPorIdalmacenPorIdproductoParaVentaFraccion(m.getIdalmacen().getIdalmacen(), m.getIdproducto().getIdproducto());

                Movimiento movimiento;
                for (Lote l : listaLote) {
                    //Si la cantidad del lote es mayor o igual a la cantidad que se pide
                    if (l.getNstockm() >= m.getNcantidadm()) {
                        movimiento = new Movimiento();
                        /// le asigno un id temporal
                        //AREGLAR
                        movimiento.setIdmovimiento(l.getIdlote().hashCode());
                        movimiento.setIdalmacen(m.getIdalmacen());
                        movimiento.setIdproducto(m.getIdproducto());
                        movimiento.setNcosuni(m.getNcosuni());
                        movimiento.setNvaluni(m.getNvaluni());
                        movimiento.setNdesfin(m.getNdesfin());
                        movimiento.setNdesbon(m.getNdesbon());
                        movimiento.setNdeslab(m.getNdeslab());
                        movimiento.setNcantidadm(m.getNcantidadm());
                        movimiento.setCfecven(l.getCfecven());
                        movimiento.setClote(l.getClote());
                        movimiento.setBinafecto(m.getBinafecto());
                        //Se crea un nuevo movimiento y se recalcula su subtotal
                        movimiento.calculaSubtotal();
                        // se pone a cero para q no se vuelva a descargar lotes
                        m.setNcantidadm(0);
                        //Se añade a la lista que se devolvera
                        listaMovimientos.add(movimiento);
                        //Actualizo el Lote
                        l.setNstockm(l.getNstockm() - movimiento.getNcantidadm());
                        cruddao.actualizar(l);
                        break;
                    } else {
                        //Si la cantidad es menor se descuenta la cantidad solicitada
                        //menos la cantidad que se tienen en el lote
                        m.setNcantidadm(m.getNcantidadm() - l.getNstockm());
                        movimiento = new Movimiento();
                        /// le asigno un id temporal
                        movimiento.setIdmovimiento(l.getIdlote().hashCode());                        
                        movimiento.setIdalmacen(m.getIdalmacen());
                        movimiento.setIdproducto(m.getIdproducto());
                        movimiento.setNcosuni(m.getNcosuni());
                        movimiento.setNvaluni(m.getNvaluni());
                        movimiento.setNdesfin(m.getNdesfin());
                        movimiento.setNdesbon(m.getNdesbon());
                        movimiento.setNdeslab(m.getNdeslab());

                        movimiento.setNcantidadm(l.getNstockm());
                        movimiento.setCfecven(l.getCfecven());
                        movimiento.setClote(l.getClote());
                        movimiento.setBinafecto(m.getBinafecto());
                        //Se crea un nuevo movimiento y se recalcula su subtotal
                        movimiento.calculaSubtotal();
                        //Se añade a la lista que se devolvera
                        listaMovimientos.add(movimiento);
                        //Actualizo el Lote
                        l.setNstockm(l.getNstockm() - movimiento.getNcantidadm());
                        cruddao.actualizar(l);
                    }
                }

                //En el caso de que la cantidad solicitada no sea copada por los lotes
                //la cantidad sobrante no descarga lotes
                if (m.getNcantidadm() > 0) {
                    movimiento = new Movimiento();
                    /// le asigno un id temporal
                    movimiento.setIdmovimiento(m.getIdproducto().hashCode());
                    movimiento.setIdalmacen(m.getIdalmacen());
                    movimiento.setIdproducto(m.getIdproducto());
                    movimiento.setNcosuni(m.getNcosuni());
                    movimiento.setNvaluni(m.getNvaluni());
                    movimiento.setNdesfin(m.getNdesfin());
                    movimiento.setNdesbon(m.getNdesbon());
                    movimiento.setNdeslab(m.getNdeslab());

                    movimiento.setNcantidadm(m.getNcantidadm());
                    movimiento.setBinafecto(m.getBinafecto());
                    movimiento.setClote("--");
                    movimiento.setCfecven("--");
                    //Se crea un nuevo movimiento y se recalcula su subtotal
                    movimiento.calculaSubtotal();
                    //Se añade a la lista que se devolvera
                    listaMovimientos.add(movimiento);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }

        return listaMovimientos;
    }
}
