package org.zkoss.zarcillo;

import com.zarcillo.service.ExceptionZarcillo;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Locale;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.zkoss.exporter.excel.ExcelExporter;
import org.zkoss.util.media.AMedia;
import org.zkoss.zul.Filedownload;

public class ExportarPdf {

    public static void exportJasperToPdf(String cnombrepdf, JRBeanCollectionDataSource data, HashMap parametro,String ruta) {
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ExportarPdf exportarPdf = new ExportarPdf();
            parametro.put(JRParameter.REPORT_LOCALE,new Locale("es", "US"));
            InputStream is = exportarPdf.getClass().getClassLoader().getResourceAsStream(ruta);            
            JasperPrint jasperprint = JasperFillManager.fillReport(is, parametro, data);
            JasperExportManager.exportReportToPdfStream(jasperprint, out);
            AMedia amedia = new AMedia(cnombrepdf+".pdf", "pdf", "application/file", out.toByteArray());
            Filedownload.save(amedia);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }
}
