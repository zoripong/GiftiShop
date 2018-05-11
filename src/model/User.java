package model;

public class User {
	
	private String userId;
	private String userPw;
	
	public User(String id, String pw) {
		this.userId = id;
		this.userPw = pw;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String toString() {
		return userId+"\t"+userPw+"\n";
	}

	
	// TODO 아이디만 같아도 같은 객체!!
//	@Override
//	public boolean equals(Object arg0) {
//		// TODO Auto-generated method stub
//		return super.equals(arg0);
//	}
	
	
	
	
}
