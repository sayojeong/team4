package swdo.syj.yayoung.dao;

import java.util.ArrayList;
import java.util.HashMap;

import swdo.syj.yayoung.vo.BasketVO;
import swdo.syj.yayoung.vo.CouponVO;
import swdo.syj.yayoung.vo.Ins_classVO;
import swdo.syj.yayoung.vo.SignUpClassVO;

/*
 * 수강신청
 * 우다슬 2019-08-26 
 * */
public interface SignUpClassMapper {

	public int insertBasket(HashMap<String, Object> map);

	public int insertBuy(HashMap<String, Object> map);

	public ArrayList<CouponVO> couponList(String st_id);

	public int delete(HashMap<String, Object> map);

	public SignUpClassVO classCheck(HashMap<String, Object> map);

	public BasketVO basketCheck(HashMap<String, Object> map);

	public ArrayList<BasketVO> basketList(String st_id);

	public int deleteBasket(HashMap<String, Object> map);

	public ArrayList<Integer> getSucClass(String st_id);
	
}
