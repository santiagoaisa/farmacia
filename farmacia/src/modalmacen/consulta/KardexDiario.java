
package modalmacen.consulta;

import com.zarcillo.domain.Periodo;
import com.zarcillo.domain.Producto;
import com.zarcillo.domain.Usuario;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.NamingException;
import modmantenimiento.util.MenuPeriodo;
import modmantenimiento.util.PeriodoListener;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.HtmlMacroComponent;
import org.zkoss.zk.ui.SuspendNotAllowedException;
import org.zkoss.zul.Combobox;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.event.KeyEvent;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zkex.zul.Jasperreport;
import org.zkoss.zul.*;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class KardexDiario extends SelectorComposer implements PeriodoListener {
    //objetos
    private Producto producto;
    private Usuario usuario;
    private Periodo periodo;
    //controles
    @Wire
    private Window winKardex;
    @Wire
    private Combobox cboAlmacen;
    @Wire
    private Textbox txtLinea;
    @Wire
    private Textbox txtFamilia;
    @Wire
    private Textbox txtCodigo;
    @Wire
    private Textbox txtPresentacion;
    @Wire
    private Textbox txtNombre;
    @Wire
    private Listbox lstKardex;
    @Wire
    private Decimalbox nCompra;
    @Wire
    private Decimalbox nVenta;
    @Wire
    private Decimalbox nSaldo;
    
    private Textbox proveedor;
    private Textbox linea;
    private Textbox codpro;
    private Textbox unipro;
    private Textbox nompro;
    private Listbox lstdetalle;
    private Intbox tcompra;
    private Intbox tventa;
    private Intbox tsaldo;
    private Intbox tprincipal;
    private Intbox tsecundario;
    //modelo
    private ListModelList modeloalmacen;
    private ListModelList modelodetalle;
    //login
    private MenuPeriodo menuperiodo;
    private String user_login;
    final Execution exec = Executions.getCurrent();

    private void conectar() {
        Context ocontexto = Sesion.conectar();
        try {
            usuariodao = (UsuarioRemote) ocontexto.lookup("UsuarioBean/remote");
            regsalidadao = (RegSalidaRemote) ocontexto.lookup("RegSalidaBean/remote");
            regentradadao = (RegEntradaRemote) ocontexto.lookup("RegEntradaBean/remote");
            productodao = (ProductoRemote) ocontexto.lookup("ProductoBean/remote");
            movimientosdao = (MovimientosRemote) ocontexto.lookup("MovimientosBean/remote");
            periododao = (PeriodoRemote) ocontexto.lookup("PeriodoBean/remote");

        } catch (NamingException ex) {
            ex.printStackTrace();
        }
    }

    public void onCreate() {
        conectar();
        initcomponentes();

    }

    private void initcomponentes() {
        user_login = exec.getUserPrincipal().getName();
        usuario = usuariodao.buscarLogin(user_login);

        HtmlMacroComponent macro = (HtmlMacroComponent) getFellow("mperiodo");
        menuperiodo = (MenuPeriodo) macro.getChildren().get(0);
        menuperiodo.setPeriodolistener(this);

        cboalmacen = (Combobox) getFellow("cboalmacen");
        codpro = (Textbox) getFellow("codpro");
        nompro = (Textbox) getFellow("nompro");
        unipro = (Textbox) getFellow("unipro");
        proveedor = (Textbox) getFellow("proveedor");
        linea = (Textbox) getFellow("linea");
        lstdetalle = (Listbox) getFellow("lstdetalle");
        tcompra = (Intbox) getFellow("tcompra");
        tventa = (Intbox) getFellow("tventa");
        tsaldo = (Intbox) getFellow("tsaldo");
        tprincipal=(Intbox) getFellow("tprincipal");
        tsecundario=(Intbox) getFellow("tsecundario");

        modelodetalle = new ListModelList();
        lstdetalle.setModel(modelodetalle);

        modeloalmacen = new ListModelList(usuariodao.listaalmacen(usuario.getClogin()));
        cboalmacen.setModel(modeloalmacen);

        if (modeloalmacen.size() > 0) {
            cboalmacen.onInitRender(new Event("", cboalmacen));
            cboalmacen.close();
            cboalmacen.setSelectedIndex(0);
        }
        cboalmacen.addEventListener(Events.ON_SELECT, new EventListener() {
            @Override
            public void onEvent(Event arg0) throws Exception {
                codpro.focus();
                codpro.setReadonly(false);
            }
        });

        lstdetalle.addEventListener(Events.ON_SELECT, new EventListener() {
            @Override
            public void onEvent(Event arg0) throws Exception {
                mostrarmovimiento();
            }
        });
        lstdetalle.addEventListener(Events.ON_OK, new EventListener() {
            @Override
            public void onEvent(Event arg0) throws Exception {
                cargarDocumento();
            }
        });

        this.addEventListener(Events.ON_CTRL_KEY, new EventListener() {
            @Override
            public void onEvent(Event arg0) throws Exception {
                final int keycode = ((KeyEvent) arg0).getKeyCode();
                if (keycode == KeyEvent.DOWN || keycode == KeyEvent.UP) {
                    int _lastSelectedIndex = lstdetalle.getSelectedIndex();
                    if (_lastSelectedIndex >= 0) {
                        final int index = Math.min(modelodetalle.size() - 1, _lastSelectedIndex);
                        lstdetalle.setSelectedIndex(index);
                    }
                }
            }
        });

       codpro.focus();
       codpro.setReadonly(false);
    }

    public void mostrarmovimiento() {

    }

    @Override
    public void validar() {
        cboalmacen.getValue();
        if (producto == null) {
            codpro.focus();
            throw new MiException("Debe buscar un Producto");
        }
    }

    private void cargarMovimientos() {
        validar();
        if(usuario.getIdtipo().getIdtipo().contains(TipoUsuario.CLIENTE.getIdtipo())){
            throw new MiException("Operacion no permitida");
        }
        if(usuario.getIdtipo().getIdtipo().contains(TipoUsuario.PROVEEDOR.getIdtipo())){
            throw new MiException("Operacion no permitida");
        }
        Almacen almacen = (Almacen) modeloalmacen.getElementAt(cboalmacen.getSelectedIndex());        
        List<Kardex> listakardex = movimientosdao.listaKardex(almacen.getIdalmacen(), codpro.getText(),periodo.getIdperiodo());
        modelodetalle = new ListModelList(listakardex);
        lstdetalle.setModel(modelodetalle);
        TotalKardex total=movimientosdao.busquedaKardex(almacen.getIdalmacen(),codpro.getText() , periodo.getIdperiodo());
        Integer ncompra=0;
        Integer nventa=0;
        for(Kardex k:listakardex){
            ncompra=ncompra+k.getNcompra();
            nventa=nventa+k.getNventa();
        }
        tcompra.setValue(ncompra);
        tventa.setValue(nventa);
        tsaldo.setValue(total.getNstock());
        tsecundario.setValue(total.getNstksimon());
        tprincipal.setValue(total.getNstkfisico()-total.getNstksimon());
        lstdetalle.onInitRender();
        if (modelodetalle.size() > 0) {
            lstdetalle.setSelectedIndex(0);
            lstdetalle.getSelectedItem().focus();
        }
        else{
            nompro.focus();
        }
    }

    public void buscarProducto() {
        Almacen almacen = (Almacen) modeloalmacen.getElementAt(cboalmacen.getSelectedIndex());
        Existencias existencia;
        if (codpro.getValue().isEmpty()) {
            try {
                Window winbuscaprod = (Window) Executions.createComponents("/modulos/modherramientas/util/buscaexistencia.zul", null, null);
                winbuscaprod.setAttribute("IDALMACEN", almacen.getIdalmacen());
                winbuscaprod.setAttribute("REST", true);
                winbuscaprod.doModal();
                Boolean rest = (Boolean) winbuscaprod.getAttribute("REST");
                if (rest) {
                    Listbox lstexistencia = (Listbox) winbuscaprod.getFellow("lstexistencia");
                    ListModel modelobuscado = lstexistencia.getModel();
                    existencia = (Existencias) modelobuscado.getElementAt(lstexistencia.getSelectedIndex());
                    producto=existencia.getProducto();
                    mostrarProducto(producto);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } else {
            producto = productodao.buscarProducto(codpro.getText());
            mostrarProducto(producto);            
        }
    }
    private void cargarDocumento(){
        Almacen alm=(Almacen) modeloalmacen.getElementAt(cboalmacen.getSelectedIndex());
        Kardex kar= (Kardex) modelodetalle.getElementAt(lstdetalle.getSelectedIndex());
        if(kar.getCtipmov().contains("S"))
        {
            Regsalida regsalida=regsalidadao.buscarSalida(alm.getIdunineg().getIdunineg(),kar.getNregsalida());
            if(regsalida.getIddocumento().getIddocumento().contains(Documento.BOLETA.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultaboletakardex.zul",null, null);
                win.setClosable(true);
                win.setAttribute("UNIDAD", alm.getIdunineg().getIdunineg());
                win.setAttribute("SERIE", regsalida.getCserfac());
                win.setAttribute("NUMERO",regsalida.getCnumfac());
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(regsalida.getIddocumento().getIddocumento().contains(Documento.FACTURA.getIddocumento())||regsalida.getIddocumento().getIddocumento().contains(Documento.FACTURA_GUIA.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultafacturakardex.zul",null, null);
                win.setClosable(true);
                win.setAttribute("UNIDAD", alm.getIdunineg().getIdunineg());
                win.setAttribute("SERIE", regsalida.getCserfac());
                win.setAttribute("NUMERO",regsalida.getCnumfac());
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if(regsalida.getIddocumento().getIddocumento().contains(Documento.GUIA.getIddocumento()))
            {
                Window win =(Window) Executions.createComponents("/modulos/modherramientas/consulta/consultaguiakardex.zul",null, null);
                win.setClosable(true);
                win.setAttribute("UNIDAD", alm.getIdunineg());
                win.setAttribute("SERIE", regsalida.getCsergui());
                win.setAttribute("NUMERO",regsalida.getCnumgui());
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        else
        {
            Regentrada regentrada=regentradadao.buscarEntrada(alm.getIdalmacen(),kar.getNregentrada());
            if(regentrada instanceof Compra){
                Window win = (Window) Executions.createComponents("/modulos/modherramientas/consulta/detalleingreso.zul", null, null);
                win.setClosable(true);
                Compra oc = (Compra) regentrada;
                win.setAttribute("OC", oc);
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else if(regentrada instanceof Canje){
                Window win = (Window) Executions.createComponents("/modulos/modherramientas/consulta/detallecanje.zul", null, null);
                win.setClosable(true);
                Canje cj = (Canje) regentrada;
                win.setAttribute("CJ", cj);
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else if(regentrada instanceof Devolucion){
                Window win = (Window) Executions.createComponents("/modulos/modherramientas/consulta/detalledevolucion.zul", null, null);
                win.setClosable(true);
                Devolucion dev =(Devolucion) regentrada;
                win.setAttribute("DEVOLUCION", dev);
                try {
                    win.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else
            {
                Window winingreso = (Window) Executions.createComponents("/modulos/modalmacen/consulta/consultaingreso.zul", null, null);
                 winingreso.setClosable(true);
                 winingreso.setAttribute("REGENTRADA",regentrada);
                try {
                    winingreso.doModal();
                } catch (InterruptedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SuspendNotAllowedException ex) {
                    Logger.getLogger(ConsultaKardex.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    private void mostrarProducto(Producto prod) {
        codpro.setReadonly(true);
        codpro.setText(prod.getIdproducto());
        nompro.setText(prod.getCnomart());
        unipro.setText(prod.getIdunimed().getCabrev());
        proveedor.setText(prod.getIdsublinea().getIdlinea().getIdproveedor().getCnomprove().trim());
        linea.setText(prod.getIdsublinea().getIdlinea().getCnomlinea().trim());
        ////
        Almacen almacen = (Almacen) modeloalmacen.getElementAt(cboalmacen.getSelectedIndex());
        menuperiodo.setLista(periododao.lista(almacen.getIdunineg().getIdempresa().getIdempresa()));

        Calendar calendario = Calendar.getInstance();
        calendario.setTime(new Date());
        Integer año = calendario.get(Calendar.YEAR);
        Integer mes = calendario.get(Calendar.MONTH) + 1;

        periodo = periododao.buscar(almacen.getIdunineg().getIdempresa().getIdempresa(), año.toString(), mes.toString());
        menuperiodo.setPeriododefecto(periodo);
    }

    public void limpiar() {
        codpro.setReadonly(false);
        codpro.setText("");
        nompro.setText("");
        unipro.setText("");
        proveedor.setText("");
        linea.setText("");
        modelodetalle.clear();
        tcompra.setValue(0);
        tventa.setValue(0);
        tsaldo.setValue(0);
        tprincipal.setValue(0);
        tsecundario.setValue(0);
        producto = new Producto();
        codpro.focus();

    }
    public void imprimirdetalle(String ruta) throws InterruptedException{
        validar();
        if(modelodetalle.size()>0)
        {
            Almacen a = (Almacen) modeloalmacen.getElementAt(cboalmacen.getSelectedIndex());
            Jasperreport rptinventario = (Jasperreport) getFellow("reporte");
            Proveedor p = producto.getIdsublinea().getIdlinea().getIdproveedor();
            HashMap parametro = new HashMap();
            parametro.put("EMPRESA", a.getIdunineg().getIdempresa().getCnombre());
            parametro.put("USUARIO", usuario.getCnombre());
            parametro.put("RUTA", a.getIdunineg().getIdempresa().getClogo());
            parametro.put("UNIDADNEGOCIO", a.getIdunineg().getCnomuni());
            parametro.put("IDPROVEEDOR", p.getIdproveedor() + "  " + p.getCnomprove());
            parametro.put("ALMACEN", a.getNomalmacen());
            parametro.put("MES", "KARDEX FISICO "+ Mes.getMes(periodo.getCmes())+" - "+periodo.getCaño());
            parametro.put("MES2", "KARDEX FISICO/VALORIZADO AL MES DE "+ Mes.getMes(periodo.getCmes()));
            parametro.put("CODART", producto.getIdproducto());
            parametro.put("TCOMPRA", tcompra.getValue());
            parametro.put("TVENTA", tventa.getValue());
            parametro.put("TSALDO", tsaldo.getValue());
            parametro.put("UNIART", producto.getIdunimed().getCabrev());
            parametro.put("DESART", producto.getCnomart());
            parametro.put("LINEA", producto.getIdsublinea().getIdlinea().getCnomlinea());
            JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modelodetalle.getInnerList());
            try {
                rptinventario.setSrc(ruta);
                rptinventario.setDatasource(data);
                rptinventario.setParameters(parametro);
                rptinventario.setType("pdf");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else
            Messagebox.show("No hay datos para mostrar");
        
    }

    public void imprimir() throws InterruptedException {
        imprimirdetalle("/modulos/modherramientas/reporte/consultakardex.jasper");
    }
    public void imprimirValorizado() throws InterruptedException {
        imprimirdetalle("/modulos/modherramientas/reporte/consultakardexvalorizado.jasper");
    }

    @Override
    public void escribir(Periodo periodo) {
        this.periodo = periodo;
        cargarMovimientos();

    }
    public void exportar() {
        validar();
        Jasperreport rptreporte = (Jasperreport) getFellow("reporte");
        rptreporte.setSrc("/modulos/modherramientas/reporte/consultakardexxls.jasper");
        HashMap parametro = new HashMap();
        JRBeanCollectionDataSource data = new JRBeanCollectionDataSource(modelodetalle);
        try {
            rptreporte.setDatasource(data);
            rptreporte.setParameters(parametro);
            rptreporte.setType("xls");
        } catch (Exception e) {
            throw new MiException(e.getCause().getMessage());
        }
    }

    @Override
    public void escribir(Periodo periodo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
