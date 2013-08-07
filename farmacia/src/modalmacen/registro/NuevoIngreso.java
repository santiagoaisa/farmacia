package modalmacen.registro;

import com.zarcillo.domain.CuentaPagar;
import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.dto.almacen.DetalleIngreso;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.RegistroEntradaService;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintAñoLote;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.ConstraintCantidadValida;
import modmantenimiento.util.ConstraintMesLote;
import org.zkoss.bind.annotation.BindingParam;
import org.zkoss.bind.annotation.Command;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class NuevoIngreso extends SelectorComposer {

    private RegistroEntrada rentrada;
    private Periodo periodo;
    private ListModelList modeloMotivo;
    private ListModelList modeloDocumento;
    private ListModelList modeloIngreso;
    @Wire
    private Window winIngreso;
    @Wire
    private Combobox cboMotivo;
    @Wire
    private Combobox cboDocumento;
    @Wire
    private Textbox txtSerie;
    @Wire
    private Textbox txtNumero;
    @Wire
    private Textbox txtCodigo;
    @Wire
    private Listbox lstIngreso;
    @Wire
    private Datebox dFecha;
    @Wire
    private Decimalbox nValven;
    @Wire
    private Decimalbox nUltcos;
    @Wire
    private Decimalbox nCosuni;
    @Wire
    private Decimalbox nUtilidad;
    @Wire
    private Decimalbox nValneta;
    @Wire
    private Decimalbox nInafecto;
    @Wire
    private Decimalbox nIgv;
    @Wire
    private Decimalbox nPreven;
    @Wire
    private Textbox txtIgv;
    @Wire
    private Textbox txtObservacion;
    @Wire
    private Toolbarbutton btnGrabar;
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    @WireVariable
    DocumentoService documentoService;
    @WireVariable
    ProductoService productoService;
    @WireVariable
    ExistenciaService existenciaService;
    @WireVariable
    PeriodoService periodoService;
    @WireVariable
    RegistroEntradaService registroEntradaService;

    @Listen("onCreate=window#winIngreso")
    public void onCreate() throws NamingException {
        initComponets();
    }

    @Listen("onOK = #txtCodigo")
    public void onFocoNombre(Event event) {
        buscarProducto();
    }

    @Listen("onClick = #btnGrabar")
    public void onGrabar(Event event) {
        grabar();
    }

    @Listen("onSelect = #lstIngreso")
    public void onSeleccionarLista(Event event) {
        llenarpie(lstIngreso.getSelectedIndex());
    }

    
    @Listen("  onBlur = intbox#i1 , decimalbox#d1 , decimalbox#d2, decimalbox#d3 , decimalbox#d4 ")
    public void calcular() {
        calculaImporte();
    }

    public void initComponets() {
        rentrada = (RegistroEntrada) winIngreso.getAttribute("RENTRADA");
        modeloMotivo = new ListModelList(motivoEntradaService.listaGeneral());
        cboMotivo.setModel(modeloMotivo);
        modeloDocumento = new ListModelList(documentoService.listaDocumentoCompra());
        cboDocumento.setModel(modeloDocumento);
        modeloIngreso = new ListModelList();
        lstIngreso.setModel(modeloIngreso);
        dFecha.setValue(new Date());
        periodo = periodoService.buscarPorDfecha(new Date());
        txtIgv.setText(periodo.getNigv() + " %");
    }

    public void buscarProducto() {
        Producto producto = new Producto();
        if (txtCodigo.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproducto.zul", null, null);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstProducto");
                    ListModel modelobuscado = lstproducto1.getModel();
                    producto = (Producto) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());

                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            producto = productoService.buscar(txtCodigo.getValue());
        }
        DetalleIngreso dingreso = new DetalleIngreso();
        dingreso.setIdproducto(producto);
        modeloIngreso.add(dingreso);
        txtCodigo.setValue("");
        txtCodigo.focus();
        btnGrabar.setVisible(true);
    }
    private void validar() {       
        cboDocumento.getValue();
        cboMotivo.getValue();
        txtSerie.getValue();
        txtNumero.getValue();
    }

    public void grabar() {
        CuentaPagar cuentaspagar=new CuentaPagar();
        MotivoEntrada motivo=(MotivoEntrada) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        Documento documento=(Documento) modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
        validar();
        validaDetalle();
        rentrada.setDfecha(dFecha.getValue());
        rentrada.setIdmotivo(motivo);
        rentrada.setIddocumento(documento);
        rentrada.setCserie(txtSerie.getText());
        rentrada.setCnumero(txtNumero.getText());
        rentrada.setNafecto(nValneta.getValue());
        rentrada.setNinafecto(nInafecto.getValue());
        rentrada.setNigv(nIgv.getValue());
        rentrada.setNimporte(nPreven.getValue());
        rentrada.setCobservacion(txtObservacion.getText().trim());
        rentrada.setMovimientoCollection(llenarDetalle());
        rentrada=registroEntradaService.registrarIngreso(rentrada);
        Window wingraba = (Window) Executions.createComponents("/modulos/almacen/registro/registrodocumento.zul", null, null);
        wingraba.setClosable(false);
        wingraba.setAttribute("RENTRADA", rentrada);
        wingraba.setAttribute("REST", true);
        wingraba.doModal();
       /* Boolean rest = (Boolean) wingraba.getAttribute("REST");
        if (rest) {
            cuentaspagar = (CuentaPagar) wingraba.getAttribute("CUENTASPAGAR");
                cuentaspagar.setIdcuenta(rentrada.getIdregentrada());
                cuentaspagar.setIddocumento(datosentrada.getIddocumento());
                datosentrada.setIdmoneda(cuentaspagar.getIdmoneda());
                cuentaspagar=cuentapagardao.registrar(cuentaspagar);                        
                    Messagebox.show("Se ha registrado exitosamente la " + cuentaspagar.getIddocumento() + " " + cuentaspagar.getCserie() + "-" + cuentaspagar.getCnumero(), "Información del Sistema", Messagebox.OK, Messagebox.INFORMATION);                    
             
        }        
        this.setAttribute("COMPRA", datosentrada);
        this.onClose();*/
    }

    public void calculaImporte() {
        rentrada.setDfecha(dFecha.getValue());
        rentrada.setMovimientoCollection(llenarDetalle());
        rentrada.calcula(periodo.getNigv());
        nValneta.setValue(rentrada.getNafecto());
        nInafecto.setValue(rentrada.getNinafecto());
        nIgv.setValue(rentrada.getNigv());
        nPreven.setValue(rentrada.getNimporte());
    }

    private List<Movimiento> llenarDetalle() {
        // captura datos del formulario en detalle para guardarlos
        List<Movimiento> coldetalle = new ArrayList<Movimiento>();
        Movimiento movimiento;
        List<Listitem> ldatos = lstIngreso.getItems();
        Existencia existenciaproducto;
        DetalleIngreso detalleingreso;
        Producto producto;
        for (Listitem item : ldatos) {
            detalleingreso = (DetalleIngreso) modeloIngreso.getElementAt(item.getIndex());
            producto = detalleingreso.getIdproducto();
            movimiento = new Movimiento();
            existenciaproducto = new Existencia(rentrada.getIdalmacen().getIdalmacen(), producto.getIdproducto());
            existenciaproducto.setIdalmacen(rentrada.getIdalmacen());
            existenciaproducto.setIdproducto(producto);
            movimiento.setBinafecto(producto.getBinafecto());
            movimiento.setExistencia(existenciaproducto);
            movimiento.setNcantidad(detalleingreso.getNcantidad());
            movimiento.setNcosuni(detalleingreso.getNcosuni());
            movimiento.setNsubtot(detalleingreso.getNsubtotal());
            //Fecha de Vencimiento del Producto

            movimiento.setClote(detalleingreso.getClote());
            DecimalFormat formato = new DecimalFormat("00");
            String cmes = formato.format(detalleingreso.getNmes());
            movimiento.setCfecven(detalleingreso.getNaño() + "-" + cmes);

            coldetalle.add(movimiento);
        }
        return coldetalle;
    }

    public void llenarpie(int index) {
        if (index > -1) {
            try {
                DetalleIngreso detalleingreso = (DetalleIngreso) modeloIngreso.getElementAt(index);
                Existencia e = existenciaService.buscarPorIdalmacenPorIdproducto(rentrada.getIdalmacen().getIdalmacen(), detalleingreso.getIdproducto().getIdproducto());
                Descuento des = existenciaService.buscarDescuentoPorIdalmacenPorIdproducto(rentrada.getIdalmacen().getIdalmacen(), detalleingreso.getIdproducto().getIdproducto());

                nValven.setValue(e.getNvalven());
                nUltcos.setValue(e.getNultcos());
                nCosuni.setValue(e.getNcosuni());
                nUtilidad.setValue(e.getUtilidad(des, detalleingreso.getNcosuni()));
            } catch (Exception e) {
                //En caso de que el producto sea nuevo
                nValven.setValue(new BigDecimal("0"));
                nUltcos.setValue(new BigDecimal("0"));
                nCosuni.setValue(new BigDecimal("0"));
                nUtilidad.setValue(new BigDecimal("0"));
            }
        }
    }
    private void validaDetalle() {
        if (lstIngreso.getItemCount() < 1) {
            throw new ExceptionZarcillo("La Lista no tiene elementos");
        } else {
            List<Listitem> ldatos = lstIngreso.getItems();
            for (Listitem item : ldatos) {
                Listcell celda4 = (Listcell) item.getChildren().get(4);
                Intbox cantidad = (Intbox) celda4.getFirstChild();
                cantidad.setConstraint(new ConstraintCantidadValida());
                cantidad.getValue();
                Listcell celda10 = (Listcell) item.getChildren().get(10);
                Textbox lote = (Textbox) celda10.getFirstChild();
                lote.setConstraint("");
                lote.getValue();
                Listcell celda9 = (Listcell) item.getChildren().get(9);
                Intbox año = (Intbox) celda9.getFirstChild();
                año.setConstraint(new ConstraintAñoLote(4));
                año.getValue();
                Intbox mes = (Intbox) celda9.getLastChild();
                mes.setConstraint(new ConstraintMesLote());
                mes.getValue();
                lote.setConstraint(new ConstraintCamposObligatorios());
                lote.getValue();
            }
        }
    }
}