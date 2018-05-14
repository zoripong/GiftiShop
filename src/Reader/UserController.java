package Reader;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.StringTokenizer;

import model.User;

public class UserController {
	private String filePath;
	private HashSet<User> users;

	public UserController(String filePath) {
		this.filePath = filePath;
		System.out.println(filePath);
		users = new HashSet<User>();
		readFile();
	}

	private void readFile() {
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(filePath));
			while(true){
				String str = br.readLine();
				if(str == null) break;
				StringTokenizer token = new StringTokenizer(str, "\t", false);
				while(token.hasMoreTokens()){
					// 고객 정보 추가
					
					users.add(new User(token.nextToken(), token.nextToken()));
					
				}
			}
			br.close();	
		}catch(IOException e) {
			e.printStackTrace();
		}



	}

	public boolean isExist(User user) {

		return users.contains(user);
	}
	
	
	public boolean isValidID(User user) {
		Iterator<User> iterator = users.iterator();
		
		while(iterator.hasNext()) {
			if(iterator.next().getUserId().equals(user.getUserId())) {
				return true;
			}
		}
		return false;	
	}

	// user 추가
	public void insert(User user) {

		System.out.println("LOG : 회원가입 성공");
		users.add(user);

		try {

			BufferedWriter out = new BufferedWriter(new FileWriter(filePath, true));
			out.write(user.toString());
			out.close();
			System.out.println("뀨?");

		}catch(IOException e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}

	}

	// 파일 다시 쓰기
	public void update() {
		System.out.println("LOG : 업데이트");

		BufferedWriter bw = null;
		try {
			bw = new BufferedWriter(new FileWriter(filePath));

			Iterator<User> iterator = users.iterator();
			while(iterator.hasNext()) {
				bw.write(iterator.next().toString());

			}
			bw.flush();
			bw.close();
		}catch(IOException e) {
			e.printStackTrace();
		}

	}


}
