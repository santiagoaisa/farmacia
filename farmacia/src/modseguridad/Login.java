package modseguridad;

import javax.naming.NamingException;
import org.zkoss.zhtml.Form;
import org.zkoss.zhtml.Input;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

public class Login extends SelectorComposer {

    @Wire
    private Window login;
    @Wire
    private Textbox txtUsuario;
    @Wire
    private Textbox txtClave;
    final Execution exec = Executions.getCurrent();

     @Listen("onCreate=window#login")
    public void onCreate() throws NamingException {
         login.focus();
     }
    
    @Listen("onOK = textbox#txtUsuario")
    public void onFocoClave(Event event) {
        txtClave.focus();
    }
    
    @Listen("onOK = textbox#txtClave")
    public void onLogin1(Event event) {
        validar();
    }

    @Listen("onClick = button#btnLogin")
    public void onLogin2(Event event) {
        validar();
    }

    private void validar() {
        Form formulario = new Form();
        formulario.setDynamicProperty("name", "j_spring_security_check");
        formulario.setDynamicProperty("action", "j_spring_security_check");
        formulario.setDynamicProperty("method", "post");

        Input control1 = new Input();
        control1.setDynamicProperty("name", "j_username");
        control1.setDynamicProperty("type", "password");
        control1.setDynamicProperty("value", txtUsuario.getText());
        control1.setVisible(false);

        Input control2 = new Input();
        control2.setDynamicProperty("name", "j_password");
        control2.setDynamicProperty("type", "password");
        control2.setDynamicProperty("value", txtClave.getText());
        control2.setVisible(false);

        formulario.appendChild(control1);
        formulario.appendChild(control2);

        login.appendChild(formulario);
        Clients.submitForm(formulario);
    }

    @Listen("onClick = button#btnBorrar")
    public void onBorrar(Event event) {
        txtClave.setText("");
    }
}
