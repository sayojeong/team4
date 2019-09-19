package swdo.syj.yayoung.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swdo.syj.yayoung.dao.JoinDao;
import swdo.syj.yayoung.dao.LectureDao;
import swdo.syj.yayoung.dao.SignUpClassDao;
import swdo.syj.yayoung.vo.Ins_classVO;
import swdo.syj.yayoung.vo.SignUpClassVO;
import swdo.syj.yayoung.vo.TeacherVO;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LectureDao dao;
	@Autowired
	SignUpClassDao sucdao;
	@Autowired
	JoinDao joindao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		ArrayList<TeacherVO> list = joindao.getTeacherList();
		
		model.addAttribute("tlist", list);
		
		return "home";
	}
	
	@RequestMapping(value="/facetest", method = RequestMethod.GET)
	public String gogo(){
		return "facetest";
	}
	
	@RequestMapping(value="/cal", method = RequestMethod.GET)
	public String goCal(){
		return "calendar";
	}
	
	/*
	 * 메인화면 선생님, 학생 강의 리스트 불러오기
	 */
	@RequestMapping(value="/slides", method=RequestMethod.GET)
	public String slide(Model model, HttpSession session){
		
		String tc_id = (String)session.getAttribute("loginId_tc");
		String st_id = (String)session.getAttribute("loginId_st");
		
		ArrayList<Ins_classVO> insVo = null;
		ArrayList<Integer> ins_num = null;
		
		if(tc_id != null){
			insVo = dao.getInsClass(tc_id);
			model.addAttribute("insList", insVo);
		}
		
		
		if(st_id != null){
			ins_num = sucdao.getSucClass(st_id);
			if(ins_num.size() != 0){
				insVo = dao.getInsListByNum(ins_num);							
			}
			
			model.addAttribute("insList", insVo);	
		}
		
		
		return "slides";
	}
	/*
	 * 스케쥴러 iframe 불러오기
	 */
	@RequestMapping(value="/scheduler", method=RequestMethod.GET)
	public String shceduler(){
		return "scheduler";
	}
	
	/*
	 * 선생님 권한 바꾸기
	 */
	@RequestMapping(value="changeAuth", method=RequestMethod.GET)
	public void changeAuth(String tc_id, String tc_check){
		HashMap<String, String> map = new HashMap<>();
		map.put("tc_id", tc_id);
		map.put("tc_check", tc_check);
		
		int res = joindao.changeAuth(map);
		
	}
}
