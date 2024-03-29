package com.kh.ttip.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ttip.member.model.vo.Member;
import com.kh.ttip.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인 페이지로 이동
	@RequestMapping("login.me")
	public String loginForm() {
		return "member/loginForm";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("enroll.me")
	public String enrollForm() {

		// 페이지 이동만 하면 되니 return 한줄처리
		return "member/enrollForm";
	}

	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUserPassword());

		m.setUserPassword(encPwd); // 암호화된 비밀번호로 변경

		// insertMember로 작업하기 성공시 메인페이지로 (성공메세지 alertMsg 담기)
		// 실패시 에러페이지로 (model에 에러메세지 담기)
		
		int result = memberService.insertMember(m);
		
		if (result > 0) { // 성공
			session.setAttribute("alertMsg", "회원가입 성공");

			return "redirect:/";// 재요청
		} else { // 실패
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";// 포워딩
		}

	}

	// 암호화 작업 후 로그인 메소드
	@RequestMapping("loginInsert.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {

		Member loginUser = memberService.loginMember(m);

		System.out.println("입력한 이메일: " + m.getEmail());
		System.out.println("입력한 비밀번호: " + m.getUserPassword());

		//&& bcryptPasswordEncoder.matches(m.getUserPassword(), loginUser.getUserPassword()) : 리뷰확인을 위해서 조건을 뺌
		if (loginUser != null) { // 성공

			session.setAttribute("loginUser", loginUser);

			mv.setViewName("redirect:/");

		} else {

			mv.addObject("errorMsg", "로그인 실패");

			mv.setViewName("common/errorPage");
		}

		return mv;
	}
	//회원정보 재조회
	@ResponseBody
	@RequestMapping("memberSessionReinsert.me")
	public Member memberSessionReinsert(String email, HttpSession session, ModelAndView mv) {

		Member loginUser = memberService.memberSessionReinsert(email);
		
		session.setAttribute("loginUser", loginUser);
		
		return loginUser;

	}

	// 지역 선택
	@RequestMapping("/memberAddresses")
	public String getAddresses(Model model) {
		List<String> addresses = getAddressesFromDatabase();

		model.addAttribute("addresses", addresses);

		return "member/enrollForm";
	}

	private List<String> getAddressesFromDatabase() {
		List<String> addresses = new ArrayList<>();
		addresses.add("서울");
		addresses.add("경기");
		addresses.add("부산");
		return addresses;
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping("pwdFind.me")
	public String pwdFind() {

		return "member/pwdFindForm";
	}

	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {

		// 세션에 담겨있는 loginUser정보 지우기
		session.removeAttribute("loginUser");

		// 로그아웃처리 후 메인페이지 재요청
		return "redirect:/";
	}

	// 별명 중복체크
	@ResponseBody
	@RequestMapping("checkNickname.do")
	public String CheckNickname(String nickname) {

		int count = memberService.CheckNickname(nickname);

		if (count > 0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}

	//이메일 중복체크
	@ResponseBody
	@RequestMapping("emailSend.do")
	public String EmailSend(String emailck) {
		
		int count = memberService.EmailSend(emailck);

		if (count > 0) {
			return "NNNNN";
		} else {
			return "NNNNY";
		}
	}

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "sendMail.me", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(String email) {

		String title = "TTIP 가입 인증번호입니다.";
		String code = java.util.UUID.randomUUID().toString().replace("-", "").substring(0, 10);
		String from = "parade358@naver.com";
		String to = email;
		
		String body = "<html>"
	            + "<body style='font-family: \"Nanum Gothic\", sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;'>"
	            + "  <div style='max-width: 600px; margin: 30px auto; background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1);'>"
	            + "    <h2 style='color: #333;'>이메일 인증</h2>"
	            + "    <p style='color: #666;'>안녕하세요. TTIP에 가입해 주셔서 감사합니다. <br><br> 회원가입을 완료하려면 아래의 인증번호를 입력해주세요</p><br>"
	            + "    <p style='font-size: 24px; color: #007BFF; margin-bottom: 20px;'>" + code + "</p>"
	            + "    <p style='color: #666;'>만약 이메일 인증 요청을 안하셨다면 무시하셔도 됩니다.</p>"
	            + "    <div style='margin-top: 20px; padding-top: 10px; border-top: 1px solid #eee; color: #666; color: #999; font-size: 12px;'>"
	            + "      <p>본 메일은 발신 전용 메일이며, 회신되지 않으므로 문의사항은 고객센터를 이용해주세요.<br>"
	            + "			COPYRIGHTS (C)TTIP ALL RIGHTS RESERVED."
	            + "		</p>"
	            + "    </div>"
	            + "  </div>"
	            + "</body>"
	            + "</html>";


		try {
			MimeMessage mail = mailSender.createMimeMessage();
			
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			
			mailHelper.setFrom(from);

			mailHelper.setTo(to);

			mailHelper.setSubject(title);

			mailHelper.setText(body,true);

			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}
	
	
		@ResponseBody
		@RequestMapping("findPwdCheck.me")
		public int findPwdCheck(String email) {
			
			int result = memberService.findPwdCheck(email);
			System.out.println("??");
			return result;
		}
	
	@RequestMapping(value = "findPwd.me", method = RequestMethod.GET)
	@ResponseBody
	public String findPwd(String email) {

		String title = "TTIP 비밀번호 재설정 인증번호입니다.";
		String code = java.util.UUID.randomUUID().toString().replace("-", "").substring(0, 10);
		String from = "parade358@naver.com";
		String to = email;
		
		String body = "<html>"
	            + "<body style='font-family: \"Nanum Gothic\", sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;'>"
	            + "  <div style='max-width: 600px; margin: 30px auto; background-color: #fff; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1);'>"
	            + "    <h2 style='color: #333;'>비밀번호 재설정</h2>"
	            + "    <p style='color: #666;'>비밀번호 재설정 인증번호입니다. <br><br> 비밀번호를 재설정 하려면 아래의 인증번호를 입력해주세요</p><br>"
	            + "    <p style='font-size: 24px; color: #007BFF; margin-bottom: 20px;'>" + code + "</p>"
	            + "    <p style='color: #666;'>만약 인증 요청을 안하셨다면 무시하셔도 됩니다.</p>"
	            + "    <div style='margin-top: 20px; padding-top: 10px; border-top: 1px solid #eee; color: #666; color: #999; font-size: 12px;'>"
	            + "      <p>본 메일은 발신 전용 메일이며, 회신되지 않으므로 문의사항은 고객센터를 이용해주세요.<br>"
	            + "			COPYRIGHTS (C)TTIP ALL RIGHTS RESERVED."
	            + "		</p>"
	            + "    </div>"
	            + "  </div>"
	            + "</body>"
	            + "</html>";


		try {
			MimeMessage mail = mailSender.createMimeMessage();
			
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			
			mailHelper.setFrom(from);

			mailHelper.setTo(to);

			mailHelper.setSubject(title);

			mailHelper.setText(body,true);

			mailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}
	

    //이용약관 동의
	@RequestMapping("info01.me")
	public String info01() {
		return "member/info01";
	}

	//개인정보 동의
	@RequestMapping("info02.me")
	public String info02() {
		return "member/info02";
	}
	
	@RequestMapping("newPwd.me")
	public String newPwd() {
		
		return "member/newPwd";
	}
	
	
}
