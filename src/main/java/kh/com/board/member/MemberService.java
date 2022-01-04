package kh.com.board.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	private MemberDAO dao;
	
	public boolean checkId(String id) throws Exception{
		if(dao.checkId(id) == 1) { //사용할 수 없다면
			return false;
		}else { 				//사용할 수 있다면
			return true;
		}
	}
	
	public int signup(MemberDTO dto) throws Exception{
		return dao.signup(dto);
	}
	
	public boolean login(String id,String password) throws Exception{
		if(dao.login(id,password) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public MemberDTO getMember(String id) throws Exception{
		return dao.getMember(id);
	}
	
	public int modify(MemberDTO dto) throws Exception{
		return dao.modify(dto);
	}
}
