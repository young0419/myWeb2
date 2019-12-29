package memberone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDAO {

	private Connection getConnection() {
		Connection conn = null;
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("Connection 생성 실패");
		}
		
		return conn;
	}
	
	public boolean idCheck(String id) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from student where id = ? ";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) result = false;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs != null) rs.close();}catch(SQLException sqle) {}
			try {if(pstmt != null) pstmt.close();}catch(SQLException sqle) {}
			try {if(conn != null) conn.close();}catch(SQLException sqle) {}
		}
		return result;
	}
	
	public Vector<ZipCodeVO> zipcodeRead(String dong){
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from zipcode where dong like '" + dong + "%'";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ZipCodeVO vo = new ZipCodeVO();
				vo.setZipcode(rs.getString("zipcode"));
				vo.setSido(rs.getString("sido"));
				vo.setGugun(rs.getString("gugun"));
				vo.setDong(rs.getString("dong"));
				vo.setRi(rs.getString("ri"));
				vo.setBunji(rs.getString("bunji"));
				vecList.addElement(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(rs != null) rs.close();}catch (SQLException e) {}
			try {if(pstmt != null) pstmt.close();}catch (SQLException e) {}
			try {if(conn != null) conn.close();}catch (SQLException e) {}
		}		
		return vecList;
	}
	
	public boolean memberInsert(StudentVO vo) {
		boolean flag = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into student values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println(vo.getName());
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPw());
				pstmt.setString(3, vo.getName());
				pstmt.setString(4, vo.getPhone1());
				pstmt.setString(5, vo.getPhone2());
				pstmt.setString(6, vo.getPhone3());
				pstmt.setString(7, vo.getEmail());
				pstmt.setString(8, vo.getZipcode());
				pstmt.setString(9, vo.getAddress1());
				pstmt.setString(10, vo.getAddress2());
			int count = pstmt.executeUpdate();
			if(count > 0) flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {if(pstmt != null) pstmt.close();}catch (SQLException e) {}
			try {if(conn != null) conn.close();}catch (SQLException e) {}
		}
		return flag;
	}
}
