package jsp.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection
{
	public static Connection getConnection() throws SQLException, NamingException,
	ClassNotFoundException{
		Context initCtx = new InitialContext();
		//initCtx�� lookup�޼��带 �̿��ؼ� "java:comp/env" �� �ش��ϴ� ��ü��
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		//envCtx�� lookup�޼��带 �̿��ؼ� "jdbc/orcl"�� �ش��ϴ� ��ü�� ã�Ƽ�
		DataSource ds = (DataSource) envCtx.lookup("jdbc/oracle");
		//getConnection�޼��带 �̿��ؼ� Ŀ�ؼ� Ǯ�� ���� Ŀ�ؼ� ��ü�� ����
		Connection conn = ds.getConnection();
		return conn;
	}
}
