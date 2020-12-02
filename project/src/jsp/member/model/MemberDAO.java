package jsp.member.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import jsp.util.DBConnection;

public class MemberDAO
{
	private static MemberDAO instance;
	// 싱글톤 패턴
	private MemberDAO(){}
	public static MemberDAO getInstance(){
		if(instance==null)
			instance=new MemberDAO();
		return instance;
	}
	// String -> Date로 변경하는 메서드
	// 문자열로된 생년월일을 Date로 변경하기 위해 필요
	// java.util.Date클래스로는 오라클의 Date형식과 연동할 수 없다.
	// Oracle의 date형식과 연동되는 java의 Date는 java.sql.Date 클래스이다.
	public Date stringToDate(MemberBean member)
	{
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();
		Date birthday = Date.valueOf(year+"-"+month+"-"+day);
		return birthday;
	} // end stringToDate()
	// 회원정보를 JSP_MEMBER 테이블에 저장하는 메서드
	public void insertMember(MemberBean member)throws SQLException
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			// 쿼리 생성한다.
			// 가입일의 경우 자동으로 세팅되게 하기 위해 sysdate를 사용
			StringBuffer sql = new StringBuffer();
			sql.append("insert into MEMBER values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
			stringToDate(member);
			/*
			* StringBuffer에 담긴 값을 얻으려면 toString()메서드를
			* 이용해야 한다.
			*/
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();
			} catch (ClassNotFoundException | NamingException | SQLException sqle) {
			// 오류시 롤백
				conn.rollback();
				throw new RuntimeException(sqle.getMessage());
			} finally {
			// Connection, PreparedStatement를 닫는다.
				try{
					if ( pstmt != null ){ pstmt.close(); pstmt=null; }
					if ( conn != null ){ conn.close(); conn=null; }
				}catch(Exception e){
						throw new RuntimeException(e.getMessage());
				}
			}
	}
	public MemberBean getUserInfo(String id)
		{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			MemberBean member = null;
			try {
				// 쿼리
				System.out.println("id>>"+id); 
				StringBuffer query = new StringBuffer();
				query.append("SELECT * FROM MEMBER WHERE ID=?");
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(query.toString());
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if (rs.next()) // 회원정보를 DTO에 담는다.
				{
				// DB의 생년월일정보 -> 년, 월, 일로 문자열 자른다.
				String birthday = rs.getDate("birth").toString();
				String year = birthday.substring(0, 4);
				String month = birthday.substring(5, 7);
				String day = birthday.substring(8, 10);
				// 이메일을 @ 기준으로 자른다.
				String mail = rs.getString("mail");
				int idx = mail.indexOf("@");
				String mail1 = mail.substring(0, idx);
				String mail2 = mail.substring(idx+1);
				// 자바빈에 정보를 담는다.
				member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirthyy(year);
				member.setBirthmm(month);
				member.setBirthdd(day);
				member.setMail1(mail1);
				member.setMail2(mail2);
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setReg(rs.getTimestamp("reg"));
			}
			return member;
			
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
					throw new RuntimeException(e.getMessage());
			}
		}
	} // end getUserInfo
	public int loginCheck(String id, String pw)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
		int x = -1;
		try {
			// 쿼리 - 먼저 입력된 아이디로 DB에서 비밀번호를 조회한다.
			
			StringBuffer query = new StringBuffer();
			query.append("SELECT PASSWORD FROM MEMBER WHERE ID=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
			{
				dbPW = rs.getString("password"); // 비번을 변수에 넣는다.
				if (dbPW.equals(pw))
					x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
				else
					x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
			} else {
				x = -1; // 해당 아이디가 없을 경우
			}
			return x;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
				}
			}
		}
	public void updateMember(MemberBean member) throws SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			StringBuffer query = new StringBuffer(); System.out.println("address:"+member.getAddress());
			query.append("UPDATE MEMBER SET");
			query.append(" PASSWORD=?, MAIL=?, PHONE=?, ADDRESS=?");
			query.append(" WHERE ID=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(query.toString());
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getMail1()+"@"+member.getMail2());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getId());
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();
		} catch (Exception sqle) { 
			conn.rollback(); // 오류시 롤백
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstmt != null ){ pstmt.close(); pstmt=null; }
				if ( conn != null ){ conn.close(); conn=null; }
			}catch(Exception e){
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end updateMember
	
	@SuppressWarnings("resource")
	public int deleteMember(String id, String pw)
	{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
	int x = -1;
	try {
		// 비밀번호 조회
		StringBuffer query1 = new StringBuffer();
		query1.append("SELECT PASSWORD FROM MEMBER WHERE ID=?");
		// 회원 삭제
		StringBuffer query2 = new StringBuffer();
		query2.append("DELETE FROM MEMBER WHERE ID=?");
		conn = DBConnection.getConnection();
		// 자동 커밋을 false로 한다.
		conn.setAutoCommit(false);
		// 1. 아이디에 해당하는 비밀번호를 조회한다.
		pstmt = conn.prepareStatement(query1.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			dbpw = rs.getString("password");
			if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
			{
				// 같을경우 회원삭제 진행
				pstmt = conn.prepareStatement(query2.toString());
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				conn.commit();
				x = 1; // 삭제 성공
			} else {
				x = 0; // 비밀번호 비교결과 - 다름
			}
		}
		
		return x;
		
	} catch (Exception sqle) {
		try {
			conn.rollback(); // 오류시 롤백
		} catch (SQLException e) {
			e.printStackTrace();
		}
		throw new RuntimeException(sqle.getMessage());
	} finally {
		try{
			if ( pstmt != null ){ pstmt.close(); pstmt=null; }
			if ( conn != null ){ conn.close(); conn=null; }
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
			}
		}
	}
		public boolean duplicateIdCheck(String id)
		{
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			boolean x= false;
			
			try {
				// 쿼리
				StringBuffer query = new StringBuffer();
				query.append("SELECT ID FROM MEMBER WHERE ID=?");
				conn = DBConnection.getConnection();
				pstm = conn.prepareStatement(query.toString());
				pstm.setString(1, id);
				rs = pstm.executeQuery();
				if(rs.next()) x= true; //해당 아이디 존재
				return x;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try{
				if ( pstm != null ){ pstm.close(); pstm=null; }
				if ( conn != null ){ conn.close(); conn=null; }
		}catch(Exception e){
			throw new RuntimeException(e.getMessage());
		}
	} // end insertMember()
}
}

		
