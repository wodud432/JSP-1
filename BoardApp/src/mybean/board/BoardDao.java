package mybean.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public BoardDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracleDB");
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	public void freeCon(){
		if(con != null) try{con.close();}catch(Exception err){}
		if(stmt != null) try{stmt.close();}catch(Exception err){}
		if(rs != null) try{rs.close();}catch(Exception err){}
	}
	
	// 글 리스트 가져오기(list.jsp)
	public Vector getBoardList(String keyField, String keyWord){
		Vector v = new Vector();
		String sql;
		try{
			con = ds.getConnection();
			if(keyWord == null || keyWord.isEmpty()){
				sql = "select * from tblBoard order by num desc";
			}
			else{
				sql = "select * from tblBoard where " + keyField + 
					" like '%" + keyWord + "%' order by num desc";
			}
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setContent(rs.getString("Content"));
				dto.setCount(rs.getInt("count"));
				dto.setDepth(rs.getInt("depth"));
				dto.setEmail(rs.getString("email"));
				dto.setHomepage(rs.getString("homepage"));
				dto.setIp(rs.getString("ip"));
				dto.setName(rs.getString("name"));
				dto.setNum(rs.getInt("num"));
				dto.setPass(rs.getString("pass"));
				dto.setPos(rs.getInt("pos"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				
				v.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getBoardList : " + err);
		}
		finally{
			freeCon();
		}
		
		return v;
	}
	
	// 글 저장하기
	public void insertBoard(BoardDto dto){
		String sql = "insert into tblBoard(num, name, email, homepage,"
			+ "subject, content, pos, depth, regdate, pass, count, ip) "
			+ "values(seq_num.nextVal, ?,?,?,?,?,0,0,sysdate,?,0,?)";
		
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getName());
			stmt.setString(2, dto.getEmail());
			stmt.setString(3, dto.getHomepage());
			stmt.setString(4, dto.getSubject());
			stmt.setString(5, dto.getContent());
			stmt.setString(6, dto.getPass());
			stmt.setString(7, dto.getIp());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("insertBoard : " + err);
		}
		finally{
			freeCon();
		}
	}
}
