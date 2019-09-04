package kr.co.ziziza.main.join;

import java.io.IOException;
import java.io.PrintWriter;

public interface JoinController {

	public String joinForm();
	
	public void joinIDCheck(MemberVO vo, PrintWriter out) throws IOException;
		
	public void joinIns(MemberVO vo, PrintWriter out);
	
}
