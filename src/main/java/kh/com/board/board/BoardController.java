package kh.com.board.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.com.board.member.MemberDTO;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/toBoard")
	public String toBoard() throws Exception{
		return "board/boardList";
	}
	
	@RequestMapping(value="/toWrite")
	public String toWrite() throws Exception{
		return "board/write";
	}
	
	@RequestMapping(value="/write")
	public String write(String title,String content) throws Exception{
		MemberDTO memberdto = (MemberDTO)session.getAttribute("loginSession");
		BoardDTO boarddto = new BoardDTO();
	
		boarddto.setWriter_id(memberdto.getId());
		boarddto.setWriter_nickname(memberdto.getNickname());
		boarddto.setContent(content);
		boarddto.setTitle(title);
		
		service.insert(boarddto);
		return "board/boardList";
	}
}
