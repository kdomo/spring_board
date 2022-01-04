package kh.com.board.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	@Autowired
	private BoardDAO dao;
	
	public int insert(BoardDTO dto) throws Exception{
		return dao.insert(dto);
	}
}
