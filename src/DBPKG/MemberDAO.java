package DBPKG;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	public static Connection getConnection() throws SQLException{
		String jdbc_driver = "oracle.jdbc.OracleDriver";
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName(jdbc_driver);
			Connection conn = DriverManager.getConnection(db_url,"system","1234");
			return conn;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public String count() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String id = null;
		try {
			conn = getConnection();
			sql = "select count(*) from course_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return id;
	}
	
	public ArrayList<MemberVO> lectureList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> mvo = new ArrayList<MemberVO>();
		try {
			conn = getConnection();
			sql = "select idx, name from lecturer_tbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setIdx(rs.getString(1));
				vo.setLname(rs.getString(2));
				mvo.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		
		return mvo;
	}
	
	public ArrayList<MemberVO> memberList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<MemberVO> mvo = new ArrayList<MemberVO>();
		try {
			conn = getConnection();
			sql = "select a.id, a.name, a.credit, b.name, a.week, a.start_hour, a.end_end from course_tbl a join lecturer_tbl b on a.lecturer = b.idx order by a.id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getString(3));
				vo.setLname(rs.getString(4));
				vo.setWeek(rs.getString(5));
				vo.setStart_hour(rs.getString(6));
				vo.setEnd_end(rs.getString(7));
				mvo.add(vo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		
		return mvo;
	}
	
	public void insert(MemberVO vo) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(vo.getId()));
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3,Integer.parseInt(vo.getCredit()));
			pstmt.setString(4, vo.getLecturer());
			pstmt.setInt(5,Integer.parseInt( vo.getWeek()));
			pstmt.setInt(6,Integer.parseInt( vo.getStart_hour()));
			pstmt.setInt(7,Integer.parseInt( vo.getEnd_end()));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	
	public MemberVO readOne(String upd) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberVO vo = new MemberVO();
		try {
			conn = getConnection();
			sql = "select * from course_tbl where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,upd);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setCredit(rs.getString(3));
				vo.setLecturer(rs.getString(4));
				vo.setWeek(rs.getString(5));
				vo.setStart_hour(rs.getString(6));
				vo.setEnd_end(rs.getString(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
			if(rs!=null)rs.close();
		}
		return vo;
	}
	
	public void update(MemberVO vo) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "update course_tbl set id=?, name=?, credit=?, lecturer=?, week=?, start_hour=?, end_end=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, Integer.parseInt(vo.getCredit()));
			pstmt.setString(4, vo.getLecturer());
			pstmt.setInt(5, Integer.parseInt(vo.getWeek()));
			pstmt.setInt(6, Integer.parseInt(vo.getStart_hour()));
			pstmt.setInt(7, Integer.parseInt(vo.getEnd_end()));
			pstmt.setString(8, vo.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
	
	public void delete(String del) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			conn = getConnection();
			sql = "delete from course_tbl where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, del);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
	}
}
















