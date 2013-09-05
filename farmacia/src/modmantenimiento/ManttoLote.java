package modmantenimiento;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.LoteService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.naming.NamingException;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zarcillo.ExportarPdf;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
 
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;


@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoLote  extends SelectorComposer  {
    
    private Producto producto;
    private Existencia existencia;
    private Usuario usuario; 
    private ListModelList modeloLote;
    private ListModelList modeloAlmacen;
    
    @Wire
    private Window winLote;
    
    @Wire
    private Combobox cboAlmacen;
    
    @Wire
    private Listbox lstLote;
    
    @Wire
    private Textbox txtCodigo;
    
    @Wire
    private Textbox txtUnimed;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtLinea;
    
    @Wire
    private Textbox txtSublinea;
        
    @Wire
    private Intbox nStkart;
    
    @Wire
    private Intbox nStkartm;
        
    @Wire
    private Intbox nStklot;
    
    @Wire
    private Intbox nStklotm;
    @Wire
    private Toolbarbutton btnNuevo;
    @Wire
    private Toolbarbutton btnImprimir;
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    LoteService loteService;
    
    @WireVariable
    AlmacenService almacenService;    
    
    @WireVariable
    ProductoService productoService;  
    
    @WireVariable
    ExistenciaService existenciaService; 
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    @Listen("onCreate=window#winLote")
    public void onCreate() throws NamingException {        
        initComponets();
     }
    
    @Listen("onCancel = #winLote")
    public void onSiguiente(Event event) {
       Siguiente();
    }  
    
    @Listen("onOK = #txtCodigo")
    public void onBuscarExistencia(Event event) {
        buscarExistencia();
    }
    
    @Listen("onDoubleClick = #lstLote")
    public void onModificarLista(Event event) {
        modificar();
    }
    
    @Listen("onOK = #lstLote")
    public void onModificar(Event event) {
        modificar();
    } 
    
    @Listen("onClick = #btnNuevo")
    public void onAgregarNuevo(Event event) {
        nuevo();
    }  
    
    @Listen("onClick = #btnImprimir")
    public void onAgregarImprimir(Event event) {
        imprimir();
    }  
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);  
        modeloLote=new ListModelList();        
        lstLote.setModel(modeloLote);
        modeloAlmacen=new ListModelList(almacenService.listaGeneral());
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        txtCodigo.focus();
    }  
    public void buscarExistencia() {
        validar();
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        if (txtCodigo.getText().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/buscaexistenciaalmacen.zul", null, null);
                winbuscaprod.setAttribute("ALMACEN", almacen);
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstexistencia = (Listbox) winbuscaprod.getFellow("lstExistencia");
                    ListModel modelobuscado = lstexistencia.getModel();
                    existencia = (Existencia) modelobuscado.getElementAt(lstexistencia.getSelectedIndex());
                    llenarExistencia();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            existencia = existenciaService.buscarPorIdalmacenPorIdproducto(almacen.getIdalmacen(),txtCodigo.getText());
            llenarExistencia();
        }
    }

    public void llenarExistencia() {
        habilitar(true);
        txtCodigo.setText(existencia.getIdproducto().getIdproducto());
        txtNombre.setText(existencia.getIdproducto().getCnomproducto());
        txtUnimed.setText(existencia.getIdproducto().getIdpresentacion().getCabrev());
        txtLinea.setText(existencia.getIdproducto().getIdsublinea().getIdlinea().getCnomlinea());
        txtSublinea.setText(existencia.getIdproducto().getIdsublinea().getCnomsublinea());
        nStkart.setValue(existencia.getNstock());
        nStkartm.setValue(existencia.getNstockm());
        List<Lote> listaLote = loteService.listaPorIdalmacenPorIdproducto(existencia.getExistenciaPK().getIdalmacen(), existencia.getExistenciaPK().getIdproducto());
        modeloLote = new ListModelList(listaLote);
        lstLote.setModel(modeloLote);
        ActualizaStock();
    }

    public void ActualizaStock() {
        lstLote.onInitRender();
        Integer stocklote = 0;
        Integer stocklotem = 0;
        List<Lote> listaLote = new ArrayList<Lote>(modeloLote);
        for (Lote l : listaLote) {
            stocklote = stocklote + l.getNstock();
            stocklotem=stocklotem+l.getNstockm();
        }
        nStklot.setValue(stocklote);
        nStklotm.setValue(stocklotem);
    }
    private void validar(){
        cboAlmacen.getValue();
    }
    private void habilitar(boolean enable){
        txtCodigo.setReadonly(enable);
        cboAlmacen.setDisabled(enable);
        btnNuevo.setVisible(enable);
    }
    public void salir(){
        winLote.onClose();
    }
    
    public void nuevo(){
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/crealote.zul", null, null);
        wincrea.setAttribute("REST", true);
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            Lote clote;            
            clote = (Lote) wincrea.getAttribute("LOTE");            
            clote.setIdalmacen(almacen);
            clote.setIdproducto(producto);
            clote = loteService.registrar(clote);
            modeloLote.add(clote);
        }
        ActualizaStock();
    }

    public void Siguiente() {
        limpiar();
        habilitar(false);
        txtCodigo.focus();
    }

    private void limpiar() {
        txtCodigo.setText("");
        txtNombre.setText("");
        txtUnimed.setText("");
        txtLinea.setText("");
        txtSublinea.setText("");
        nStkart.setValue(0);
        nStkartm.setValue(0);
        modeloLote=new ListModelList();
        lstLote.setModel(modeloLote);
        nStklot.setValue(0);
        nStklotm.setValue(0);
        
    }
    
    public void validarDetalle() {
        if (modeloLote.size() <= 0) {
            throw new ExceptionZarcillo("El producto no tiene Lotes");
        }
    }
    public void modificar() {
        Window wincrea = (Window) Executions.createComponents("/modulos/mantenimiento/util/crealote.zul", null, null);
        wincrea.setAttribute("REST", true);
        wincrea.setAttribute("LOTE", (Lote) modeloLote.getElementAt(lstLote.getSelectedIndex()));
        wincrea.doModal();
        Boolean rest = (Boolean) wincrea.getAttribute("REST");
        if (rest) {
            int indice = lstLote.getSelectedIndex();
            Lote clote;
            clote = (Lote) wincrea.getAttribute("LOTE");
            clote = loteService.actualizar(clote);
            modeloLote.remove(indice);
            modeloLote.add(indice, clote);
        }
        ActualizaStock();
    }

    public void imprimir() {
        validar();
        validarDetalle();
        Almacen almacen = (Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        HashMap parametro = new HashMap();
        parametro.put("UNIDADNEGOCIO", almacen.getIdunidad().getCnomunidad());
        parametro.put("ALMACEN", almacen.getCnomalmacen());
        parametro.put("RUTA", almacen.getIdunidad().getIdempresa().getCruta());
        parametro.put("LINEA", existencia.getIdproducto().getIdsublinea().getIdlinea().getCnomlinea());
        parametro.put("SUBLINEA", existencia.getIdproducto().getIdsublinea().getCnomsublinea());
        parametro.put("CODPRODUCTO", existencia.getIdproducto().getIdproducto());
        parametro.put("UNIMEDIDA", existencia.getIdproducto().getIdpresentacion().getCabrev());
        parametro.put("NOMPRODUCTO", existencia.getIdproducto().getCnomproducto());
        parametro.put("USUARIO", usuario.toString());
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modeloLote);
        ExportarPdf.exportJasperToPdf("Lote", data, parametro,"/resources/almacen/mantenimientolote.jasper");        
    }
}
