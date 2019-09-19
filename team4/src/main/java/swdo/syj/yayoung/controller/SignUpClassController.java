package swdo.syj.yayoung.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import swdo.syj.yayoung.dao.LectureDao;
import swdo.syj.yayoung.dao.SignUpClassDao;
import swdo.syj.yayoung.vo.BasketVO;
import swdo.syj.yayoung.vo.CouponVO;
import swdo.syj.yayoung.vo.Ins_classVO;
import swdo.syj.yayoung.vo.Ins_class_vidVO;
import swdo.syj.yayoung.vo.SignUpClassVO;

/*
 * 수강신청
 * 우다슬 2019-08-26 
 * */

@Controller
@RequestMapping("suc")
public class SignUpClassController {

	private static final Logger logger = LoggerFactory.getLogger(SignUpClassController.class);
	
	@Autowired
	SignUpClassDao sucdao;
	@Autowired
	LectureDao dao;
	
	/*
	 * 검색 메인 페이지 이동
	 */
	@RequestMapping(value="classList", method=RequestMethod.GET )
	public String classList(Model model){
	
		// 강사들이 등록해 놓은 모든 강의 가져오기
		ArrayList<Ins_classVO> list = dao.classList();
		
		for(Ins_classVO vo:list){
			String name = dao.getName(vo.getTc_id());
			logger.debug(name);
			vo.setTc_name(name);
		}
		model.addAttribute("list", list);
		return "suc/classList";
	
	}
	
	/*
	 * 검색 상세 페이지 이동
	 */
	@RequestMapping(value="classPage", method=RequestMethod.GET )
	public String classPage(Model model, int ins_num){
		logger.debug("숫자:{}", ins_num);
		
		Ins_classVO vo = dao.getOneVO(ins_num);
		ArrayList<Ins_class_vidVO> list = dao.getVidList(ins_num);
				
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		
		return "suc/classPage";
		
	}
	
	/*
	 * 검색어를 입력하여 강의 찾기
	 */
	@ResponseBody
	@RequestMapping(value="searchList", method=RequestMethod.GET )
	public ArrayList<Ins_classVO> searchList(String ins_cate, String text){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Ins_classVO> list;
		logger.debug(ins_cate);
		if (ins_cate.equals("전체")) {
			 list = dao.allList(text);
			for(Ins_classVO vo:list){
				String name = dao.getName(vo.getTc_id());
				vo.setTc_name(name);
			}
		}else{
			map.put("ins_cate", ins_cate);
			map.put("text", text);
			list = dao.searchList(map);
			for(Ins_classVO vo:list){
				String name = dao.getName(vo.getTc_id());
				logger.debug(name);
				vo.setTc_name(name);
			}
		}
		logger.debug(list.toString());
		return list;
	}
	
