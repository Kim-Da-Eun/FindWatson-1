package findwatson.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import findwatson.configuration.Configuration;
import findwatson.review.dao.ReviewDAO;
import findwatson.review.dao.ReviewFileDAO;
import findwatson.review.dto.ReviewDTO;
import findwatson.review.dto.ReviewFileDTO;

@WebServlet("*.re")
public class reviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter pwriter = response.getWriter();
		ReviewDAO dao = ReviewDAO.getInstance();
		ReviewFileDAO fDao = ReviewFileDAO.getInstance();
		
		String ipAddr = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String cmd = requestURI.substring(contextPath.length());
		System.out.println("cmd : " + cmd);
		
		if(cmd.contentEquals("/search/imgUpload.re")) {//�����ۼ��� ���� ���ε�
			String repositoryName = "reviewImg";
			String uploadPath = request.getServletContext().getRealPath("/" + repositoryName);
			System.out.println(uploadPath);
			File uploadFilePath = new File(uploadPath);
			if(!uploadFilePath.exists()) {
				uploadFilePath.mkdir();
			}
			
			int maxSize = 1024 * 1024 * 100;
			MultipartRequest multi = new MultipartRequest(request,uploadPath, maxSize,"UTF-8",new DefaultFileRenamePolicy());
			
			String fileName = multi.getFilesystemName("reviewImg");
			String oriFileName = multi.getOriginalFileName("reviewImg");
			System.out.println("���� ���� �̸� : " + oriFileName);
			System.out.println("���� ���� �̸� : " + fileName);
			
			try {
				fDao.insert(new ReviewFileDTO(0, 7777, fileName, oriFileName));//�Խñ۽ù��� �ȳ־ �ɰŰ���
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
			//������ ����� �̹����� ��� 
			String imgPath = "../" + repositoryName + "/" + fileName;
			System.out.println(imgPath);
			
			JsonObject jObj = new JsonObject();
			jObj.addProperty("imgPath", imgPath);
			pwriter.append(jObj.toString());
		}else if(cmd.contentEquals("/search/reviewWrite.re")){ //�����ۼ�
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			try {
				dao.insert(new ReviewDTO(0,7777,5,title,content,"�޹���", "test", null, ipAddr, 0 , 0));
				response.sendRedirect("hospitalSearchDetail2.re");
				
			}catch(Exception e){
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
		}else if(cmd.contentEquals("/search/hospitalSearchDetail2.re")) { //�����Ϻ�2��������
			try {               
				int cpage = 1;
				String cpageInput = request.getParameter("cpage");
				if(cpageInput != null) {
					cpage = Integer.parseInt(request.getParameter("cpage"));
				}
				String navi = dao.getPageNavi(cpage, 7777);
				request.setAttribute("cpage", cpage);
				request.setAttribute("navi", navi); //�׺�� �ѱ��
				
				//����Ʈ �߶� �ѱ��
				int startRecord = cpage*Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
				int endRecord = cpage*Configuration.recordCountPerPage;
				
				List<ReviewDTO> reviewList = dao.selectByPage(startRecord, endRecord);
				request.setAttribute("reviewList", reviewList);
				request.getRequestDispatcher("hospitalSearchDetail2.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect(contextPath + "error.jsp");
			}
		}else {
			response.sendRedirect(contextPath+"/error.jsp");
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
