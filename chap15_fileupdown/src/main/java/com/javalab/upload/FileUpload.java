package com.javalab.upload;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * [파일 업로드 처리 서블릿]
 * 실질적으로 파일을 서버에 저장해주는 역할 사용자가 업로드한 파일 데이터는
 * 일반적으로 input 태그를 통해 입력한 텍스트와는 다른 형태로 전송됩니다.
 * multipart/form-data라는 형태로 인코딩되어 전송되는데, 이를 다루려면
 * 많은 번거로움이 있습니다. 따라서 파일 업로드를 지원해주는 Apache의 오픈소스
 * 파일 업/다운 라이브러리를 사용해야 함.
 * 
 * [필요한 라이브러리]
 * 1. commons-fileupload-1.3.3.jar
 * 2. commons-io-2.6.jar
 * 
 * [enctype]
 * - enctype속성은 <form>태그의 데이터들을 전송할 때 데이터들을
 *   어떤 형식으로 변환할 것 인지에 대한 값을 지정
 * [multipart/form-data]
 * - 인코딩 타입이 여러가지 타입의 데이터를 한번에 모두 전송할 수 있다.
 * - 데이터를 바이너리(binary)형태로 전송
 */
@WebServlet("/upload.do")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String encoding = "utf-8";
		
		// 1. 현재 어플리케이션의 webapp 밑에 있는 upload 폴더
		String path = this.getServletContext().getRealPath("/upload");
		System.out.println("path : " + path);
		
		// 업로드 폴더 명
		File currentDirPath = new File(path);
		
		/*
		 * [업로드된 파일을 저장할 저장소와 관련된 클래스]
		 * 저장소에 임시파일을 생성할 한계 크기를 byte단위로 지정한다.
		 * 이 값을 1024로 지정한 경우 1024byte 이상의 파일을 업로드 했을 때
		 * 메모리에 있던 파일의 바이너리 데이터를 저장소에 임시파일로 잠시 저장.
		 * 이렇게 임시파일로 저장하는 이유는 대용량 파일을 업로드 했을 때 그만한 크기의
		 * 데이터를 웹어플리케이션이 동작하는 JVM 메모리상에 모두 로드하는 것은 부담이
		 * 되기 때문이다. 임시파일로 저장되었던 파일은 이 후에 FileItem#write()
		 * 메소드를 통해 실제 파일로 변경되거나 FileItem#delete()메소드를 통해 제거됨.
		 */
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		// 업로드 된 파일을 저장할 위치 지정
		factory.setRepository(currentDirPath);
		
		// 저장소에 임시파일을 생성할 한계 크기를 byte 단위로 지정
		factory.setSizeThreshold(1024 * 1024);
		
		/*
		 * [ServletFileUpload]
		 * 클래스는 HTTP 요청에 대한 HttpServletRequest
		 * 객체로부터 multipart/form-data 형식으로 넘어온 HTTP Body 부분을 다루기
		 * 쉽게 변환(parse)해주는 역할을 수행합니다. parseRequest()메소드를 
		 * 수행하면 FileItem이라는 형식으로 변환해줌.
		 */
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		try {
			/*
			 * [FileItem]
			 * 사용자가 업로드한 File 데이터나 input text에 입력한 일반 요청 텍스트 데이터에 대한 객체입니다.
			 * FileItem#isFormField() 메소드의 리턴값이 true이면 text 일반 입력 데이터이며,
			 * false이면 파일 데이터입니다.
			 * 즉, 리턴값이 false인 경우에만 업로드된 파일인 것으로 인지하여 처리.
			 * parseRequest() 메소드 : FileItem을 ArrayList에 담아줌
			 */
			List<FileItem> items = upload.parseRequest(request);
			for (int i=0; i< items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				
				if (fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString(encoding));
				} else {
					System.out.println("파라미터명 : " + fileItem.getFieldName());
					System.out.println("파일명 : " + fileItem.getName());
					System.out.println("파일크기 : " + fileItem.getSize() + " bytes");
					
					if (fileItem.getSize() > 0) {
						// 프로그램이 실행 중인 OS에 해당하는 구분자를 리턴합니다.
						String separator = System.getProperty("file.separator");
						System.out.println("fileItem.getName() : " + fileItem.getName());
						
						// 실제 파일명 추출
						String fileName = fileItem.getName();
						
						// 파일이 업로드될 곳의 풀경로를 갖는 File 객체 생성 (경로 + 파일명)
						File uploadFile = new File(currentDirPath + "\\" + fileName);
						System.out.println(currentDirPath + "\\" + fileName); 
						
						// 업로드된 파일을 저장소 디렉터리에 저장합니다. 파일 용량이 크면 임시파일로
						//저장했다가 파일 업로드가 완료되면 실제 파일명으로 변경합니다.
						// 개발자가 하지 않고 writer() 메소드 차원에서 지원해주는 기능.
						fileItem.write(uploadFile);
					}
				}
			}
			System.out.println("파일 업로드 완료");
			String contextPath = request.getContextPath();
			
			// 이미지 업로드 완료 후 이미지 목록 보기 서블릿 호출
			response.sendRedirect(contextPath + "/imageList.do");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
