
package modalmacen.registro;

import com.zarcillo.domain.Descuento;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Movimiento;
import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.RegistroEntrada;
import com.zarcillo.dto.almacen.DetalleIngreso;
import com.zarcillo.service.DocumentoService;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.ProductoService;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
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
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
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
    
    @Listen("onCreate=window#winIngreso")
    public void onCreate() throws NamingException {
        initComponets();
     }
    
    @Listen("onOK = #txtCodigo")
    public void onFocoNombre(Event event) {
        buscarProducto();
    }
    
    @Listen("onOK = #btnGrabar")
    public void onGrabar(Event event) {
        grabar();
    }
    
    @Listen("onSelect = #lstIngreso")
    public void onSeleccionarLista(Event event) {
        llenarpie(lstIngreso.getSelectedIndex());
    }
    
    @Command
    public void newOrder(){
        Messagebox.show("Hola");
    }
 
    
        
    @Command
    public void calcular(@BindingParam("entry") DetalleIngreso item){
        
        calculaImporte();
    }
    
    public void initComponets(){
        rentrada=(RegistroEntrada) winIngreso.getAttribute("RENTRADA");
        modeloMotivo=new ListModelList(motivoEntradaService.listaGeneral());
        cboMotivo.setModel(modeloMotivo);
        modeloDocumento=new ListModelList(documentoService.listaDocumentoCompra());
        cboDocumento.setModel(modeloDocumento);
        modeloIngreso=new ListModelList();
        lstIngreso.setModel(modeloIngreso);
        dFecha.setValue(new Date());
        periodo=periodoService.buscarPorDfecha(new Date());
        txtIgv.setText(periodo.getNigv()+" %");
    }
    public void buscarProducto() {
        Producto producto=new Producto();
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
        DetalleIngreso dingreso=new DetalleIngreso();
        dingreso.setIdproducto(producto);
        modeloIngreso.add(dingreso);
        txtCodigo.setValue("");
        txtCodigo.focus();
        btnGrabar.setVisible(true);
    }
    private void grabar(){
        
    }
    
    public void calculaImporte() {
        rentrada.setDfecha(dFecha.getValue());
        rentrada.setMovimientoCollection(llenarDetalle());
        rentrada.calcula(periodo.getNigv());
        nValneta.setValue(rentrada.getNafecto());
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
    
    
    
}