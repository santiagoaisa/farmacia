package modmantenimiento.util;

import com.zarcillo.domain.Usuario;
import com.zarcillo.negocio.Encriptar;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.ListadoProveedorService;
import com.zarcillo.service.UsuarioService;
import java.security.NoSuchAlgorithmException;
import javax.naming.NamingException;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CambiarClave extends SelectorComposer {

    private Usuario usuario;
    @Wire
    private Window winClave;
    @Wire
    private Textbox txtUsuario;
    @Wire
    private Textbox txtAnterior;
    @Wire
    private Textbox txtNueva;
    @Wire
    private Textbox txtConfirma;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    ListadoProveedorService lp;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#winClave")
    public void onCreate() throws NamingException {
        initComponets();
    }
    
    @Listen("onClick = #btnRegistrar")
    public void onGrabar(Event event) throws NoSuchAlgorithmException {
        registrar();
    }

    public void initComponets() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        txtUsuario.setText(usuario.getClogin());
    }

    public void registrar() throws NoSuchAlgorithmException{
        String ccifrada = Encriptar.encriptar(txtAnterior.getText());
        
        if (!ccifrada.equals(usuario.getCclave())) {
            throw new ExceptionZarcillo("Contraseña Incorrecta");

        }
        if (!txtNueva.getText().equals(txtConfirma.getText())) {
            throw new ExceptionZarcillo("Contraseñas No Coinciden");
        }
        usuario.setCclave(txtNueva.getText());
        usuarioService.actualizarCambioContraseña(usuario);
        Messagebox.show("Se Ha Actualizado la Contraseña Satisfactoriamente", "Información del Sistema", Messagebox.OK, Messagebox.INFORMATION);
        winClave.onClose();
    }    
}