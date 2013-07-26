package modmantenimiento.util;

import javax.naming.NamingException;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

public class MenuMantenimiento extends Window {

    private String accion = new String();
    
    @Wire
    private Window winMantenimiento;
    @Wire
    private Toolbarbutton btnNuevo;    
    @Wire
    private Toolbarbutton btnGrabar;
    @Wire
    private Toolbarbutton btnModificar;
    @Wire
    private Toolbarbutton btnEliminar;
    @Wire
    private Toolbarbutton btnBuscar;
    @Wire
    private Toolbarbutton btnIgnorar;
    @Wire
    private Toolbarbutton btnImprimir;
    @Wire
    private Toolbarbutton btnSalir;
    
    CrudListener crudlistener;

    @Listen("onCreate=window#winMantenimiento")
    public void onCreate() throws NamingException {
         btnBuscar.focus();
     }
    
    public void Nuevo(){
        crudlistener.limpiar();
        habilitar(false);
        accion = "N";
    }
    public void Modificar(){
        crudlistener.modificar();
        accion = "M";
        habilitar(false);      
        
    }

    private void habilitar(boolean enable) {
        btnNuevo.setVisible(enable);
        btnGrabar.setVisible(!enable);
        btnModificar.setVisible(enable);
        btnEliminar.setVisible(enable);
        btnBuscar.setVisible(enable);
        btnIgnorar.setVisible(!enable);
        btnImprimir.setVisible(enable);

        crudlistener.habilitar(enable);
    }

    public void Grabar() {
        crudlistener.validarDatos();

        int resp = Messagebox.show("Esta Seguro de Grabar El Registro", "Mantenimiento", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK)
        {
        crudlistener.leer();
        
        if (accion.equals("N")) {
            crudlistener.grabar();
        } else {
            crudlistener.actualizar();
        }

        crudlistener.escribir();
        habilitar(true);
        }
        else
            return;
    }

    public void Eliminar(){
        crudlistener.eliminar();
        crudlistener.escribir();
    }

    public void Buscar() {
        crudlistener.habilitar(true);
        crudlistener.buscar();  
        
    }

    public void encuentra() {
        habilitar(true);
    }

    public void Ignorar() {
        crudlistener.escribir();
        habilitar(true);
    }

    public void Imprimir() {
        crudlistener.imprimir();
    }

    public void Salir() {
        crudlistener.salir();
    }

    public CrudListener getCrudlistener() {
        return crudlistener;
    }

    public void setCrudlistener(CrudListener crudlistener) {
        this.crudlistener = crudlistener;
    }
}

