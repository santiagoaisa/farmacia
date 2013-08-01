package modseguridad;

import com.zarcillo.domain.DetalleAutorizacion;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.ExceptionZarcillo;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;

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
            
            List<DetalleAutorizacion> lista = new ArrayList<DetalleAutorizacion>();
            if (usuario.getIdusuario() == null) {
            } else {
                lista = usuarioService.listaDetalleAutorizacionPorIdusuario(usuario.getIdusuario());
            }

            List<GrantedAuthority> listaPermisos = new ArrayList<GrantedAuthority>();

            for (DetalleAutorizacion dp : lista) {                
                listaPermisos.add(new GrantedAuthorityImpl(dp.getIdautorizacion().getCnomautorizacion()));
            }
            

            usuarioSpring = new User(usuario.getClogin(), usuario.getCclave(), true, true, true, true, listaPermisos);
        } catch (Exception e) {
            throw new ExceptionZarcillo("Error en Login");
        }

        return usuarioSpring;
    }
}
