package com.waio.excel;
 
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.springframework.web.servlet.view.document.AbstractExcelView;
 
/**
 * This class builds an Excel spreadsheet document using Apache POI library.
 * @author www.codejava.net
 *
 */
public class ExcelBuilder extends AbstractExcelView {
 
    @Override
    protected void buildExcelDocument(Map<String, Object> model,
            HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        // get data model which is passed by the Spring container
        List<?> listBooks = (List<?>) model.get("profileList");
        @SuppressWarnings("rawtypes")
		Class clazz = (Class)model.get("clazz");
        String sheetName = (String) model.get("sheetName");
         
        // create a new Excel sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        sheet.setDefaultColumnWidth(30);
         
        // create style for header cells
        CellStyle style = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        style.setFillPattern(CellStyle.SOLID_FOREGROUND);
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setColor(HSSFColor.BLACK.index);
        style.setFont(font);
         
        // create header row
        List<String> columns = inspect(clazz);
        
        int headerCount=0;
        HSSFRow header = sheet.createRow(0);
        for(String col : columns){
        	
            header.createCell(headerCount).setCellValue(col.toUpperCase());
            header.getCell(headerCount).setCellStyle(style);
            headerCount++;
        }
        sheet.createFreezePane(0,1);
        // create data rows
        int rowCount = 1;
         
        for (Object aBook : listBooks) {
            HSSFRow aRow = sheet.createRow(rowCount++);
           writeData(aRow, clazz, aBook, columns);
        }  
    }
    
    private void writeData(HSSFRow aRow, Class<?> clazz, Object obj,
			List<String> columnList) throws Exception{
		int col = 0;
		 for (PropertyDescriptor pd : Introspector.getBeanInfo(clazz).getPropertyDescriptors()) {
				if (pd.getReadMethod() != null && !"class".equals(pd.getName())) {
					for (String s : columnList) {
						if (pd.getName().equalsIgnoreCase(s) && pd.getReadMethod().invoke(obj)!=null) {
							aRow.createCell(col++).setCellValue(pd.getReadMethod().invoke(obj).toString());
						}
					}
				}
			}
	}
    static List<String> inspect(Class<?> clazz) throws IntrospectionException {
		List<String> listOfFields = new ArrayList<String>();
		for (PropertyDescriptor pd : Introspector.getBeanInfo(clazz).getPropertyDescriptors()) {
			if (pd.getReadMethod() != null && !"class".equals(pd.getName())) {
				listOfFields.add(pd.getName());
			}
		}
		return listOfFields;
	}
    static List<String> inspect11(Class<?> klazz) {
    	List<String> listOfFields = new ArrayList<String>(); 
        Field[] fields = klazz.getDeclaredFields();
       // System.out.printf("%d fields:%n", fields.length);
        for (Field field : fields) {
        	listOfFields.add(field.getName());
        	//System.out.println(field.getName());
            /*System.out.printf("%s %s %s%n",
                Modifier.toString(field.getModifiers()),
                field.getType().getSimpleName(),
                field.getName()
            );*/
        }
        return listOfFields;
    }
}