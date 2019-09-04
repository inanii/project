package kr.co.ziziza.common.util;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.ziziza.admin.vo.AdminQnAVO;
import kr.co.ziziza.common.vo.UserVO;

@Component("sendEmail")
public class SendEmail {

	@Resource(name = "mailSender")
	private JavaMailSender mailSender;
	
	/**
	 * 임시 비밀번호 생성
	 * @param	UserVO
	 * */
	public boolean sendTempPassword(UserVO user) {
		String toEmail = user.getEmail();
		String title = user.getUserName() +  "님의 임시비밀번호를 발급합니다.";
		String tempPassword = getRamdomPassword();
		String content = "<div>"
						+ "<p>임시비밀번호 : " + tempPassword + " 입니다.</p>"
						+ "<p>발급받은 비밀번호로 로그인해주세요.</p>"
						+ "<p><a href='http://localhost:8888' target='_blank'>홈페이지로 이동</a></p>"
						+ "</div>";
		user.setUserPw(tempPassword);
		return sendMail(toEmail, title, content);
	}//sendTempPassword()
	
	/**
	 * 답변 전송
	 * @param	AdminQnAVO
	 * */
	public boolean sendAnswer(AdminQnAVO vo) {
		String toEmail = vo.getAlramEmail();
		String title = "[문의답변] " + vo.getQstTitle();
		String content = "<div>"
						+ "<p>" + vo.getQstContents() + "</p>"
						+ "<p>==========	답변	==========</p>"
						+ "<p>" + vo.getAnswer() + "</p>"
						+ "</div>";
		return sendMail(toEmail, title, content);
	}//sendAnswer()
	
	/**
	 * 메일 보내기
	 * @param toEmail 받는이메일, title 제목, content 내용
	 * @return boolean
	 */
	public boolean sendMail(String toEmail, String title, String content){
		boolean result = false;
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(new InternetAddress("chrysesevil@gmail.com", "관리자")); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(toEmail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
			
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		}//try ~ catch
		
		return result;
	}//sendMail()
	
	/**
	 * 임시 비밀번호 생성		(Util 이동 예정)
	 * @param 	
	 * @return	String
	 */
	private String getRamdomPassword() { 
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'!','@','#', '$'}; 
		int idx = 0; StringBuffer sb = new StringBuffer(); 
		
		for (int i = 0; i < 15; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]);
		}//for end
		
		return sb.toString();
		
	}//getRamdomPassword

}//class end