package modmantenimiento.util;

import com.zarcillo.domain.Periodo;
import java.util.ArrayList;
import java.util.List;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Image;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Window;


public class MenuPeriodo extends Window {
    //objetos
    private PeriodoListener periodolistener;
    private Periodo periododefecto;
    //controles
    private Image imganterior;
    private Image imgsiguiente;
    private Combobox cboperiodo;
    //modelos
    private ListModelList modeloperiodo;
    //variables
    private List<Periodo> lista=new ArrayList<Periodo>();
    private int index =-1;

    public MenuPeriodo() {

    }

    public void onCreate() {
        initcomponentes();
    }

    private void initcomponentes() {
        imganterior=(Image)getFellow("imganterior");
        imgsiguiente=(Image)getFellow("imgsiguiente");
        cboperiodo=(Combobox)getFellow("cboaño");

        cboperiodo.addEventListener(Events.ON_SELECT,new EventListener() {
            @Override
            public void onEvent(Event arg0) throws Exception {
                int index=cboperiodo.getSelectedIndex();
                move(index);
            }
        });
    }

    private void move(int idx){
        periodolistener.validar();
        int elementos=this.getLista().size();

        if(elementos==0){
            index=-1;
            return;
        }

        if(idx<0){
            index=0;
        }else if(idx>=elementos){
            index=elementos-1;
        }else{
            index=idx;
        }

        Periodo periodo=(Periodo) this.getLista().get(index);
        cboperiodo.setSelectedIndex(index);
        periodolistener.escribir(periodo);
    }

    public void anterior(){
        move(index+1);
    }

    public void siguiente(){
        move(index-1);
    }

    public List getLista() {
        return lista;
    }

    public void setLista(List lista) {
        this.lista = lista;
        modeloperiodo=new ListModelList(lista);
        cboperiodo.setModel(modeloperiodo);
        cboperiodo.onInitRender(new Event("",cboperiodo));
    }

    public PeriodoListener getPeriodolistener() {
        return periodolistener;
    }

    public void setPeriodolistener(PeriodoListener periodolistener) {
        this.periodolistener = periodolistener;
    }

    public Periodo getPeriododefecto() {
        return periododefecto;
    }

    public void setPeriododefecto(Periodo periododefecto) {
        this.periododefecto = periododefecto;
        index=lista.indexOf(periododefecto);
        move(index);
    }
}
