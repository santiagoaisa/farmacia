package modmantenimiento;

import com.zarcillo.domain.Mapa;
import com.zarcillo.domain.Menu;
import com.zarcillo.domain.Modulo;
import com.zarcillo.domain.Rol;
import com.zarcillo.service.MapaService;
import com.zarcillo.service.ModuloService;
import com.zarcillo.service.RolService;
import com.zarcillo.service.UsuarioService;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.naming.NamingException;
import modmantenimiento.util.ConstraintCamposObligatorios;
import modmantenimiento.util.CrudListener;
import modmantenimiento.util.MenuMantenimiento;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.Path;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.MouseEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.ListModel;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Tab;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class ManttoMapa extends SelectorComposer implements CrudListener {

    private MenuMantenimiento menuMantto;
    private ListModelList modeloRol;
    private ListModelList modeloModulo;
    private ListModelList modeloArchivo;
    private ListModelList modeloProceso;
    private ListModelList modeloConsulta;
    private ListModelList modeloHerramienta;
    @Wire
    private Window winMapa;
    @Wire
    private Combobox cboRol;
    @Wire
    private Combobox cboModulo;
    @Wire
    private Button btnAgregar;
    @Wire
    private Tab tabArchivo;
    @Wire
    private Tab tabProceso;
    @Wire
    private Tab tabConsulta;
    @Wire
    private Tab tabHerramienta;
    @Wire
    private Listbox lstArchivo;
    @Wire
    private Listbox lstProceso;
    @Wire
    private Listbox lstConsulta;
    @Wire
    private Listbox lstHerramienta;
    @WireVariable
    RolService rolService;
    @WireVariable
    ModuloService moduloService;
    @WireVariable
    MapaService mapaService;
    @WireVariable
    UsuarioService usuarioService;
    @WireVariable
    MapaService tipoPagoService;

    @Listen("onCreate=window#winMapa")
    public void onCreate() throws NamingException {
        HtmlMacroComponent macro = (HtmlMacroComponent) winMapa.getFellow("menuMantto");
        menuMantto = (MenuMantenimiento) macro.getChildren().get(0);
        menuMantto.setCrudlistener(this);
        initComponets();
    }

    @Listen("onOK = #cboRol")
    public void onFocoModulo(Event event) {
        cboModulo.select();
    }

    @Listen("onOK = #cboModulo")
    public void onProcesar(Event event) {
        escribir();
        habilitar(false);
        
    }

    @Listen("onClick = #btnAgregar")
    public void submit(MouseEvent event) {
        agregarRuta();
    }
    /*@Listen("onOK = #")
    public void onAgregarRuta(Event event) {
        agregarRuta();
    }*/

    @Listen("onOK = #lstArchivo")
    public void onArchivo(Event event) {
        if (!btnAgregar.isDisabled()) {
            eliminarRutaArchivo();
        }
    }

    @Listen("onOK = #lstProceso")
    public void onProceso(Event event) {
        if (!btnAgregar.isDisabled()) {
            eliminarRutaProceso();
        }
    }

    @Listen("onOK = #lstConsulta")
    public void onConsulta(Event event) {
        if (!btnAgregar.isDisabled()) {
            eliminarRutaConsulta();
        }
    }

    @Listen("onOK = #lstHerramienta")
    public void onHerramienta(Event event) {
        if (!btnAgregar.isDisabled()) {
            eliminarRutaHerramienta();
        }
    }

    public void initComponets() {
        modeloArchivo = new ListModelList();
        lstArchivo.setModel(modeloArchivo);
        modeloProceso = new ListModelList();
        lstProceso.setModel(modeloProceso);
        modeloConsulta = new ListModelList();
        lstConsulta.setModel(modeloConsulta);
        modeloHerramienta = new ListModelList();
        lstHerramienta.setModel(modeloRol);

        modeloRol = new ListModelList(rolService.listaGeneral());
        cboRol.setModel(modeloRol);

        modeloModulo = new ListModelList(moduloService.listaGeneral());
        cboModulo.setModel(modeloModulo);

        habilitar(true);
    }

    public void llenarDatos() {
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());

        modeloArchivo = new ListModelList(mapaService.listaPorIdrolPorIdmoduloMenuArchivo(rol.getIdrol(), modulo.getIdmodulo()));
        lstArchivo.setModel(modeloArchivo);
        modeloProceso = new ListModelList(mapaService.listaPorIdrolPorIdmoduloMenuProceso(rol.getIdrol(), modulo.getIdmodulo()));
        lstProceso.setModel(modeloProceso);
        modeloConsulta = new ListModelList(mapaService.listaPorIdrolPorIdmoduloMenuConsulta(rol.getIdrol(), modulo.getIdmodulo()));
        lstConsulta.setModel(modeloConsulta);
        modeloHerramienta = new ListModelList(mapaService.listaPorIdrolPorIdmoduloMenuHerramienta(rol.getIdrol(), modulo.getIdmodulo()));
        lstHerramienta.setModel(modeloHerramienta);

    }

    public void agregarRuta() {
        if (tabArchivo.isSelected()) {
            agregarRutaArchivo();
        }
        if (tabProceso.isSelected()) {
            agregarRutaProceso();
        }
        if (tabConsulta.isSelected()) {
            agregarRutaConsulta();
        }
        if (tabHerramienta.isSelected()) {
            agregarRutaHerramienta();
        }
    }

    private boolean detalleArchivo(Mapa mapatemp) {
        Mapa mapa;
        List<Listitem> ldatos = lstArchivo.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloArchivo.getElementAt(item.getIndex());
            if (mapa.getIdmenu().getIdmenu().equals(mapatemp.getIdmenu().getIdmenu())) {
                return false;
            }
        }
        return true;
    }

    private boolean detalleProceso(Mapa mapatemp) {
        Mapa mapa;
        List<Listitem> ldatos = lstProceso.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloProceso.getElementAt(item.getIndex());
            if (mapa.getIdmenu().getIdmenu().equals(mapatemp.getIdmenu().getIdmenu())) {
                return false;
            }
        }
        return true;
    }

    private boolean detalleConsulta(Mapa mapatemp) {
        Mapa mapa;
        List<Listitem> ldatos = lstConsulta.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloConsulta.getElementAt(item.getIndex());
            if (mapa.getIdmenu().getIdmenu().equals(mapatemp.getIdmenu().getIdmenu())) {
                return false;
            }
        }
        return true;
    }

    private boolean detalleHerramienta(Mapa mapatemp) {
        Mapa mapa;
        List<Listitem> ldatos = lstHerramienta.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloHerramienta.getElementAt(item.getIndex());
            if (mapa.getIdmenu().getIdmenu().equals(mapatemp.getIdmenu().getIdmenu())) {
                return false;
            }
        }
        return true;
    }

    public void agregarRutaArchivo() {
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        Window winagregar = (Window) Executions.createComponents("/modulos/mantenimiento/util/agregarruta.zul", null, null);
        winagregar.setAttribute("REST", true);
        winagregar.setAttribute("TEMP", "A");
        winagregar.setAttribute("MODULO", modulo);
        winagregar.doModal();
        Listbox lstMapa = (Listbox) winagregar.getFellow("lstMapa");
        ListModel modelobuscado = lstMapa.getModel();
        Set<Listitem> ldatos = lstMapa.getSelectedItems();

        if ((Boolean) winagregar.getAttribute("REST")) {

            for (Listitem item : ldatos) {
                Menu menu = (Menu) modelobuscado.getElementAt(item.getIndex());
                Mapa mapa = new Mapa();
                mapa.setIdmenu(menu);
                mapa.setIdrol(rol);
                if (detalleArchivo(mapa)) {
                    modeloArchivo.add(mapa);
                } else {
                    Messagebox.show("El Menu:" + mapa.getIdmenu() + "\nYa existe");
                }
            }
        }
    }

    public void agregarRutaProceso() {
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        Window winagregar = (Window) Executions.createComponents("/modulos/mantenimiento/util/agregarruta.zul", null, null); 
        winagregar.setAttribute("REST", true);
        winagregar.setAttribute("TEMP", "P");
        winagregar.setAttribute("ROL", rol);
        winagregar.setAttribute("MODULO", modulo);
        winagregar.doModal();
        Listbox lstMapa = (Listbox) winagregar.getFellow("lstMapa");
        ListModel modelobuscado = lstMapa.getModel();
        Set<Listitem> ldatos = lstMapa.getSelectedItems();

        if ((Boolean) winagregar.getAttribute("REST")) {
            for (Listitem item : ldatos) {
                Menu menu = (Menu) modelobuscado.getElementAt(item.getIndex());
                Mapa mapa = new Mapa();
                mapa.setIdmenu(menu);
                mapa.setIdrol(rol);
                if (detalleProceso(mapa)) {
                    modeloProceso.add(mapa);
                } else {
                    Messagebox.show("El Menu:" + mapa.getIdmenu() + "\nYa existe");
                }
            }
        }
    }

    public void agregarRutaConsulta() {
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        Window winagregar = (Window) Executions.createComponents("/modulos/mantenimiento/util/agregarruta.zul", null, null);
        winagregar.setAttribute("REST", true);
        winagregar.setAttribute("TEMP", "C");
        winagregar.setAttribute("ROL", rol);
        winagregar.setAttribute("MODULO", modulo);
        winagregar.doModal();

        Listbox lstMapa = (Listbox) winagregar.getFellow("lstMapa");
        ListModel modelobuscado = lstMapa.getModel();
        Set<Listitem> ldatos = lstMapa.getSelectedItems();

        if ((Boolean) winagregar.getAttribute("REST")) {
            for (Listitem item : ldatos) {
                Menu menu = (Menu) modelobuscado.getElementAt(item.getIndex());
                Mapa mapa = new Mapa();
                mapa.setIdmenu(menu);
                mapa.setIdrol(rol);
                if (detalleConsulta(mapa)) {
                    modeloConsulta.add(mapa);
                } else {
                    Messagebox.show("El Menu:" + mapa.getIdmenu() + "\nYa existe");
                }
            }
        }
    }

    public void agregarRutaHerramienta() {
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        Window winagregar = (Window) Executions.createComponents("/modulos/mantenimiento/util/agregarruta.zul", null, null);
        winagregar.setAttribute("REST", true);
        winagregar.setAttribute("TEMP", "H");
        winagregar.setAttribute("ROL", rol);
        winagregar.setAttribute("MODULO", modulo);
        winagregar.doModal();

        Listbox lstMapa = (Listbox) winagregar.getFellow("lstMapa");
        ListModel modelobuscado = lstMapa.getModel();
        Set<Listitem> ldatos = lstMapa.getSelectedItems();


        if ((Boolean) winagregar.getAttribute("REST")) {
            for (Listitem item : ldatos) {
                Menu menu = (Menu) modelobuscado.getElementAt(item.getIndex());
                Mapa mapa = new Mapa();
                mapa.setIdmenu(menu);
                mapa.setIdrol(rol);
                if (detalleHerramienta(mapa)) {
                    modeloHerramienta.add(mapa);
                } else {
                    Messagebox.show("El Menu:" + mapa.getIdmenu() + "\nYa existe");
                }
            }
        }
    }

    public void eliminarRutaArchivo() {
        Mapa mapa = (Mapa) modeloArchivo.getElementAt(lstArchivo.getSelectedIndex());
        int resp = Messagebox.show("Desea eliminar menu: " + mapa.getIdmenu().getCnommenu(), "Detalle Archivo", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp == Messagebox.YES) {
            modeloArchivo.remove(lstArchivo.getSelectedIndex());
        }
    }

    public void eliminarRutaProceso() {
        Mapa mapa = (Mapa) modeloProceso.getElementAt(lstProceso.getSelectedIndex());
        int resp = Messagebox.show("Desea eliminar menu: " + mapa.getIdmenu().getCnommenu(), "Detalle Proceso", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp == Messagebox.YES) {
            modeloProceso.remove(lstProceso.getSelectedIndex());
        }
    }

    public void eliminarRutaConsulta() {
        Mapa mapa = (Mapa) modeloConsulta.getElementAt(lstConsulta.getSelectedIndex());
        int resp = Messagebox.show("Desea eliminar menu: " + mapa.getIdmenu().getCnommenu(), "Detalle Archivo", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp == Messagebox.YES) {
            modeloConsulta.remove(lstConsulta.getSelectedIndex());
        }
    }

    public void eliminarRutaHerramienta() {
        Mapa mapa = (Mapa) modeloHerramienta.getElementAt(lstHerramienta.getSelectedIndex());
        int resp = Messagebox.show("Desea eliminar menu: " + mapa.getIdmenu().getCnommenu(), "Detalle Archivo", Messagebox.YES | Messagebox.NO, Messagebox.QUESTION);
        if (resp == Messagebox.YES) {
            modeloHerramienta.remove(lstHerramienta.getSelectedIndex());
        }
    }

    @Override
    public void leer() {
        Modulo modulo = (Modulo) modeloModulo.getElementAt(cboModulo.getSelectedIndex());
        Rol rol = (Rol) modeloRol.getElementAt(cboRol.getSelectedIndex());
        rol.setMapaCollection(llenarDetalle());
        mapaService.registrar(rol, modulo.getIdmodulo());
    }

    public List<Mapa> llenarDetalle() {
        List<Mapa> coldetalle = new ArrayList<Mapa>();
        Mapa mapa;
        List<Listitem> ldatos = lstArchivo.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloArchivo.getElementAt(item.getIndex());
            coldetalle.add(mapa);
        }

        ldatos = lstProceso.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloProceso.getElementAt(item.getIndex());
            coldetalle.add(mapa);
        }
        ldatos = lstConsulta.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloConsulta.getElementAt(item.getIndex());
            coldetalle.add(mapa);
        }
        ldatos = lstHerramienta.getItems();
        for (Listitem item : ldatos) {
            mapa = (Mapa) modeloHerramienta.getElementAt(item.getIndex());
            coldetalle.add(mapa);
        }
        return coldetalle;
    }

    @Override
    public void escribir() {
        menuMantto.encuentra();
        quitarConstraint();
        llenarDatos();
    }

    @Override
    public void limpiar() {
        quitarConstraint();
        cboRol.setText("");
        cboRol.setSelectedIndex(-1);
        cboModulo.setText("");
        cboModulo.setSelectedIndex(-1);
        modeloArchivo = new ListModelList();
        lstArchivo.setModel(modeloArchivo);
        modeloProceso = new ListModelList();
        lstProceso.setModel(modeloProceso);
        modeloConsulta = new ListModelList();
        lstConsulta.setModel(modeloConsulta);
        modeloHerramienta = new ListModelList();
        lstHerramienta.setModel(modeloRol);
        agregarConstraint();
    }

    @Override
    public void buscar() {
        cboRol.focus();
    }

    @Override
    public void modificar() {
        agregarConstraint();
    }

    @Override
    public void grabar() {
    }

    @Override
    public void actualizar() {
    }

    @Override
    public void eliminar() {
    }

    @Override
    public void imprimir() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void habilitar(boolean enable) {
        cboRol.setDisabled(!enable);
        cboModulo.setDisabled(!enable);
        btnAgregar.setDisabled(enable);
    }

    @Override
    public void validarDatos() {
        cboRol.getValue();
        cboModulo.getValue();
    }

    @Override
    public void salir() {
        winMapa.onClose();
    }

    public void agregarConstraint() {
        cboRol.setConstraint(new ConstraintCamposObligatorios());
        cboModulo.setConstraint(new ConstraintCamposObligatorios());
    }

    public void quitarConstraint() {
        cboRol.setConstraint("");
        cboModulo.setConstraint("");
    }
}
