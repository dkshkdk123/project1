package jsp.board.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardWriteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
				
		// 업로드 파일 사이즈
		int fileSize= 5*1024*1024;
		// 업로드될 폴더 경로
		String uploadPath = request.getServletContext().getRealPath("/UploadFolder");

		try {
			
			// 파일업로드 
			MultipartRequest multi = new MultipartRequest
					(request, uploadPath, fileSize, "euc-kr", new DefaultFileRenamePolicy());

			// 파일이름 가져오기
			String fileName = "";
			Enumeration<String> names = multi.getFileNames();
			if(names.hasMoreElements())
			{
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
			}
			
			BoardDAO dao = BoardDAO.getInstance();
			BoardBean borderData = new BoardBean();
			
			borderData.setBoard_num(dao.getSeq()); // 시퀀스값 가져와 세팅
			borderData.setBoard_id(multi.getParameter("board_id")); // 히든값
			borderData.setBoard_subject(multi.getParameter("board_subject"));
			borderData.setBoard_content(multi.getParameter("board_content"));
			borderData.setBoard_file(multi.getParameter("board_file"));
		
			boolean result = dao.boardInsert(borderData);
			
			if(result){
				forward.setRedirect(true);
				forward.setNextPath("BoardListForm.bo");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 작성 오류 : " + e.getMessage());
		}
		return forward;
	}
}
