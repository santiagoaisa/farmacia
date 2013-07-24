package modprueba;

import com.zarcillo.domain.Rol;
import com.zarcillo.service.RolService;
import java.util.List;
import javax.naming.NamingException;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Prueba extends SelectorComposer {

    @Wire
    private Window prueba;
    @Wire
    private Textbox txtprueba;
    //wire services
    @WireVariable
    RolService rolService;

    @Listen("onCreate=window#prueba")
    public void onCreate() throws NamingException {
        txtprueba.setText("PRUEBA");
        List<Rol> listaRol = rolService.listaRoles();

        for (Rol r : listaRol) {
            System.out.println(r);
        }
        
        Rol rol=new Rol();
        rol.setCnomrol("ROL Spring");
        rolService.registrar(rol);

    }
}
