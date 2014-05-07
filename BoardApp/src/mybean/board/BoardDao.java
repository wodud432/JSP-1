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
				sql = "select * from tblBoard";
			}
			else{
				sql = "select * from tblBoard where " + keyField + 
					" like '%" + keyWord + "%'";
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
}
