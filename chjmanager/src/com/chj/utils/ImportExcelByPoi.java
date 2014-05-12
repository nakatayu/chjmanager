package com.chj.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-12-30
 * Time: 下午5:05
 * To change this template use File | Settings | File Templates.
 */
public  class ImportExcelByPoi {

	/**
	 * POI:解析Excel文件中的数据并把每行数据封装成一个实体
	 *
	 * @param fis 文件输入流
	 * @return List<EmployeeInfo> Excel中数据封装实体的集合
	 */
	public static List<String> importControlsByPoi(InputStream fis) {
		//这里是解析出来的Excel的数据存放的List集合
		List<String> controls = new ArrayList<String>();
		try {
			//创建Excel工作薄
			HSSFWorkbook hwb = new HSSFWorkbook(fis);
			//得到第一个工作表
			HSSFSheet sheet = hwb.getSheetAt(0);
			HSSFRow row = null;
			//遍历该表格中所有的工作表，i表示工作表的数量 getNumberOfSheets表示工作表的总数
			for (int i = 0; i < hwb.getNumberOfSheets(); i++) {
				sheet = hwb.getSheetAt(i);
				//遍历该行所有的行,j表示行数 getPhysicalNumberOfRows行的总数
				for (int j = 1; j < sheet.getPhysicalNumberOfRows(); j++) {
					row = sheet.getRow(j);
					//此方法调用getCellValue(HSSFCell cell)对解析出来的数据进行判断，并做相应的处理
					if (ImportExcelByPoi.getCellValue(row.getCell(0)) != null && !"".equals(ImportExcelByPoi.getCellValue(row.getCell(0)))) {
						controls.add(String.valueOf(ImportExcelByPoi.getCellValue(row.getCell(0))));
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return controls;
	}

	//判断从Excel文件中解析出来数据的格式
	private static String getCellValue(HSSFCell cell) {
		String value = null;
		//简单的查检列类型
		switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_STRING://字符串
				value = cell.getRichStringCellValue().getString();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC://数字
				long dd = (long) cell.getNumericCellValue();
				value = dd + "";
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				value = "";
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				value = String.valueOf(cell.getCellFormula());
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN://boolean型值
				value = String.valueOf(cell.getBooleanCellValue());
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				value = String.valueOf(cell.getErrorCellValue());
				break;
			default:
				break;
		}
		return value;
	}

}
