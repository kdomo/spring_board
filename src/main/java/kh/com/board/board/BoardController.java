package kh.com.board.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@RequestMapping(value="/toBoard")
	public String toBoard() throws Exception{
		return "board/boardList";
	}
	
	@RequestMapping(value="/toWrite")
	public String toWrite() throws Exception{
		return "board/write";
	}
}
