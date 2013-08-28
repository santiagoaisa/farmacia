package org.zkoss.zarcillo;

import com.zarcillo.service.ExceptionZarcillo;
import java.io.ByteArrayOutputStream;
import org.zkoss.exporter.excel.ExcelExporter;
import org.zkoss.util.media.AMedia;
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;

/**
 *
 * @author saisa
 */
public class ExportarHojaCalculo {

    public static void exportListboxToExcel(Listbox listbox, String cnombrehoja) {
        try {
            ExcelExporter exporter = new ExcelExporter();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            exporter.export(listbox, out, cnombrehoja);
            AMedia amedia = new AMedia(cnombrehoja + ".xlsx", "xls", "application/file", out.toByteArray());
            Filedownload.save(amedia);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }

    public static void exportDataModelToExcel(String[] headers, String[] fields, ListModelList dataModel, String cnombrehoja) {
        try {
            ExcelExporter exporter = new ExcelExporter();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            exporter.export(headers, fields, dataModel, out, cnombrehoja);
            AMedia amedia = new AMedia(cnombrehoja + ".xlsx", "xls", "application/file", out.toByteArray());
            Filedownload.save(amedia);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionZarcillo(e.getMessage());
        }
    }
}
