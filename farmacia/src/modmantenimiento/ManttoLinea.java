package modmantenimiento;

import com.zarcillo.domain.Linea;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.LineaService;
import com.zarcillo.service.UsuarioService;
import java.math.BigDecimal;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoLinea extends SelectorComposer implements CrudListener{
    
    private Linea linea=new Linea();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winLinea;
    
    @Wire
    private Textbox txtNombre;
          
    @Wire
    private Checkbox bActivo;
    
    @Wire
    private Decimalbox nIncremento;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    LineaService lineaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winLinea")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winLinea.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoRuc(Event event) {
        nIncremento.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        linea.setCnomlinea(txtNombre.getText().toUpperCase());
        linea.setNincremento(nIncremento.getValue());
        linea.setIdusuario(usuario);
        linea.setBactivo(bActivo.isChecked());
    }
    
    
    @Override
    public void escribir() {
        if (linea.getIdlinea()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(linea.getCnomlinea());
        nIncremento.setValue(linea.getNincremento());        
        bActivo.setChecked(linea.getBactivo());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        linea=new Linea();
        txtNombre.setText("");
        nIncremento.setValue(BigDecimal.ZERO);
        bActivo.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedalinea.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstLinea");
            ListModel modelobuscado = lstproducto1.getModel();
            linea =  (Linea) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (linea.getIdlinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar Linea...");
        }
    }

    @Override
    public void grabar() {        
        lineaService.registrar(linea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        lineaService.actualizar(linea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (linea.getIdlinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar Linea...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            lineaService.eliminar(linea);
            linea = new Linea();
            Messagebox.show("La Linea Fue Eliminada", "Linea", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        nIncremento.setReadonly(enable);
        bActivo.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winLinea.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}
