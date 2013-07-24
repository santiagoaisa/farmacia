package modseguridad;

import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.WireVariable;

@Service
public class EntityManagerUserDetailsService implements UserDetailsService {

    final Execution exec = Executions.getCurrent();
    //wire services
    @Autowired
    UsuarioService usuarioService;

    public EntityManagerUserDetailsService() {
    }

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        User usuarioSpring = null;
        try {
            Usuario usuario = usuarioService.buscarPorLogin(login);              
            List<GrantedAuthority> listaPermisos = new ArrayList<GrantedAuthority>();

            usuarioSpring = new User(usuario.getClogin(), usuario.getCclave(), true, true, true, true, listaPermisos);
        } catch (Exception e) {            
            throw new ExceptionZarcillo("Error en Login");
        }
        
        return usuarioSpring;
    }
}
