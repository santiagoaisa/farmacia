package modseguridad;

import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Modulo;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.MapaService;
import com.zarcillo.service.ModuloService;
import com.zarcillo.service.UsuarioService;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;
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
import org.zkoss.zul.Label;
import org.zkoss.zul.North;
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
    private Div divContenido;
    @Wire
    private Label lblSesion;
    @Wire
    private Toolbarbutton btnSalir;
    @Wire
    private West menuWest;
    @Wire
    private North menuNorth;
    //wire services
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    MapaService mapaService;
    @WireVariable
    ModuloService moduloService;
    //objetos
    Usuario usuario;
    final Execution exec = Executions.getCurrent();
    Navbar sidebar = new Navbar();
    private String user_login;

    @Listen("onCreate=window#index")
    public void onCreate() throws NamingException {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuarioService.buscarPorLogin(user_login);
        llenarSesion();

        divModulo.detach();
        divModulo = new Div();
        divModulo.setParent(menuNorth);
        List<Modulo> listaModulo = moduloService.listaPorIdrol(usuario.getIdrol().getIdrol());

        for (Modulo m : listaModulo) {
            final Button boton = new Button(m.getCnommodulo(), m.getCimagen());
            boton.setId(m.getIdmodulo() + "");
            boton.setParent(divModulo);
            boton.setTooltiptext(m.getCnommodulo());
            boton.setOrient("vertical");
            boton.setHeight("68px");

            boton.addEventListener(Events.ON_CLICK, new EventListener() {
                public void onEvent(Event event) throws Exception {

                    llenarMenu(Integer.valueOf(boton.getId()));
                }
            });
        }

    }

    @Listen("onClick = Toolbarbutton#btnSalir")
    public void salirSistema() {
        index.detach();
        exec.getDesktop().getSession().invalidate();
        exec.sendRedirect("/modulos/index.zul");
    }

    @Listen("onClick = #btnKardex")
    public void onConsultaKardex(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/almacen/consulta/kardexdiario.zul", null, null);
        contactWnd.doModal();
    }

    @Listen("onClick = #btnVentas")
    public void onGenerarVenta(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/ventas/registro/nuevaventa.zul", null, null);
        contactWnd.doModal();
    }

    @Listen("onClick = #btnDocumento")
    public void onGenerarDocumento(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/ventas/herramientas/generardocumento.zul", null, null);
        contactWnd.doModal();
    }

    @Listen("onClick = #btnBoleta")
    public void onConsultaBoleta(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/ventas/consulta/consultaboleta.zul", null, null);
        contactWnd.doModal();
    }

    @Listen("onClick = #btnFactura")
    public void onConsultaFactura(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/ventas/consulta/consultafactura.zul", null, null);
        contactWnd.doModal();
    }

    @Listen("onClick = #btnClave")
    public void onCambiarClave(Event event) {
        Window contactWnd = (Window) Executions.createComponents("/modulos/mantenimiento/util/cambiarclave.zul", null, null);
        contactWnd.doModal();
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
            menuprincipal.setIconSclass("z-icon-list-ul");
            menuprincipal.setDetailed(true);

            List<Mapa> listamenus = mapaService.listaMenu(usuario.getIdrol().getIdrol(), m);
            for (final Mapa mm : listamenus) {
                Navitem menuopciones = new Navitem();
                menuopciones.setLabel(mm.getIdmenu().toString());

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

    private void llenarSesion() {
        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.DEFAULT);
        String fechaInicio = df.format(new Date());
        lblSesion.setValue("Usuario: " + usuario.getCnomusuario() + " | " + "Inicio Sesion: " + fechaInicio + " | ");
    }
}
