package modmantenimiento;

import com.zarcillo.domain.Documento;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.DocumentoService;
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
import org.zkoss.zul.Checkbox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoDocumento extends SelectorComposer implements CrudListener{
    
    private Documento documento=new Documento();
    private Usuario usuario;  
    private MenuMantenimiento menuMantto;   
    
    @Wire
    private Window winDocumento;
    
    @Wire
    private Textbox txtNombre;
    
    @Wire
    private Textbox txtSunat;
    
    @Wire
    private Textbox txtAbrev;
          
    @Wire
    private Checkbox bCompra;
    
    @Wire
    private Checkbox bVenta;
    
    @Wire
    private Checkbox bPago;
    
    @Wire
    private Intbox nItems;
    
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    DocumentoService documentoService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winDocumento")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winDocumento.getFellow("menuMantto");
         menuMantto =  (MenuMantenimiento) macro.getChildren().get(0);
         menuMantto.setCrudlistener(this);
         initComponets();
     }
     
    @Listen("onOK = #txtNombre")
    public void onFocoSunat(Event event) {
        txtSunat.select();
    }
    
    @Listen("onOK = #txtSunat")
    public void onFocoAbrev(Event event) {
        txtAbrev.select();
    }
    
    @Listen("onOK = #txtAbrev")
    public void onFocoItems(Event event) {
        nItems.select();
    }
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        habilitar(true);
    }    
       
    @Override
    public void leer() {     
        documento.setCnomdocumento(txtNombre.getText().toUpperCase());
        documento.setCcodigosunat(txtSunat.getText());
        documento.setCabrev(txtAbrev.getText());
        documento.setNitems(nItems.getValue());
        documento.setBcompra(bCompra.isChecked());
        documento.setBventa(bVenta.isChecked());
        documento.setBpago(bPago.isChecked());
        documento.setIdusuario(usuario);
    }
    
    
    @Override
    public void escribir() {
        if (documento.getIddocumento()== null) {
            limpiar();
            return;
        }

        menuMantto.encuentra();
        quitarConstraint();
        txtNombre.setText(documento.getCnomdocumento());
        txtSunat.setText(documento.getCcodigosunat());
        txtAbrev.setText(documento.getCabrev());
        nItems.setValue(documento.getNitems());
        bCompra.setChecked(documento.getBcompra());
        bVenta.setChecked(documento.getBventa());
        bPago.setChecked(documento.getBpago());
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        habilitar(false);
        documento=new Documento();
        txtNombre.setText("");
        txtAbrev.setText("");
        txtSunat.setText("");
        nItems.setValue(0);
        bCompra.setChecked(false);
        bVenta.setChecked(false);
        bPago.setChecked(false);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        Window winbuscaprod = (Window) Executions.createComponents("/modulos/mantenimiento/util/busquedadocumento.zul", null, null);
        winbuscaprod.setAttribute("REST", true);
        winbuscaprod.doModal();
        Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
        if (rest) {
            Listbox lstproducto1 = (Listbox) winbuscaprod.getFellow("lstDocumento");
            ListModel modelobuscado = lstproducto1.getModel();
            documento =  (Documento) modelobuscado.getElementAt(lstproducto1.getSelectedIndex());
            escribir();
        }
    }

    @Override
    public void modificar() {
        agregarConstraint();
        if (documento.getIddocumento() == null) {
            throw new ExceptionZarcillo("Debe Buscar Documento...");
        }
    }

    @Override
    public void grabar() {        
        documentoService.registrar(documento);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void actualizar() {
        documentoService.actualizar(documento);
        Messagebox.show("Registro Satisfactorio");
    }

    @Override
    public void eliminar() {
        if (documento.getIddocumento() == null) {
            throw new ExceptionZarcillo("Debe Buscar Documento...");
        }

        int resp = Messagebox.show("Esta Seguro de eliminar el actual Registro", "Mantenimiento...", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            documentoService.eliminar(documento);
            documento = new Documento();
            Messagebox.show("El Documento Fue Eliminado", "Documento", Messagebox.OK, Messagebox.INFORMATION);
        }
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        txtNombre.setReadonly(enable);
        txtAbrev.setReadonly(enable);
        txtSunat.setReadonly(enable);
        nItems.setReadonly(enable);
        bCompra.setDisabled(enable);
        bVenta.setDisabled(enable);
        bPago.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        txtNombre.getValue();
    }

    @Override
    public void salir() {
        winDocumento.onClose();
    }   

    public void agregarConstraint() {
        txtNombre.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        txtNombre.setConstraint("");
    }   
}

