package modmantenimiento;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Existencia;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.ExistenciaService;
import com.zarcillo.service.LoteService;
import com.zarcillo.service.ProductoService;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Checkbox;
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
    private Checkbox bLote;
    
    @Wire
    private Intbox nStkart;
    
    @Wire
    private Intbox nPeso;
    
    @Wire
    private Intbox nStklot;
    
    @Wire
    private Toolbarbutton btnNuevo;
    
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
                winbuscaprod.setAttribute("IDALMACEN", almacen.getIdalmacen());
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
        bLote.setChecked(existencia.getIdproducto().getBinafecto());
        List<Lote> listaLote = loteService.listaPorIdalmacenPorIdproducto(existencia.getExistenciaPK().getIdalmacen(), existencia.getExistenciaPK().getIdproducto());
        modeloLote = new ListModelList(listaLote);
        lstLote.setModel(modeloLote);
        ActualizaStock();
    }

    public void ActualizaStock() {
        lstLote.onInitRender();
        Integer stocklote = 0;
        List<Lote> listaLote = new ArrayList<Lote>(modeloLote);
        for (Lote l : listaLote) {
            stocklote = stocklote + l.getNstock();
        }
        nStklot.setValue(stocklote);
    }
    private void validar(){
        cboAlmacen.getValue();
    }
    private void habilitar(boolean enable){
        txtCodigo.setReadonly(enable);
        cboAlmacen.setDisabled(enable);
        btnNuevo.setVisible(enable);
    }
}
