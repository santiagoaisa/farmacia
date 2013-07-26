package modmantenimiento.util;

public interface CrudListener {
    public void leer();
    public void escribir();
    public void limpiar();
    public void buscar();
    public void modificar();
    public void grabar();
    public void actualizar();    
    public void eliminar();    
    public void imprimir();    
    public void habilitar(boolean enable);
    public void validarDatos();
    public void salir();    
}