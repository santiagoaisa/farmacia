package modmantenimiento;

import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.PeriodoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UsuarioService;
import java.math.BigDecimal;
import java.util.Date;
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
import org.zkoss.zul.Datebox;
import org.zkoss.zul.Decimalbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoPeriodo extends SelectorComposer implements CrudListener{
    
    private Periodo periodo=new Periodo();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    
    @Wire
    private Window winPeriodo;
    
    @Wire
    private Intbox nAnio;
    
    @Wire
    private Intbox nMes;
    
    @Wire
    private Datebox dFecini;
          
    @Wire
    private Datebox dFecfin;
    
    @Wire
    private Decimalbox nIgv;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    PeriodoService periodoService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winPeriodo")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winPeriodo.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #nAnio")
    public void onMes(Event event) {
        nMes.select();
    }
    
    @Listen("onOK = #nMes")
    public void onIgv(Event event) {
        nIgv.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login); 
        dFecini.setValue(new Date());
        dFecfin.setValue(new Date());
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        periodo.setNano(nAnio.getValue());
        periodo.setNmes(nMes.getValue());
        periodo.setNigv(nIgv.getValue());
        periodo.setIdusuario(usuario);
        periodo.setDfecinicio(dFecini.getValue());
        periodo.setDfecfin(dFecfin.getValue());
    }
    
    
    @Override
    public void escribir() {
        if (periodo.getIdperiodo()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        nAnio.setValue(periodo.getNano());
        nMes.setValue(periodo.getNmes());
        nIgv.setValue(periodo.getNigv());
        dFecini.setValue(periodo.getDfecinicio());
        dFecfin.setValue(periodo.getDfecfin());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        periodo=new Periodo();
        nIgv.setValue(BigDecimal.ZERO);
        nAnio.setValue(0);
        nMes.setValue(0);
        dFecini.setValue(new Date());
        dFecfin.setValue(new Date());
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedaperiodo.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstPeriodo");
            ListModel modelobuscado = lstproducto1.getModel();
            periodo =  (Periodo) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (periodo.getIdperiodo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Periodo...");
        }
    }

    @Override
    public void grabar() {        
        periodoService.registrar(periodo);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        periodoService.actualizar(periodo);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (periodo.getIdperiodo() == null) {
            throw new ExceptionZarcillo("Debe Buscar Periodo...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            periodoService.eliminar(periodo);
            periodo = new Periodo();
            Messagebox.show("La Periodo Fue Eliminada", "Periodo", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        nAnio.setReadonly(enable);
        nMes.setReadonly(enable);
        nIgv.setReadonly(enable);
        dFecini.setDisabled(enable);
        dFecfin.setDisabled(enable);        
    }

    @Override
    public void validarDatos() {
        nAnio.getValue();
        nMes.getValue();
    }

    @Override
    public void salir() {
        winPeriodo.onClose();
    }   

    public void agregarConstraint() {        
    }

    public void quitarConstraint() {
    }   
}
