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
				
		// ���ε� ���� ������
		int fileSize= 5*1024*1024;
		// ���ε�� ���� ���
		String uploadPath = request.getServletContext().getRealPath("/UploadFolder");

		try {
			
			// ���Ͼ��ε� 
			MultipartRequest multi = new MultipartRequest
					(request, uploadPath, fileSize, "euc-kr", new DefaultFileRenamePolicy());

			// �����̸� ��������
			String fileName = "";
			Enumeration<String> names = multi.getFileNames();
			if(names.hasMoreElements())
			{
				String name = names.nextElement();
				fileName = multi.getFilesystemName(name);
			}
			
			BoardDAO dao = BoardDAO.getInstance();
			BoardBean borderData = new BoardBean();
			
			borderData.setBoard_num(dao.getSeq()); // �������� ������ ����
			borderData.setBoard_id(multi.getParameter("board_id")); // ���簪
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
			System.out.println("�� �ۼ� ���� : " + e.getMessage());
		}
		return forward;
	}
}
