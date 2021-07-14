package com.swdo.test.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.service.LikeService;
import com.swdo.test.service.UserService;
import com.swdo.test.vo.LikeVO;
import com.swdo.test.vo.UserVO;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.swdo.test.NaverLoginBO;

@Controller
public class UserViewController {

	@Autowired
	private UserService service;
	
	@Autowired
	private LikeService likeService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value="/user/joinForm", method= RequestMethod.GET)
	public String joinForm() {
		System.out.println("회원 가입 폼 이동");
		return "user/joinForm";
	}
	@RequestMapping(value="/user/join", method=RequestMethod.POST)
	public String join(UserVO user) {
		System.out.println("입력받은 데이터 값: " +user);
		String path = service.userInsert(user);
//		return "home";	forward 방식
		return path;
	}

	@RequestMapping(value="/user/loginForm", method= RequestMethod.GET)
	public String loginForm(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버
		model.addAttribute("url", naverAuthUrl);		
		
		return "user/loginForm";
	}

	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	public String login(UserVO user) {
		String path = service.userLogin(user);
		return path;
	}
	
	
	@RequestMapping(value="/user/logout", method=RequestMethod.GET)
	public String logout(UserVO user) {
		service.logout();
		return "redirect:/";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String home2(Model model, @RequestParam String code, @RequestParam String state,UserVO user) throws IOException, ParseException {
		
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("nickname");
	String id = (String)response_obj.get("id");
	String email = (String)response_obj.get("email");
	String mobile = (String)response_obj.get("mobile");
	
	System.out.println(nickname);
	System.out.println(email);
	System.out.println(mobile);
	
	//4.파싱 닉네임 세션으로 저장
//	session.setAttribute("sessionId",nickname); //세션 생성
	
	session.setAttribute("Naver", nickname);
	session.setAttribute("NaverEmail", email);
	session.setAttribute("NaverId", id);
	session.setAttribute("NaverPhone", mobile);
	
	model.addAttribute("result", apiResult);
	
    user.setUser_id((String)response_obj.get("id"));
    user.setUser_pw("0000");
    user.setUser_nm((String)response_obj.get("nickname"));
    user.setUser_email((String)response_obj.get("email"));
    user.setUser_phone((String)response_obj.get("mobile"));
    
    if(userService.userSelectOne(id) == null) {
        service.userInsert(user);
     }

	return "redirect:/";	
	}	
	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		
		return "redirect:/";
		}		
	
	@RequestMapping(value = "/user/detail", method=RequestMethod.GET)
	public String userdetail(String user_id, Model model) {
		UserVO vo = service.userSelectOne(user_id);
		model.addAttribute("userDetail", vo);
		ArrayList<LikeVO> list = likeService.likeSelectAll(user_id);
		model.addAttribute("likeList",list);
		return "user/detail";
	}
	
	@RequestMapping(value="/user/updateForm", method=RequestMethod.GET)
	public String updateForm(String user_id, Model model) {
		UserVO vo = service.userSelectOne(user_id);
		model.addAttribute("userVO", vo);
		return "user/updateForm";
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.POST)
	public String update(UserVO user) {
		//전달받은 데이터를 DB로 보내서 회원정보를 수정한다. 
		String path = service.userUpdate(user);
		return path; 
	}	
	
}
