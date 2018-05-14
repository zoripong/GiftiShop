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
		return userId+"\t"+userPw+"\t";
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User users = (User) o;

        if (!userId.equals(users.userId)) return false;
        return userPw.equals(users.userPw);
    }

    @Override
    public int hashCode() {
        int result = userId.hashCode();
        result = 31 * result + userPw.hashCode();
        return result;
    }
	
	
	
}
