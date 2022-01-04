package kh.com.board.member;

public class MemberDTO {

	private String id;
	private String password;
	private String nickname;
	
	public MemberDTO() {}
	
	public MemberDTO(String id, String password, String nickname) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String toString() {
		return "MemberDTO["+this.id+" : "+this.password+" : "+this.nickname+"]";
	}
}
