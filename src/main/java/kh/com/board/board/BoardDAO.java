package kh.com.board.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Autowired
	private JdbcTemplate jdbc;
	
	public int insert(BoardDTO dto) throws Exception{
		String sql="insert into board values(seq_board.nextval,?,?,?,?,sysdate,0)";
		return jdbc.update(sql,dto.getTitle(),dto.getWriter_nickname(),dto.getWriter_id(),dto.getContent());
	}
}
