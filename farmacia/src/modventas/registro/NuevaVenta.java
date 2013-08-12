package modventas.registro;

import com.zarcillo.domain.Almacen;
import com.zarcillo.domain.Lote;
import com.zarcillo.domain.RegistroSalida;
import com.zarcillo.domain.Usuario;
import com.zarcillo.dto.venta.DetalleVenta;
import com.zarcillo.service.AlmacenService;
import com.zarcillo.service.CondicionVentaService;
import com.zarcillo.service.UsuarioService;
import com.zarcillo.service.VentaService;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class NuevaVenta extends SelectorComposer{
    
    private Lote lote=new Lote();
    private Usuario usuario;   
    private RegistroSalida regsalida;
    private ListModelList modeloAlmacen;
    private ListModelList modeloDetalle;
    private ListModelList modeloCondicion;
    
    @Wire
    private Window winVenta;
    
    @Wire
    private Combobox cboAlmacen;
    
    @Wire
    private Combobox cboCondicion;
    
    @Wire
    private Datebox dFecha;
    
    @Wire
    private Button btnAgregar;
    
    @Wire 
    private Toolbarbutton btnGrabar;
    
    @Wire
    private Listbox lstDetalle;
    
    @Wire
    private Decimalbox nImporte;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    VentaService ventaService;
    
    @WireVariable
    AlmacenService almacenService;
    
    @WireVariable
    CondicionVentaService condicionVentaService;
    
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winVenta")
    public void onCreate() throws NamingException {        
         initComponets();
     }
    
    @Listen("onClick = #btnAgregar")
    public void onAgregarNuevo(Event event) {
        agregarDetalle();
    }  
    
    @Listen("onClick = #btnGrabar")
    public void onAgregarImprimir(Event event) {
        registrar();
    } 
     
    
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);  
        
        
        modeloAlmacen=new ListModelList(almacenService.listaGeneral());
        cboAlmacen.setModel(modeloAlmacen);
        if (modeloAlmacen.size() > 0) {
            cboAlmacen.onInitRender(new Event("", cboAlmacen));
            cboAlmacen.close();
            cboAlmacen.setSelectedIndex(0);
        }
        modeloCondicion=new ListModelList(ventaService.listaCondicion());
        cboCondicion.setModel(modeloCondicion);
        if (modeloCondicion.size() > 0) {
            cboCondicion.onInitRender(new Event("", cboCondicion));
            cboCondicion.close();
            cboCondicion.setSelectedIndex(0);
        }
        modeloDetalle=new ListModelList();
        lstDetalle.setModel(modeloDetalle);
        dFecha.setValue(new Date());
        
    }    
    private void agregarDetalle(){
        Almacen almacen=(Almacen) modeloAlmacen.getElementAt(cboAlmacen.getSelectedIndex());
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/ventas/util/agregardetalleventa.zul", null, null);
        winbuscaprod.setAttribute("ALMACEN", almacen);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            DetalleVenta detventa=(DetalleVenta) winbuscaprod.getAttribute("DETALLEVENTA");
            modeloDetalle.add(detventa);
            cargarPie();
        }
        else{
            btnGrabar.focus();
        }
    }
    
    private void cargarPie(){
        BigDecimal nsubtot=new BigDecimal(BigInteger.ZERO);
        BigDecimal nigv=new BigDecimal(BigInteger.ZERO);
        BigDecimal nprecio=new BigDecimal(BigInteger.ZERO);
        List<Listitem> ldatos = lstDetalle.getItems();
        DetalleVenta detalleventa;
        for (Listitem item : ldatos) {
            detalleventa=(DetalleVenta) modeloDetalle.getElementAt(item.getIndex());
            nsubtot=nsubtot.add(detalleventa.getNsubtot());
            nigv=nigv.add(detalleventa.getNigv());
            nprecio=nprecio.add(detalleventa.getNimporte());
        }
        nImporte.setValue(nprecio);
    }
    
   
    private void validar() {
        cboAlmacen.setConstraint(new ConstraintCamposObligatorios());
        cboAlmacen.getValue();
    }
    public void registrar() {
        DecimalFormat formato=new DecimalFormat("00");
        validar();
    }
}

