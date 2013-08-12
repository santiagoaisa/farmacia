package modventas.herramientas;

import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.UnidadNegocio;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.RegistroSalidaService;
import com.zarcillo.service.UnidadNegocioService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.util.Date;
import javax.naming.NamingException;
import org.zkoss.zk.ui.Execution;
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
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class GenerarDocumento extends SelectorComposer{
    
    private Usuario usuario;   
    private RegistroSalida regsalida=new RegistroSalida();
    private ListModelList modeloDetalle;
    private Periodo periodo;
    private ListModelList modeloUnidad;
    
    @Wire
    private Window winVenta;
    
    @Wire
    private Combobox cboUnidad;
    
    @Wire
    private Datebox dFecha;
    
    @Wire
    private Intbox nOperacion;
    
    @Wire 
    private Toolbarbutton btnGrabar;
    
    @Wire
    private Listbox lstDetalle;
    
    @Wire
    private Decimalbox nInafecto;
    
    @Wire
    private Decimalbox nIgv;
    
    @Wire
    private Decimalbox nValven;
    
    @Wire
    private Decimalbox nImporte;
    
    @Wire
    private Decimalbox nRedondeo;    
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    VentaService ventaService;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    PeriodoService periodoService;
    
    @WireVariable
    RegistroSalidaService registroSalidaService;
    
    @WireVariable
    UnidadNegocioService unidadService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();   
    
    
    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {        
         initComponets();
     }
    
     @Listen("  onBlur = intbox#nOperacion ")
    public void calcular() {
        buscar(nOperacion.getValue());
    }
    
    @Listen("onClick = #btnGrabar")
    public void onAgregarImprimir(Event event) {
        registrar();
    } 
        
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);  
        modeloUnidad=new ListModelList(almacenService.listaGeneral());
        cboUnidad.setModel(modeloUnidad);
        if (modeloUnidad.size() > 0) {
            cboUnidad.onInitRender(new Event("", cboUnidad));
            cboUnidad.close();
            cboUnidad.setSelectedIndex(0);
        }
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        periodo=periodoService.buscarPorDfecha(new Date());
        dFecha.setValue(new Date());
        nOperacion.focus();
    }    
   
    private void buscar(int operacion){
        UnidadNegocio unidad=(UnidadNegocio) modeloUnidad.getElementAt(cboUnidad.getSelectedIndex());
        regsalida=registroSalidaService.buscarPorIdunidadPorIdregsalida(unidad.getIdunidad(), operacion);
        modeloDetalle=new ListModelList(registroSalidaService.listaDetalleSalida(regsalida.getIdregsalida()));
        lstDetalle.setModel(modeloDetalle);
        cargarPie();
    }
    
    
    private void cargarPie(){        
        nInafecto.setValue(regsalida.getNinafecto());
        nValven.setValue(regsalida.getNafecto());
        nIgv.setValue(regsalida.getNigv());
        nRedondeo.setValue(regsalida.getNredondeo());
        nImporte.setValue(regsalida.getNimporte());
    }
    
    
    public void registrar() {
        regsalida.setIdusuario(usuario);
        regsalida.setDfecimp(dFecha.getValue());
        
    }
}


