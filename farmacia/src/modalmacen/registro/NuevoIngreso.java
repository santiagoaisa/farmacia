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
import modalmacen.util.ConstraintMenudeoFraccion;
import modalmacen.util.ConstraintMenudeoIngreso;
import modmantenimiento.util.ConstraintAñoLote;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.ConstraintCantidadValida;
import modmantenimiento.util.ConstraintMesLote;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.KeyEvent;
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
    private Decimalbox nAfecto;
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
        if(modeloIngreso.getSize()>0){
            focoCantidad();
        }
        
    }

    @Listen("onClick = #btnGrabar")
    public void onGrabar(Event event) {
        grabar();
    }
    
    @Listen("onClick = #btnProducto")
    public void onNuevoProducto(Event event) {
        nuevoProducto();
    }
    

    @Listen("onClick = #btnQuitar")
    public void onQuitarDetalle(Event event) {
        Toolbarbutton btn = (Toolbarbutton) event.getTarget();
        Listitem item = (Listitem) (btn.getParent().getParent());
        borrarProducto(item.getIndex());
    }

    @Listen("onSelect = #lstIngreso")
    public void onSeleccionarLista(Event event) {
        llenarpie(lstIngreso.getSelectedIndex());
    }
    
    @Listen("onOK = #i0")
    public void onFocoCantidad(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda5 = (Listcell) item.getChildren().get(5);
        Intbox cantidad = (Intbox) celda5.getFirstChild();
        cantidad.focus();
        cantidad.select();
    }
    
    @Listen("onOK = #i1 , #i2  ")
    public void onFocoSubtotal1(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda10 = (Listcell) item.getChildren().get(10);
        Decimalbox subtot =  (Decimalbox) celda10.getFirstChild();
        subtot.focus();
        subtot.select();
    }
    
    @Listen("onOK =  #d1 , #d2 , #d3  ")
    public void onFocoSubtotal2(Event event) {
        Decimalbox sub = (Decimalbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda10 = (Listcell) item.getChildren().get(10);
        Decimalbox subtot =  (Decimalbox) celda10.getFirstChild();
        subtot.focus();
        subtot.select();
    }

    @Listen("onOK = #d4")
    public void onFocoAño(Event event) {
        Decimalbox sub = (Decimalbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda11 = (Listcell) item.getChildren().get(11);
        Intbox año = (Intbox) celda11.getFirstChild();
        año.focus();
    }
    @Listen("onOK = #i3")
    public void onFocoMes(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda11 = (Listcell) item.getChildren().get(11);
        Intbox mes = (Intbox) celda11.getLastChild();
        mes.focus();     
        mes.select();
    }
    @Listen("onOK = #i4")
    public void onFocoLote(Event event) {
        Intbox sub = (Intbox) event.getTarget();
        Listitem item = (Listitem) (sub.getParent().getParent());
        Listcell celda12 = (Listcell) item.getChildren().get(12);
        Textbox lote = (Textbox) celda12.getFirstChild();
        lote.focus();
    }

    @Listen("onOK = #txtSerie")
    public void onFocoNumero(Event event) {
        txtNumero.focus();
    }

    @Listen("onOK = #txtNumero , #txtLote")
    public void onFocoCodigo(Event event) {
        txtCodigo.focus();
    }
    
      
    @Listen("onCtrlKey = #d4")
    public void onRecalcula(Event event) {
        if (((KeyEvent)event).getKeyCode() == 119){
            Decimalbox sub = (Decimalbox) event.getTarget();
            Listitem item = (Listitem) (sub.getParent().getParent());
            actualizarNeto(item.getIndex());
        }        
    }

    @Listen("  onBlur = intbox#i1,intbox#i1 , decimalbox#d1 , decimalbox#d2, decimalbox#d3 , decimalbox#d4 ")
    public void calcular() {
        quitarConstraintDetalle();
        calculaImporte();
    }

    public void initComponets() {
        rentrada = (RegistroEntrada) winIngreso.getAttribute("RENTRADA");
        modeloMotivo = new ListModelList(motivoEntradaService.listaGeneral());
        cboMotivo.setModel(modeloMotivo);
        modeloDocumento = new ListModelList(documentoService.listaDocumentoCompra());
        cboDocumento.setModel(modeloDocumento);
        if (modeloMotivo.size() > 0) {
            cboMotivo.onInitRender(new Event("", cboMotivo));
            cboMotivo.close();
            cboMotivo.setSelectedIndex(0);
        }
        if (modeloDocumento.size() > 0) {
            cboDocumento.onInitRender(new Event("", cboDocumento));
            cboDocumento.close();
            cboDocumento.setSelectedIndex(0);
        }
        modeloIngreso = new ListModelList();
        lstIngreso.setModel(modeloIngreso);
        dFecha.setValue(new Date());
        periodo = periodoService.buscarPorDfecha(new Date());
        txtIgv.setText(periodo.getNigv() + " %");
        txtSerie.focus();
    }
    
    private void nuevoProducto(){
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/almacen/registro/nuevoproductoingreso.zul", null, null);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Producto producto =  (Producto) winbuscaprod.getAttribute("PRODUCTO");
                    DetalleIngreso dingreso = new DetalleIngreso();
                    dingreso.setIdproducto(producto);
                    modeloIngreso.add(dingreso);
                    lstIngreso.onInitRender();
                    txtCodigo.setValue("");
                    btnGrabar.setVisible(true);
                    focoCantidad();
                }
                else{
                    txtCodigo.focus();
                }
    
    }

    public void buscarProducto() {
        Producto producto = new Producto();
        if (txtCodigo.getValue().isEmpty()) {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaproducto.zul", null, null);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstProducto");
                    ListModel modelobuscado = lstproducto1.getModel();
                    producto = (Producto) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
                    DetalleIngreso dingreso = new DetalleIngreso();
                    dingreso.setIdproducto(producto);
                    modeloIngreso.add(dingreso);
                    lstIngreso.onInitRender();
                    txtCodigo.setValue("");
                    btnGrabar.setVisible(true);
                    
                }
        } else {
            producto = productoService.buscar(txtCodigo.getValue());
            DetalleIngreso dingreso = new DetalleIngreso();
            dingreso.setIdproducto(producto);
            modeloIngreso.add(dingreso);
            txtCodigo.setValue("");
            btnGrabar.setVisible(true);
            lstIngreso.onInitRender();
            
        }
    }
    private void focoCantidad(){
        Listitem fila = lstIngreso.getItemAtIndex(modeloIngreso.getSize() - 1);
            Listcell celda5 = (Listcell) fila.getChildren().get(5);
            Intbox cantidad = (Intbox) celda5.getFirstChild();
            cantidad.focus();
            cantidad.select();
    }

    private void validar() {
        cboDocumento.getValue();
        cboMotivo.getValue();
        txtSerie.getValue();
        txtNumero.getValue();
    }

    public void grabar() {
        CuentaPagar cuentaspagar = new CuentaPagar();
        MotivoEntrada motivo = (MotivoEntrada) modeloMotivo.getElementAt(cboMotivo.getSelectedIndex());
        Documento documento = (Documento) modeloDocumento.getElementAt(cboDocumento.getSelectedIndex());
        validar();
        validaDetalle();
        rentrada.setDfecha(dFecha.getValue());
        rentrada.setIdmotivo(motivo);
        rentrada.setIddocumento(documento);
        rentrada.setCserie(txtSerie.getText());
        rentrada.setCnumero(txtNumero.getText());
        rentrada.setNafecto(nAfecto.getValue());
        rentrada.setNinafecto(nInafecto.getValue());
        rentrada.setNigv(nIgv.getValue());
        rentrada.setNimporte(nPreven.getValue());
        rentrada.setCobservacion(txtObservacion.getText().trim());
        rentrada.setMovimientoCollection(llenarDetalle());
        Window wingraba = (Window) Executions.createComponents("/modulos/almacen/registro/registrodocumento.zul", null, null);
        wingraba.setClosable(false);
        wingraba.setAttribute("RENTRADA", rentrada);
        wingraba.setAttribute("REST", true);
        wingraba.doModal();
        Boolean rest = (Boolean) wingraba.getAttribute("REST");
        if (rest) {
            cuentaspagar = (CuentaPagar) wingraba.getAttribute("CUENTASPAGAR");
            cuentaspagar.setIdusuario(rentrada.getIdusuario());
            rentrada = registroEntradaService.registrarIngreso(rentrada, cuentaspagar);
            Messagebox.show("Se ha registrado exitosamente la " + cuentaspagar.getIddocumento() + " " + cuentaspagar.getCserie() + "-" + cuentaspagar.getCnumero() + "OPERACION: " + rentrada.getIdregentrada(), "Información del Sistema", Messagebox.OK, Messagebox.INFORMATION);
            winIngreso.onClose();
        }
    }

    private void borrarProducto(int index) {
        int resp2 = 0;
        resp2 = Messagebox.show("¿Desea eliminar registro?", "Ingreso", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            DetalleIngreso detalle = (DetalleIngreso) modeloIngreso.getElementAt(index);
            modeloIngreso.remove(detalle);
        }
    }

    public void calculaImporte() {
        rentrada.setDfecha(dFecha.getValue());
        rentrada.setMovimientoCollection(llenarDetalle());
        rentrada.calcula(periodo.getNigv());
        nAfecto.setValue(rentrada.getNafecto());
        nInafecto.setValue(rentrada.getNinafecto());
        nIgv.setValue(rentrada.getNigv());
        nPreven.setValue(rentrada.getNimporte());
    }

    private List<Movimiento> llenarDetalle() {
        List<Movimiento> coldetalle = new ArrayList<Movimiento>();
        Movimiento movimiento;
        List<Listitem> ldatos = lstIngreso.getItems();
        DetalleIngreso detalleingreso;
        Producto producto;
        for (Listitem item : ldatos) {
            detalleingreso = (DetalleIngreso) modeloIngreso.getElementAt(item.getIndex());
            producto = detalleingreso.getIdproducto();
            producto.setNmenudeo(detalleingreso.getIdproducto().getNmenudeo());
            movimiento = new Movimiento();
            movimiento.setBinafecto(producto.getBinafecto());
            movimiento.setIdproducto(producto);
            movimiento.setIdalmacen(rentrada.getIdalmacen());
            movimiento.setNcantidad(detalleingreso.getNcantidad());
            movimiento.setNcantidadm(detalleingreso.getNcantidadm());
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

    private void quitarConstraintDetalle() {
        List<Listitem> ldatos = lstIngreso.getItems();
        for (Listitem item : ldatos) {
            Listcell celda5 = (Listcell) item.getChildren().get(5);
            Intbox cantidad = (Intbox) celda5.getFirstChild();
            cantidad.setConstraint("");
            Listcell celda6 = (Listcell) item.getChildren().get(6);
            Intbox cantidadm = (Intbox) celda6.getFirstChild();
            cantidadm.setConstraint("");

        }
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
                Listcell celda2 = (Listcell) item.getChildren().get(2);
                Intbox fraccion = (Intbox) celda2.getFirstChild();
                fraccion.setConstraint(new ConstraintCantidadValida());
                Listcell celda5 = (Listcell) item.getChildren().get(5);
                Intbox cantidad = (Intbox) celda5.getFirstChild();
                Listcell celda6 = (Listcell) item.getChildren().get(6);
                Intbox cantidadm = (Intbox) celda6.getFirstChild();
                cantidad.setConstraint(new ConstraintMenudeoIngreso(cantidad.getValue(), cantidadm.getValue()));
                cantidad.getValue();
                cantidadm.setConstraint(new ConstraintMenudeoFraccion(fraccion.getValue(), cantidadm.getValue()));
                Listcell celda12 = (Listcell) item.getChildren().get(12);
                Textbox lote = (Textbox) celda12.getFirstChild();
                lote.setConstraint("");
                lote.getValue();
                Listcell celda11 = (Listcell) item.getChildren().get(11);
                Intbox año = (Intbox) celda11.getFirstChild();
                año.setConstraint(new ConstraintAñoLote(4));
                año.getValue();
                Intbox mes = (Intbox) celda11.getLastChild();
                mes.setConstraint(new ConstraintMesLote());
                mes.getValue();
                lote.setConstraint(new ConstraintCamposObligatorios());
                lote.getValue();
            }
        }
    }

    private void actualizarNeto(int index) {
        int resp2 = 0;
        resp2 = Messagebox.show("¿Valor Inc. IGV?", "Ingreso", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp2 == Messagebox.YES) {
            if (lstIngreso.getItemCount() < 1) {
                throw new ExceptionZarcillo("La Lista no tiene elementos Seleccionados");
            } else {
                DetalleIngreso deting = (DetalleIngreso) modeloIngreso.getElementAt(index);
                deting.setBneto(true);
                deting.calculaNeto();
                lstIngreso.setModel(modeloIngreso);
                lstIngreso.onInitRender();
                calculaImporte();
            }
        }
    }
}