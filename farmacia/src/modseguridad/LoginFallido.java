package modseguridad;

import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zul.Window;

public class LoginFallido extends SelectorComposer {
 
    @Wire
    private Window loginFallido;
        
    final Execution exec = Executions.getCurrent( );
    
    
    @Listen("onClick = button#btnRegresar")
    public void onRecorrido(Event event) {
        if(exec.getUserPrincipal() == null){
            exec.sendRedirect("/login.zul");
        }
    }
}
