package modmantenimiento.util;

import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Toolbarbutton;
import org.zkoss.zul.Window;

public class MenuMantenimiento extends Window {

    private String accion = new String();
    Toolbarbutton btnNuevo;
    Toolbarbutton btnRegistrar;
    Toolbarbutton btnModificar;
    Toolbarbutton btnEliminar;
    Toolbarbutton btnBuscar;
    Toolbarbutton btnIgnorar;
    Toolbarbutton btnImprimir;
    Toolbarbutton btnSalir;
    CrudListener crudlistener;

    public void onCreate() {
        initcomponentes();
    }

    public void focoBuscar(){
        btnBuscar.focus();
    }


    void initcomponentes() {
        btnNuevo = (Toolbarbutton) getFellow("btnNuevo");
        btnRegistrar = (Toolbarbutton) getFellow("btnRegistrar");
        btnModificar = (Toolbarbutton) getFellow("btnModificar");
        btnEliminar = (Toolbarbutton) getFellow("btnEliminar");
        btnBuscar = (Toolbarbutton) getFellow("btnBuscar");
        btnIgnorar = (Toolbarbutton) getFellow("btnIgnorar");
        btnImprimir = (Toolbarbutton) getFellow("btnImprimir");
        btnSalir = (Toolbarbutton) getFellow("btnSalir");
    }

    public void Nuevo()  {
        crudlistener.limpiar();
        habilitar(false);
        accion = "N";
    }

    public void Modificar()  {
        crudlistener.modificar();
        accion = "M";
        habilitar(false);

    }

    private void habilitar(boolean enable) {
        btnNuevo.setVisible(enable);
        btnRegistrar.setVisible(!enable);
        btnModificar.setVisible(enable);
        btnEliminar.setVisible(enable);
        btnBuscar.setVisible(enable);
        btnIgnorar.setVisible(!enable);
        btnImprimir.setVisible(enable);

        crudlistener.habilitar(enable);
    }

    public void Grabar()  {
        crudlistener.validarDatos();

        int resp = Messagebox.show("Esta Seguro de Grabar El Registro", "Mantenimiento", Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION);
        if (resp == Messagebox.OK) {
            crudlistener.leer();

            if (accion.equals("N")) {
                crudlistener.grabar();
            } else {
                crudlistener.actualizar();
            }

            crudlistener.escribir();
            habilitar(true);
        } else {
            return;
        }
    }

    public void Eliminar() throws InterruptedException {
        crudlistener.eliminar();
        crudlistener.escribir();
        crudlistener.habilitar(true);

    }

    public void Buscar() {
        crudlistener.limpiar();
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

