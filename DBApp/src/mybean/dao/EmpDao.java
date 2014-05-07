package mybean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mybean.dbcp.DBConnectionMgr;
import mybean.dto.EmpDto;

public class EmpDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DBConnectionMgr pool;
	
	// DB 연결
	public EmpDao(){
		try{
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception err){
			System.out.println("DB연결 실패 : " + err);
		}
	}
	
	// index.jsp
	public List getList(String search, String searchText){
		ArrayList list = new ArrayList();
		String sql;
		
		try{
			con = pool.getConnection();
			if(searchText == null || searchText.isEmpty()){
				sql = "select * from tblsawon";
			}
			else{
				sql = "select * from tblsawon where " + search + 
					" like '%" + searchText + "%'";
			}
			
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				EmpDto dto = new EmpDto();
				dto.setAddr(rs.getString("addr"));
				dto.setAge(rs.getInt("age"));
				dto.setDept(rs.getString("dept"));
				dto.setExt(rs.getString("ext"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPass(rs.getString("pass"));
				
				list.add(dto);
			}
		}
		catch(Exception err){
			System.out.println("getList() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return list;
	}
	
	// 사원 추가
	public void addSawon(EmpDto dto){
		String sql = "insert into tblsawon(no, id, name, pass, age, addr, " +
				"ext, dept) values(seq_no.nextVal,?,?,?,?,?,?,?)";
		try{
			con = pool.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getId());
			stmt.setString(2, dto.getName());
			stmt.setString(3, dto.getPass());
			stmt.setInt(4, dto.getAge());
			stmt.setString(5, dto.getAddr());
			stmt.setString(6, dto.getExt());
			stmt.setString(7, dto.getDept());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("addSawon() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	// 사원 수정
	public EmpDto getSawon(int no){
		EmpDto dto = null;
		
		try{
			con = pool.getConnection();
			String sql = "select * from tblsawon where no=?";
						
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			
			if(rs.next()){
				dto = new EmpDto();
				dto.setAddr(rs.getString("addr"));
				dto.setAge(rs.getInt("age"));
				dto.setDept(rs.getString("dept"));
				dto.setExt(rs.getString("ext"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setNo(rs.getInt("no"));
				dto.setPass(rs.getString("pass"));
			}
		}
		catch(Exception err){
			System.out.println("getSawon() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt, rs);
		}
		
		return dto;
	}
	
	public void modifySawon(EmpDto dto){
		String sql = "update tblsawon set id=?, name=? , pass=?, age=?" 
				+ ", addr=?, ext=?, dept=? where no=?";
		
		try{
			con = pool.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getId());
			stmt.setString(2, dto.getName());
			stmt.setString(3, dto.getPass());
			stmt.setInt(4, dto.getAge());
			stmt.setString(5, dto.getAddr());
			stmt.setString(6, dto.getExt());
			stmt.setString(7, dto.getDept());
			stmt.setInt(8, dto.getNo());
			
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("modifySawon() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
	
	// 사원 삭제
	public void delSawon(int no){
		String sql = "delete from tblSawon where no=?";
		try{
			con = pool.getConnection();
			
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, no);
			stmt.executeUpdate();
		}
		catch(Exception err){
			System.out.println("delSawon() : " + err);
		}
		finally{
			pool.freeConnection(con, stmt);
		}
	}
}