	/*
	 * 장바구니 담기
	 * 로그인 인터셉터 필요
	 */
	@ResponseBody
	@RequestMapping(value="basket", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public String basket(int ins_num, HttpSession session){
		String st_id = (String)session.getAttribute("loginId_st");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ins_num", ins_num);
		map.put("st_id", st_id);
		// 장바구니 확인하기
		BasketVO vo = sucdao.basketCheck(map);
		String msg = null;
		if (vo == null) {
			sucdao.insertBasket(map);
			msg = "장바구니 담기 성공";
		}else {
			msg = "이미 장바구니에 있는 강의입니다.";
		}
		System.out.println(msg);
		return msg;
	}
	
	/*
	 * 결제하기 폼
	 */
	@RequestMapping(value="BuyForm", method=RequestMethod.GET )
	public String sucbuyForm(int ins_num, Model model, HttpSession session){
		// 결제하려는 강의 정보 부르기
		Ins_classVO vo = dao.buy(ins_num);
		model.addAttribute("vo", vo);
		// 쿠폰 리스트 부르기
		String st_id = (String)session.getAttribute("loginId_st");
		ArrayList<CouponVO> list = sucdao.couponList(st_id);
		model.addAttribute("list", list);
		logger.debug("쿠폰:{}",list);
		return "suc/BuyForm";	
	}
	
	/*
	 * 결제하기
	 */
	@RequestMapping(value="buy", method=RequestMethod.POST)
	public String buy(int ins_num, HttpSession session, Model model){
		String st_id = (String)session.getAttribute("loginId_st");
		Ins_classVO insVo = dao.getOneVO(ins_num); 
		System.out.println(insVo.toString());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ins_num", ins_num);
		map.put("st_id", st_id);
		//map 추가
		map.put("ins_thumbnailsave", insVo.getIns_thumbnailsave());
		map.put("ins_cate", insVo.getIns_cate());
		map.put("tc_name", insVo.getTc_name());
		map.put("ins_title", insVo.getIns_title());
	
		
		// 이미 등록된 강의인지 확인하기
		SignUpClassVO vo = sucdao.classCheck(map);
		if (vo == null) {
			int cnt = sucdao.insertBuy(map);
			if (cnt != 0) {
				model.addAttribute("close", "close");
			}			
		}else{
			model.addAttribute("msg", "이미 등록된 강의입니다.");
		}
		return "suc/BuyForm";
	}
	
	/*
	 * 쿠폰 사용하기 -> 사용한 쿠폰 삭제 
	 */
	@ResponseBody
	@RequestMapping(value="coupon", method=RequestMethod.POST)
	public void coupon(HttpSession session, int c_num){
		String st_id = (String)session.getAttribute("loginId_st");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("c_num", c_num);
		map.put("st_id", st_id);				
		sucdao.delete(map);	
	}
	
	/*
	 * 쿠폰 리스트 폼
	 */
	@RequestMapping(value="couponForm", method=RequestMethod.GET)
	public String couponForm(HttpSession session, Model model){
		String st_id = (String)session.getAttribute("loginId_st");
		ArrayList<CouponVO> list = sucdao.couponList(st_id);
		model.addAttribute("list", list);
		return "suc/CouponForm";
	}
	
	/*
	 * 장바구니 리스트 폼
	 */
	@RequestMapping(value="basketForm", method=RequestMethod.GET)
	public String basketForm(HttpSession session, Model model){
		String st_id = (String)session.getAttribute("loginId_st");
		
		ArrayList<BasketVO> list = sucdao.basketList(st_id);
		
		for(BasketVO vo:list){
			// 강의제목, 강의가격
			Ins_classVO getVO = dao.get(vo.getIns_num());
			vo.setIns_title(getVO.getIns_title());
			vo.setIns_price(getVO.getIns_price());
		}

		if(list != null)
			model.addAttribute("listLength", list.size());
		model.addAttribute("list", list);
		return "suc/BasketForm";
	}
	
	/*
	 * 장바구니에 담겨진 것을 결제 폼으로 넘기기
	 */
	@RequestMapping(value="basketBuy", method=RequestMethod.POST, produces="application/json;charset=utf8")
	public String basketBuy(@RequestParam(value="ins_num[]") List<Integer> buyList, 
			Model model, HttpSession session){
		ArrayList<Ins_classVO> list = new ArrayList<>();
		for(int ins_num : buyList){
			//System.out.println(ins_num);
			Ins_classVO vo = dao.get(ins_num);
			System.out.println(vo.toString());
			list.add(vo);
		}	
		model.addAttribute("list", list);
		// 쿠폰 리스트 부르기
		String st_id = (String)session.getAttribute("loginId_st");
		ArrayList<CouponVO> coupon = sucdao.couponList(st_id);
		model.addAttribute("coupon", coupon);
		return "suc/BuyListForm";
	}
	
	/*
	 * 장바구니 결제하기
	 */
	@RequestMapping(value="buyList", method=RequestMethod.POST)
	public String buyList(@RequestParam(value="ins_num[]") List<Integer> num, HttpSession session, Model model){
		String st_id = (String)session.getAttribute("loginId_st");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("st_id", st_id);
		for(int ins_num : num){
			
			map.put("ins_num", ins_num);
			// 이미 등록된 강의인지 확인하기
			SignUpClassVO vo = sucdao.classCheck(map);
			System.out.println(vo);
			
			if (vo == null) {
				int cnt = sucdao.insertBuy(map);
				if (cnt != 0) {
					int basket = sucdao.deleteBasket(map);
					if (basket != 0) {
						model.addAttribute("close", "close");
					}
				}			
			}else{
				model.addAttribute("msg", "이미 등록된 강의입니다.");
			}			
		}	
		return "suc/BuyListForm";
	}
	
	/*
	 * 장바구니 담겨있는 강의 삭제 버튼 누른 후 삭제
	 */
	@ResponseBody
	@RequestMapping(value="basketDelete", method=RequestMethod.POST, produces="application/text;charset=utf8")
	public void basketDelete(int ins_num, HttpSession session){
		String st_id = (String)session.getAttribute("loginId_st");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("st_id", st_id);
		map.put("ins_num", ins_num);
		sucdao.deleteBasket(map);		
	}
}
