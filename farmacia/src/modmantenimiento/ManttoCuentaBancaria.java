/*package modmantenimiento;

import com.zarcillo.domain.Banco;
import com.zarcillo.domain.Linea;
import com.zarcillo.domain.CuentaBancaria;
import com.zarcillo.domain.Proveedor;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.BancoService;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ProveedorService;
import com.zarcillo.service.UsuarioService;
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
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoCuentaBancaria extends SelectorComposer implements CrudListener{
    
    private CuentaBancaria cbancaria=new CuentaBancaria();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;  
    
    private ListModelList modeloProveedor;
    private ListModelList modeloBanco;
    
    
    @Wire
    private Window winCuentaBancaria;
    
    @Wire
    private Textbox txtCuenta;
          
    @Wire
    private Combobox cboProveedor;
    
    @Wire
    private Combobox cboBanco;
    
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    ProveedorService proveedorService;
    
    @WireVariable
    BancoService bancoService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winCuentaBancaria")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) Path.getComponent("/winCuentaBancaria/menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #cboProveedor")
    public void onFocoBanco(Event event) {
        cboBanco.select();
    }
    
    @Listen("onOK = #cboBanco")
    public void onFocoCuenta(Event event) {
        txtCuenta.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloProveedor=new ListModelList(proveedorService.listaGeneral());
        cboProveedor.setModel(modeloProveedor);
        modeloBanco=new ListModelList(bancoService.listaGeneral());
        cboBanco.setModel(modeloBanco);
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        Proveedor proveedor=(Proveedor) modeloProveedor.getElementAt(cboProveedor.getSelectedIndex());
        Banco banco=(Banco) modeloBanco.getElementAt(cboBanco.getSelectedIndex());
        cbancaria.setIdproveedor(proveedor);
        cbancaria.setIdbanco(banco);
        cbancaria.setCcuenta(txtCuenta.getText());
        cbancaria.setIdusuario(usuario);
        sublinea.setIdlinea(linea);
    }
    
    
    @Override
    public void escribir() {
        if (sublinea.getIdsublinea()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(sublinea.getCnomsublinea());      
        cboLinea.setSelectedIndex(modeloLinea.indexOf(sublinea.getIdlinea()));
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        sublinea=new CuentaBancaria();
        txtNombre.setText("");
        cboLinea.setSelectedIndex(-1);
        cboLinea.setText("");
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedasublinea.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstCuentaBancaria");
            ListModel modelobuscado = lstproducto1.getModel();
            sublinea=  (CuentaBancaria) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (sublinea.getIdsublinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar CuentaBancaria...");
        }
    }

    @Override
    public void grabar() {        
        sublineaService.registrar(sublinea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        sublineaService.actualizar(sublinea);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (sublinea.getIdsublinea() == null) {
            throw new ExceptionZarcillo("Debe Buscar CuentaBancaria...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            sublineaService.eliminar(sublinea);
            sublinea = new CuentaBancaria();
            Messagebox.show("La CuentaBancaria Fue Eliminada", "CuentaBancaria", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        cboLinea.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboLinea.getValue();
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winCuentaBancaria.onClose();
    }   

    public void agregarConstraint() {
        cboLinea.setConstraint(new ConstraintCamposObligatorios());
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboLinea.setConstraint("");
        txtNombre.setConstraint("");
    }   
}*/

