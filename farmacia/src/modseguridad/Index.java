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
import org.zkoss.zul.Div;
import org.zkoss.zul.Label;
import org.zkoss.zul.Menu;
import org.zkoss.zul.Menubar;
import org.zkoss.zul.Menuitem;
import org.zkoss.zul.Menupopup;
import org.zkoss.zul.Menuseparator;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Toolbar;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class Index extends SelectorComposer {
    //controles

    @Wire
    private Window index;
    @Wire
    private Div divMenu;
    @Wire
    private Div divContenido;
    @Wire
    private Label lblSesion;
    @Wire
    private Toolbar btnModulos;
    @Wire
    private Toolbarbutton btnSalir;
    //wire services
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    MapaService mapaService;
    @WireVariable
    ModuloService moduloService;
    //objetos
    Usuario usuario;
    Menubar menu = new Menubar();
    final Execution exec = Executions.getCurrent();

    @Listen("onCreate=window#index")
    public void onCreate() throws NamingException {

        usuario = usuarioService.buscarPorLogin(exec.getUserPrincipal().getName());

        llenarSesion();
        List<Modulo> listaModulo = moduloService.listaPorIdrol(usuario.getIdrol().getIdrol());

        for (Modulo m : listaModulo) {
            final Toolbarbutton boton = new Toolbarbutton(m.getCnommodulo(), m.getCimagen());
            boton.setId(m.getIdmodulo() + "");
            boton.setParent(btnModulos);
            boton.setTooltiptext(m.getCnommodulo());
            boton.setOrient("vertical");
            btnModulos.appendChild(boton);

            boton.addEventListener(Events.ON_CLICK, new EventListener() {
                public void onEvent(Event event) throws Exception {
                    llenarMenu(Integer.valueOf(boton.getId()));
                }
            });
        }

    }
    
    @Listen("onClick = Toolbarbutton#btnSalir")
    public void salirSistema() {
        menu.detach();
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
    

    private void llenarMenu(Integer idmodulo) {
        menu.detach();
        menu = new Menubar();
        List<Mapa> listaencabezado = mapaService.listaEncabezado(usuario.getIdrol().getIdrol(), idmodulo);

        for (Mapa m : listaencabezado) {

            Menu menuprincipal = new Menu(m.getIdmenu().getCnommenu(), m.getIdmenu().getCruta());
            menuprincipal.setParent(menu);
            Menupopup contenedormenu = new Menupopup();

            List<Mapa> listamenus = mapaService.listaMenu(usuario.getIdrol().getIdrol(), m);
            for (final Mapa mm : listamenus) {
                

                Menu menuopciones = new Menu(mm.getIdmenu() + "");
                Menuitem menuopciones1 = new Menuitem(mm.getIdmenu() + "", mm.getIdmenu().getCruta());
                List<Mapa> listasubmenus = mapaService.listaSubmenu(usuario.getIdrol().getIdrol(), mm);
                boolean estado = false;
                Menupopup contenedorsubmenu = new Menupopup();
                // MENU NIVEL 3
                for (final Mapa mmm : listasubmenus) {
                   
                    contenedorsubmenu.setParent(menuopciones);
                    Menuitem submenu = new Menuitem(mmm.getIdmenu() + "", mmm.getIdmenu().getCruta());

                    

                    submenu.addEventListener(Events.ON_CLICK, new EventListener() {
                        public void onEvent(Event event) throws Exception {
                            List listame = divContenido.getChildren();
                            if (!listame.isEmpty()) {
                                divContenido.getFirstChild().detach();
                            }

                            if (mmm.getIdmenu().getBmodal()) {
                                Window contactWnd = (Window) Executions.createComponents(mmm.getIdmenu().getCruta(), null, null);
                                contactWnd.doModal();
                            } else {
                                Window contactWnd = (Window) Executions.createComponents(mmm.getIdmenu().getCruta(), divContenido, null);
                                contactWnd.doEmbedded();
                            }

                        }
                    });



                    //MENU NIVEL 3
                    if (mmm.getIdmenu().getCnommenu().equals("-")) {
                        //LINEA DE SEPARACION
                        Menuseparator mseparador = new Menuseparator();
                        mseparador.setParent(contenedorsubmenu);
                    } else {
                        submenu.setParent(contenedorsubmenu);
                    }

                    estado = true;

                }

                contenedormenu.setParent(menuprincipal);

                if (estado) {
                    menuopciones.setParent(contenedormenu);

                } else {
                    // MENU NIVEL 2

                    if (mm.getIdmenu().getCnommenu().equals("-")) {
                        //LINEA DE SEPARACION
                        Menuseparator mseparador = new Menuseparator();
                        mseparador.setParent(contenedormenu);
                    } else {
                        menuopciones1.setParent(contenedormenu);
                    }

                    menuopciones1.addEventListener(Events.ON_CLICK, new EventListener() {
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
                }

            }

        }
        menu.setParent(divMenu);
    }

    private void llenarSesion() {
        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.DEFAULT);
        String fechaInicio = df.format(new Date());
        lblSesion.setValue("Usuario: " + usuario.getCnomusuario() + " | " + "Inicio Sesion: " + fechaInicio + " | ");
    }

    
    
    
}
