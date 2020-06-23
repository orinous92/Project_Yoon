package com.project.view.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.biz.member.AddressVO;
import com.project.biz.member.MemberService;
import com.project.biz.member.MemberVO;


@Controller
@SessionAttributes("member")
public class MemberController {
	
	/* logger
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	*/
	
	
	@Autowired
	private MemberService memberService;
	
	/*
	 * @Inject 
	 * BCryptPasswordEncoder passEncoder;
	 */
	
	// ????�???(?��?????)
	@RequestMapping(value="/contract", method=RequestMethod.GET)
	public String ContractView() {
		return "member/contract";
	}
	// ????�??? (get)
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String JoinView() {
		return "member/signup";
	}
	
	// ????�??? (post)
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String JoinAction(MemberVO mVo, Model model,
								@RequestParam(value="addr1", required=false)String addr1,
								@RequestParam(value="addr2", required=false)String addr2,
								@RequestParam(value="birthyy", required=false)String birthyy,
								@RequestParam(value="birthmm", required=false)String birthmm,
								@RequestParam(value="birthdd", required=false)String birthdd,
								@RequestParam(value="phone1", required=false)String phone1,
								@RequestParam(value="phone2", required=false)String phone2,
								@RequestParam(value="phone3", required=false)String phone3) throws Exception {
		
		mVo.setAddress(addr1 + " " + addr2);
		System.out.println("주�?? :" + mVo.getAddress());
		
		
		java.util.Date Date = (java.util.Date) new SimpleDateFormat("yyyy-MM-dd").parse(birthyy+"-"+birthmm+"-"+birthdd);
		
		mVo.setBirthdate(Date);
		
		mVo.setPhone(phone1 + "-" + phone2 + "-" + phone3);
		
		System.out.println(mVo);
		
		memberService.signup(mVo);
		
		model.addAttribute("userid", mVo.getUserid());

		
		System.out.println("==> ????�??? ??�?");
		
		return "main";
	}

	// �?그�?? get
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public String getSignin() throws Exception{
		return "member/signin";
	}
	
	// �?그�?? post
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public String postSignin(MemberVO mVo, Model model, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO user = memberService.signin(mVo);
		
		//boolean passMatch = passEncoder.matches(mVo.getPassword(), user.getPassword());
		
		if(user != null) {
			session.setAttribute("member", user);
		} else {
			session.setAttribute("member", null);	// ?��??�? ??�?
			rttr.addFlashAttribute("message", false);	// �??��? == false ?��??
			return "member/signFail";
		}
		return "redirect:index";
	}
	
	// �?그�????
	@RequestMapping(value="/signout", method=RequestMethod.GET)
	public String signout(SessionStatus session) throws Exception {
		System.out.println("==> �?그�???? ??�?");
			session.setComplete();
		System.out.println("==> �?그�???? ?�공");
		
		return "redirect:index";
	}
	
	// ???��?? �?복체?? (get)
	@RequestMapping(value="/userid_check", method=RequestMethod.GET)
	public String checkUserid(Model model, @RequestParam(value="userid", required=false)String userid) {
		
		model.addAttribute("userid", userid);
		
		return "member/idcheck";
	}
	
	// ???��?? �?복체?? (post)
	@RequestMapping(value="/userid_check", method=RequestMethod.POST)
	public String checkUserid(MemberVO mVo, Model model, @RequestParam(value="userid", required=false)String userid) {
		
		model.addAttribute("userid", userid);
		
		int check = memberService.confirmId(userid);
		model.addAttribute("message", check);
			
		return "member/idcheck";
	}
	
	// 주�?? (?��?��??? 찾기) GET
	@RequestMapping(value="/find_zipnum", method=RequestMethod.GET)
	public String findZipNumView() {
		return "member/findZipNum";
	}
	
	// 주�?? (?��?��??? 찾기) POST
	@RequestMapping(value="/find_zipnum", method=RequestMethod.POST)
	public String findZipNumAction(AddressVO aVo, Model model) {
		
		List<AddressVO> addressList = memberService.selectAddressByDong(aVo.getDong());
		
		model.addAttribute("addressList" , addressList);
		
		return "member/findZipNum";
	}
	
	// ???? ???��?? 찾기 GET
	@RequestMapping(value="/find_id", method=RequestMethod.GET)
	public String findIdView() {
		return "member/findId";
	}
	
	// ???? ???��?? 찾기 POST
	@RequestMapping(value="/find_id", method=RequestMethod.POST)
	public String findIdAction(MemberVO mVo, Model model) {
		
		MemberVO user = memberService.findUserId(mVo);
		
		if(user == null) {
			model.addAttribute("message", -1);
		} else {
			model.addAttribute("userid", user.getUserid());
			model.addAttribute("message", 1);
		}
		return "member/findIdResult";
	}
	
	// ???? �?�?�??? 찾기 GET
	@RequestMapping(value="/find_pwd", method=RequestMethod.GET)
	public String findPwdView() {
		return "member/findPwd";
	}
	
	// ???? �?�?�??? 찾기 POST
	@RequestMapping(value="/find_pwd", method=RequestMethod.POST)
	public String findPwdAction(MemberVO mVo, Model model) {
		
		MemberVO user = memberService.findUserPwd(mVo);
		
		if(user == null) {
			model.addAttribute("message", -1);
		} else { 
			model.addAttribute("message", 1);
			model.addAttribute("user", user);
		}
		
		return "member/findPwdResult";
	}
	
	// ???? �?�?�??? 찾기 ?? - ???? �?�?�??? ???? POST
	@RequestMapping(value="/upd_pwd", method=RequestMethod.POST)
	public String updpwdAction(MemberVO mVo, Model model, @RequestParam(value="password")String newPwd) {
		
		
		System.out.println(mVo.getPassword());
		mVo.setPassword(newPwd);		
		System.out.println(newPwd);
		System.out.println(mVo.getUserid());
		memberService.updpwd(mVo);
		
		return "member/signin";
		
	}
}
