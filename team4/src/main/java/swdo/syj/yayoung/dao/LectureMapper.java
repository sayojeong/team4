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

	/*
	 * 강의등록
	 */
	int insertins(Ins_classVO vo);

	/*
	 * 등록된 강의 리스트 가져오기
	 */
	public ArrayList<Ins_classVO> getInsList(RowBounds row, String tc_id);

	/*
	 * 강의 하나에 대한 정보를 강의 번호를 통해 가져옴
	 */
	public Ins_classVO getOneVO(int ins_num);

	/*
	 * 비디오 등록
	 */
	public int insert_vid(Ins_class_vidVO vo);

	/*
	 * 강의 썸네일 등록
	 */
	public int updateThumb(Ins_class_vidVO vo);

	public ArrayList<Ins_classVO> classList();

	public Ins_classVO buy(int ins_num);

	public String getName(String tc_id);
	
	/*
	 * 등록된 비디오 개수 가져오기
	 */
	public int countVid(int ins_num);

	/*
	 * 강의 목록 저장
	 */
	public int insertList(HashMap<String, Object> map);

	/*
	 * 강의에 등록된 비디오 리스트 가져오기
	 */
	public ArrayList<Ins_class_vidVO> getVidList(int ins_num);

	/*
	 * 개관식 과제등록
	 */
	public int insertQ(Homework_mVO vo);

	/*
	 * 등록된 객관식 과제 가져오기
	 */
	public ArrayList<Homework_mVO> getQList(int vid_num);

	/*
	 * 주관식 과제 등록
	 */
	public int insertQW(Homework_wVO vo);
	
	/*
	 * 주관식 문제 가져오기
	 */
	public ArrayList<Homework_wVO> getWList(int vid_num);

	public ArrayList<SignUpClassVO> getLectureList(String st_id);

	/*
	 * 학생 답변 등록
	 */
	public int insertHA(HashMap<String, Object> map);
	
	/*
	 * 학생 답변 목록 가져오기
	 */
	public ArrayList<HWanswer_stVO> getstudentHW(HashMap<String, Object> map);

	/*
	 * hwanswer_st테이블의 st_correct의 값을 'n'으로 바꿈
	 */
	public int changeW(int hw_num);

	public ArrayList<Ins_classVO> searchList(HashMap<String, Object> map);

	public Ins_classVO get(int ins_num);

	/*
	 * 비디오의 강의 번호 가져오기
	 */
	public int getIns_num(int vid_num);
	
	/*
	 * 오답체크 정보 저장
	 */
	public int updateHWST(HWanswer_stVO hWanswer_stVO);

	/*
	 * 오답정리 리스트 가져오기
	 */
	public ArrayList<HWanswer_stVO> getHWanswerList(int vid_num);

	/*
	 * 작문문제 가져오기
	 */
	public ArrayList<Homework_wVO> getSTW(int vid_num);

	/*
	 * 학생 영작 등록
	 */
	public int resAnswer(StudentWAnswer sw);

	/*
	 * 학생이 푼 영작문제 가져오기
	 */
	public ArrayList<StudentWAnswer> getSWAns(HashMap<String, Object> map);

	/*
	 * 선생님 코멘트 없는 작문
	 */
	public ArrayList<StudentWAnswer> getNC(String st_id);

	/*
	 * 선생님 코멘트 있는 작문
	 */
	public ArrayList<StudentWAnswer> getWC(String st_id);

	/*
	 * 로그인한 선생님의 강의 번호가져오기
	 */
	public ArrayList<Integer> getIns_nums(String tc_id);

	/*
	 * 위의 강의번호로 저장한 비디오 가져오기
	 */
	public ArrayList<Integer> getVid_nums(ArrayList<Integer> ins_num);

	/*
	 * 선생님 코멘트 없는 영작 - 선생님
	 */
	public ArrayList<StudentWAnswer> TWanswerNC(ArrayList<Integer> vid_num);

	/*
	 * 선생님 코멘트 있는 영작 - 선생님
	 */
	public ArrayList<StudentWAnswer> TWanswerWC(ArrayList<Integer> vid_num);

	/*
	 * 학생답변완료가져오기 
	 */
	public StudentWAnswer getSW(int wa_num);

	/*
	 * 선생님 코멘트 등록
	 */
	public int updateTWA(StudentWAnswer vo);
	
	public ArrayList<Ins_classVO> allList(String text);

	public int getInsCount(String tc_id);

	public ArrayList<Ins_classVO> getInsClass(String tc_id);

	public int getListNCCount(ArrayList<Integer> ins_num);

	public int getListWCCount(ArrayList<Integer> ins_num);

	public ArrayList<Ins_classVO> getInsListByNum(ArrayList<Integer> ins_num);

	public String getTeacherId(int ins_num);

	public String getTeacherName(String tc_id);

	/*
	 * 비디오 제목 가져오기
	 */
	public String getVidTitle(int vid_num);

	
	
}
