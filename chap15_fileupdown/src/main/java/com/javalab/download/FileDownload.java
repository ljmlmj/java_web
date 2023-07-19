package com.javalab.download;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 이미지 파일 다운로드 서블릿
 */
@WebServlet("/download.do")
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 인코딩 설정
		request.setCharacterEncoding("utf-8");
		
		// 다운로드를 요청한 파일명 추출
		String filePath = request.getParameter("file");
		
		// 전달받은 파일 경로에서 파일명 추출
		String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
		
		// 클라이언트로 내려보낼 컨텐트의 타입 설정
		response.setContentType("application/octet-stream");
		
		// 웹브라우저가 파일을 캐싱하지 않도록 설정
		response.setHeader("Cache-Control", "no-cache");
		
		// 파일을 다운로드 전에 브라우저에 응답 헤더에 정보 전달
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		// 현재 어플리케이션의 컨텍스트 패스 [필요시]
		String contextPath = request.getContextPath();
		
		// 현재 어플리케이션의 컨텍스트 객체 얻기
		ServletContext context = this.getServletContext();
		
		// 내려받을 파일의 풀 경로 (파일명 포함)
		String inputFilePath = context.getRealPath("/upload" + "/" + fileName);
		
		System.out.println("[디버깅] inputFilePath : " + inputFilePath);
		
		InputStream inputStream = null;		// 파일 read inputStream
		OutputStream outputStream = null;	// 파일 write outputStream
		
		try {
			// 읽어들일 파일을 위한 InputStream 객체 생성
			inputStream = new FileInputStream(inputFilePath);
			
			// 응답으로 전달할 output stream 열기
			outputStream = response.getOutputStream();
			
			// 파일 내려받기
			byte[] buffer = new byte[1024];
			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outputStream.write(buffer, 0, bytesRead);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			inputStream.close();
			outputStream.close();
		}
	}

}
