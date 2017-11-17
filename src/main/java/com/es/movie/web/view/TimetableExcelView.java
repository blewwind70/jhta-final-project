package com.es.movie.web.view;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.es.movie.vo.SelectTimetable;

public class TimetableExcelView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Date date = (Date) model.get("dates");
		List<SelectTimetable> selectTimetables = (List<SelectTimetable>) model.get("selectTimetables");
		Sheet sheet = workbook.createSheet("��ȭ�ð�ǥ ��ȸ");
		
		
		
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("��¥");
		headerRow.createCell(1).setCellValue("�󿵰�");
		headerRow.createCell(2).setCellValue("ȸ��");
		headerRow.createCell(3).setCellValue("��ȭ��");
		headerRow.createCell(4).setCellValue("���۽ð�");
		headerRow.createCell(5).setCellValue("����ð�");
		headerRow.createCell(6).setCellValue("��ü�¼�");
		
		int rowCount = 1;
		for(SelectTimetable table : selectTimetables) {
			Row dataRow = sheet.createRow(rowCount++);
			dataRow.createCell(0).setCellValue(date);
			dataRow.createCell(1).setCellValue(table.getScreenName());
			dataRow.createCell(2).setCellValue(table.getOrdered());
			dataRow.createCell(3).setCellValue(table.getTitle());
			dataRow.createCell(4).setCellValue(table.getStartedAt());
			dataRow.createCell(5).setCellValue(table.getEndedAt());
			dataRow.createCell(6).setCellValue(table.getSeatsCount());
		}
		
		response.setHeader("Content-Disposition", "filename='MovieTimetable.xlsx'");
		workbook.write(response.getOutputStream());
		
		
		
		
	}
	
	
}
