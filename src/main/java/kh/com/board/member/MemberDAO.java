package kh.com.board.member;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private JdbcTemplate jdbc;

	public int checkId(String id) throws Exception {
		String sql = "select count(*) from member where id=?";
		return jdbc.queryForObject(sql, Integer.class, id);
	}

	public int signup(MemberDTO dto) throws Exception {
		String sql = "insert into member values(?,?,?)";
		return jdbc.update(sql, dto.getId(), dto.getPassword(), dto.getNickname());
	}
	
	public int login(String id,String password) throws Exception{
		String sql="select count(*) from member where id=? and password=?";
		return jdbc.queryForObject(sql, Integer.class,id,password);
	}
	
	public MemberDTO getMember(String id) throws Exception{
		String sql="select * from member where id=?";
		return jdbc.queryForObject(sql, new RowMapper<MemberDTO>() {
			@Override
			public MemberDTO mapRow(ResultSet rs,int rowNum) throws SQLException{
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setNickname(rs.getString("nickname"));
				return dto;
			}
		},id);
	}
	
	public int modify(MemberDTO dto) throws Exception{
		String sql="update member set password=?,nickname=? where id=?";
		return jdbc.update(sql,dto.getPassword(),dto.getNickname(),dto.getId());
	}
}
