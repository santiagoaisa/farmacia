package modmantenimiento.util;

import com.zarcillo.domain.Lote;
import com.zarcillo.domain.MotivoEntrada;
import com.zarcillo.domain.Usuario;
import com.zarcillo.service.LoteService;
import com.zarcillo.service.MotivoEntradaService;
import com.zarcillo.service.UsuarioService;
import java.text.DecimalFormat;
import javax.naming.NamingException;
import org.zkoss.zk.ui.Execution;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.select.SelectorComposer;
import org.zkoss.zk.ui.select.annotation.Listen;
import org.zkoss.zk.ui.select.annotation.VariableResolver;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.select.annotation.WireVariable;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Intbox;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Textbox;
import org.zkoss.zul.Window;

@VariableResolver(org.zkoss.zkplus.spring.DelegatingVariableResolver.class)
public class CreaLote extends SelectorComposer{
    
    private Lote lote=new Lote();
    private Usuario usuario;   
    private ListModelList modeloTipo;
    
    @Wire
    private Textbox txtLote;
    
    @Wire
    private Textbox txtObservacion;    
    
    @Wire
    private Intbox nLote;
    
    @Wire
    private Intbox nAño;
    
    @Wire
    private Intbox nMes;
    
    @Wire
    private Combobox cboTipo;
    
    @Wire
    private Button btnBloquear;    
    
    @Wire
    private Window winNlote;
    
        
    @WireVariable
    UsuarioService usuarioService;
    
    @WireVariable
    LoteService loteService;
    
    @WireVariable
    MotivoEntradaService motivoEntradaService;
    
        
    private String user_login;
    final Execution exec= Executions.getCurrent();
    
    
    
    @Listen("onCreate=window#winNlote")
    public void onCreate() throws NamingException {        
         initComponets();
     }
    
    @Listen("onClick = #btnBloquear")
    public void onAgregarNuevo(Event event) {
        bloquear();
    }  
    
    @Listen("onClick = #btnGrabar")
    public void onAgregarImprimir(Event event) {
        registrar();
    } 
     
    
    
    public void initComponets(){
        user_login = exec.getUserPrincipal().getName();
        usuario=usuarioService.buscarPorLogin(user_login);        
        modeloTipo=new ListModelList(motivoEntradaService.listaGeneral());
        cboTipo.setModel(modeloTipo);
        lote = (Lote) winNlote.getAttribute("LOTE");
        if (modeloTipo.size() > 0) {
            cboTipo.onInitRender(new Event("", cboTipo));
            cboTipo.close();
            cboTipo.setSelectedIndex(0);
        }
        if (lote == null) {
            lote = new Lote();
        } else {
            txtLote.setText(lote.getClote());
            nAño.setValue(Integer.valueOf(lote.getCfecven().substring(0,4)));
            nMes.setValue(Integer.valueOf(lote.getCfecven().substring(5,7)));
            nLote.setValue(lote.getNstock());
            if(lote.getCobservacion()!=null){
                if(lote.getCobservacion().isEmpty()){
                    txtObservacion.setText(lote.getCobservacion());
                }
                else{
                    txtObservacion.setText("-");
                }
            }
            else{
               txtObservacion.setText("-"); 
            }            
            cboTipo.setSelectedIndex(modeloTipo.indexOf(lote.getIdmotivo()));
            if(lote.getBbloqueado()){
                btnBloquear.setLabel("Desbloquear");
            }
            else{
                btnBloquear.setLabel("Bloquear");
            }
        }
    }    
    
    public void bloquear(){
        if(lote.getBbloqueado()){
            btnBloquear.setLabel("Bloquear");
            lote.setBbloqueado(false);
        }
        else{
            btnBloquear.setLabel("Desbloquear");
            lote.setBbloqueado(true);
        }
        loteService.actualizar(lote);
    }
    
    private void calculaAño(){
       nAño.setConstraint(new ConstraintAñoLote(4));
    }
    private void calculaMes(){
        nMes.setConstraint(new ConstraintMesLote());
    }
       
    private void validar() {
        cboTipo.setConstraint(new ConstraintCamposObligatorios());
        cboTipo.getValue();
        txtLote.getValue();
        nLote.getValue();
        calculaAño();
        calculaMes();
    }
    public void registrar() {
        DecimalFormat formato=new DecimalFormat("00");
        String numero=formato.format(nMes.getValue());
        validar();
        MotivoEntrada motivo=(MotivoEntrada) modeloTipo.getElementAt(cboTipo.getSelectedIndex());
        lote.setIdmotivo(motivo);
        lote.setClote(txtLote.getText());
        lote.setCfecven(nAño.getValue()+"-"+numero);
        lote.setNstock(nLote.getValue());
        lote.setIdusuario(usuario);
        lote.setCobservacion(txtObservacion.getText());
        winNlote.setAttribute("LOTE", lote);
        winNlote.onClose();
    }
}

