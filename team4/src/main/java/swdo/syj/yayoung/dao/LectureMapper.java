package swdo.syj.yayoung.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import swdo.syj.yayoung.vo.HWanswer_stVO;
import swdo.syj.yayoung.vo.Homework_mVO;
import swdo.syj.yayoung.vo.Homework_wVO;
import swdo.syj.yayoung.vo.Ins_classVO;
import swdo.syj.yayoung.vo.Ins_class_vidVO;
import swdo.syj.yayoung.vo.SignUpClassVO;
import swdo.syj.yayoung.vo.StudentWAnswer;

/*
 * 강의등록, 강의관리, 과제등록, 작문답변
 * 김성우 2019-08-19 
 * */

public interface LectureMapper {

	int insertins(Ins_classVO vo);

	public ArrayList<Ins_classVO> getInsList(RowBounds row, String tc_id);

	public Ins_classVO getOneVO(int ins_num);

	public int insert_vid(Ins_class_vidVO vo);

	public int updateThumb(Ins_class_vidVO vo);

	public ArrayList<Ins_classVO> classList();

	public Ins_classVO buy(int ins_num);

	public String getName(String tc_id);
	
	public int countVid(int ins_num);

	public int insertList(HashMap<String, Object> map);

	public ArrayList<Ins_class_vidVO> getVidList(int ins_num);

	public int insertQ(Homework_mVO vo);

	public ArrayList<Homework_mVO> getQList(int vid_num);

	public int insertQW(Homework_wVO vo);

	public ArrayList<Homework_wVO> getWList(int vid_num);

	public ArrayList<SignUpClassVO> getLectureList(String st_id);

	public int insertHA(HashMap<String, Object> map);

	public ArrayList<HWanswer_stVO> getstudentHW(HashMap<String, Object> map);

	public int changeW(int hw_num);

	public ArrayList<Ins_classVO> searchList(HashMap<String, Object> map);

	public Ins_classVO get(int ins_num);

	public int getIns_num(int vid_num);

	public int updateHWST(HWanswer_stVO hWanswer_stVO);

	public ArrayList<HWanswer_stVO> getHWanswerList(int vid_num);

	public ArrayList<Homework_wVO> getSTW(int vid_num);

	public int resAnswer(StudentWAnswer sw);

	public ArrayList<StudentWAnswer> getSWAns(HashMap<String, Object> map);

	public ArrayList<StudentWAnswer> getNC(String st_id);

	public ArrayList<StudentWAnswer> getWC(String st_id);

	public ArrayList<Integer> getIns_nums(String tc_id);

	public ArrayList<Integer> getVid_nums(ArrayList<Integer> ins_num);

	public ArrayList<StudentWAnswer> TWanswerNC(ArrayList<Integer> vid_num);

	public ArrayList<StudentWAnswer> TWanswerWC(ArrayList<Integer> vid_num);

	public StudentWAnswer getSW(int wa_num);

	public int updateTWA(StudentWAnswer vo);
	
	public ArrayList<Ins_classVO> allList(String text);

	public int getInsCount(String tc_id);

	public ArrayList<Ins_classVO> getInsClass(String tc_id);

	public int getListNCCount(ArrayList<Integer> ins_num);

	public int getListWCCount(ArrayList<Integer> ins_num);

	public ArrayList<Ins_classVO> getInsListByNum(ArrayList<Integer> ins_num);

	public String getTeacherId(int ins_num);

	public String getTeacherName(String tc_id);

	public String getVidTitle(int vid_num);

	
	
}
