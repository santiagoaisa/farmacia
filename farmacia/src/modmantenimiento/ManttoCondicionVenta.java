package modmantenimiento;

import com.zarcillo.domain.CondicionVenta;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.CondicionVentaService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UsuarioService;
import java.math.BigDecimal;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoCondicionVenta extends SelectorComposer implements CrudListener{
    
    private CondicionVenta condicion=new CondicionVenta();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winCondicion;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bContado;
    
    @Wire
    private Decimalbox nIncremento;
    
    @Wire
    private Intbox nPlazo;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    CondicionVentaService condicionVentaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winCondicion")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winCondicion.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoPlazo(Event event) {
        nPlazo.select();
    }
    
    @Listen("onOK = #nPlazo")
    public void onFocoDescuento(Event event) {
        nPlazo.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        condicion.setCnomcondicion(txtNombre.getText().toUpperCase());
        condicion.setNplazo(nPlazo.getValue());
        condicion.setNincremento(nIncremento.getValue());
        condicion.setIdusuario(usuario);
        condicion.setBcontado(bContado.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (condicion.getIdcondicion()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(condicion.getCnomcondicion());
        nPlazo.setValue(condicion.getNplazo());        
        nIncremento.setValue(condicion.getNincremento());
        bContado.setChecked(condicion.getBcontado());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        condicion=new CondicionVenta();
        txtNombre.setText("");
        nIncremento.setValue(BigDecimal.ZERO);
        nPlazo.setValue(0);
        bContado.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedacondicion.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstCondicion");
            ListModel modelobuscado = lstproducto1.getModel();
            condicion =  (CondicionVenta) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (condicion.getIdcondicion() == null) {
            throw new ExceptionZarcillo("Debe Buscar Condicion...");
        }
    }

    @Override
    public void grabar() {        
        condicionVentaService.registrar(condicion);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        condicionVentaService.actualizar(condicion);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (condicion.getIdcondicion() == null) {
            throw new ExceptionZarcillo("Debe Buscar Condicion...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            condicionVentaService.eliminar(condicion);
            condicion = new CondicionVenta();
            Messagebox.show("La Condicion Fue Eliminada", "Condicion", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        nPlazo.setReadonly(enable);
        nIncremento.setReadonly(enable);
        bContado.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winCondicion.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}