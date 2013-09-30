package modseguridad;

import com.zarcillo.domain.BarraHerramienta;
import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Modulo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.BarraHerramientaService;
import com.zarcillo.service.MapaService;
import com.zarcillo.service.ModuloService;
import com.zarcillo.service.UsuarioService;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
import jxl.biff.drawing.ComboBox;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zkmax.zul.Nav;
import org.zkoss.zkmax.zul.Navbar;
import org.zkoss.zkmax.zul.Navitem;
import org.zkoss.zul.Button;
import org.zkoss.zul.Div;
import org.zkoss.zul.East;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.North;
import org.zkoss.zul.Separator;
import org.zkoss.zul.Toolbar;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.West;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Index extends SelectorComposer {
    //controles

    @Wire
    private Window index;
    @Wire
    private Div divModulo;
    @Wire
    private Div divBarra;
    @Wire
    private Toolbar tb;
    @Wire
    private Div divContenido;
    @Wire
    private Label lblFecha;
    @Wire
    private Label lblUsuario;
    @Wire
    private Toolbarbutton btnSalir;
    @Wire
    private West menuWest;
//    @Wire
//    private East menuEast;
    @Wire
    private North menuNorth;
    //wire services
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    MapaService mapaService;
    @WireVariable
    ModuloService moduloService;
    @WireVariable
    BarraHerramientaService barraHerramientaService;
    //objetos
    Usuario usuario;
    final Execution exec = Executions.getCurrent();
    Navbar sidebar = new Navbar();
    private String user_login;

    @Listen("onCreate=window#index")
    public void onCreate() throws NamingException {
        llenarSesion();
        llenarModulo();
        llenarBarra();
    }

    private void llenarMenu(Integer idmodulo) {
        sidebar.detach();
        sidebar = new Navbar();
        sidebar.setSclass("sidebar");
        sidebar.setId("sidebar");
        sidebar.setOrient("vertical");
        sidebar.setParent(menuWest);
        List<Mapa> listaencabezado = mapaService.listaEncabezado(usuario.getIdrol().getIdrol(), idmodulo);

        for (Mapa m : listaencabezado) {
            menuWest.setTitle(m.getIdmenu().getIdmodulo().toString());
            //////
            Nav menuprincipal = new Nav(m.getIdmenu().getCnommenu());
            menuprincipal.setIconSclass(m.getIdmenu().getCimagen());
            menuprincipal.setDetailed(true);

            List<Mapa> listamenus = mapaService.listaMenu(usuario.getIdrol().getIdrol(), m);
            for (final Mapa mm : listamenus) {
                Navitem menuopciones = new Navitem();
                menuopciones.setLabel(mm.getIdmenu().toString());
                menuopciones.setIconSclass(mm.getIdmenu().getCimagen());
                menuopciones.addEventListener(Events.ON_CLICK, new EventListener() {
                    public void onEvent(Event event) throws Exception {
                        List listame = divContenido.getChildren();
                        if (!listame.isEmpty()) {
                            divContenido.getFirstChild().detach();
                        }

                        if (mm.getIdmenu().getBmodal()) {
                            Window contactWnd = (Window) Executions.createComponents(mm.getIdmenu().getCruta(), null, null);
                            contactWnd.doModal();
                        } else {
                            Window contactWnd = (Window) Executions.createComponents(mm.getIdmenu().getCruta(), divContenido, null);
                            contactWnd.doEmbedded();
                        }

                    }
                });

                menuprincipal.appendChild(menuopciones);
            }
            sidebar.appendChild(menuprincipal);
        }
    }

    private void llenarModulo() {
        List<Modulo> listaModulo = moduloService.listaPorIdrol(usuario.getIdrol().getIdrol());
        for (Modulo m : listaModulo) {
            final Button boton = new Button(m.getCnommodulo(), m.getCimagen());
            boton.setId(m.getIdmodulo() + "");
            boton.setParent(divModulo);
            boton.setTooltiptext(m.getCnommodulo());
            boton.setOrient("vertical");
            boton.setHeight("68px");
            boton.setStyle("font-weight: bold;");

            boton.addEventListener(Events.ON_CLICK, new EventListener() {
                public void onEvent(Event event) throws Exception {
                    llenarMenu(Integer.valueOf(boton.getId()));
                }
            });
        }
    }

    private void llenarBarra() {
        Toolbarbutton botonherramienta = new Toolbarbutton();
        botonherramienta.setParent(tb);
        botonherramienta.setTooltiptext("BARRA DE HERRAMIENTAS");
        botonherramienta.setIconSclass("z-icon-wrench");

        List<BarraHerramienta> listaBarra = barraHerramientaService.listaGeneral();
        for (final BarraHerramienta b : listaBarra) {
            Toolbarbutton boton = new Toolbarbutton(b.getCnombarra());            
            boton.setParent(tb);
            boton.setIconSclass(b.getCimagen());
            boton.setTooltiptext(b.getCnombarra());
            boton.addEventListener(Events.ON_CLICK, new EventListener() {
                public void onEvent(Event event) throws Exception {
                    Window contactWnd = (Window) Executions.createComponents(b.getCruta(), null, null);
                    contactWnd.doModal();
                }
            });
        }



    }

    private void llenarSesion() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.DEFAULT);
        String fechaInicio = df.format(new Date());
        lblFecha.setValue(fechaInicio);
        lblUsuario.setValue(usuario.getCnomusuario());
    }

    @Listen("onClick = toolbarbutton#btnSalir")
    public void onLogin2(Event event) {
        int resp = Messagebox.show("Esta Seguro de Salir del Sistema", "Distribuidora", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp == Messagebox.YES) {
            exec.getDesktop().getSession().invalidate();
            exec.sendRedirect("/modulos/index.zul");
        }
    }
}
