package swdo.syj.yayoung.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class LectureDao {

	@Autowired
	SqlSession session;

	/*
	 * 강의 등록
	 */
	public int insertins(Ins_classVO vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insertins(vo);
		return res;
	}
	
	/*
	 * 등록된 강의 리스트 가져오기
	 */
	public ArrayList<Ins_classVO> getInsList(int start, int countperpage, String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		
		RowBounds row = new RowBounds(start, countperpage);
		ArrayList<Ins_classVO> list = mapper.getInsList(row, tc_id);
		return list;
	}
	
	/*
	 * 강의 하나에 대한 정보를 강의 번호를 통해 가져옴
	 */
	public Ins_classVO getOneVO(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		Ins_classVO vo = mapper.getOneVO(ins_num);
		return vo;
	}
	
	/*
	 * 등록된 전체 비디오에 관해 카운트
	 */
	public int countVid(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.countVid(ins_num);
		return res;
	}

	/*
	 * 비디오 등록
	 */
	public int insert_vid(Ins_class_vidVO vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insert_vid(vo);
		return 0;
	}

	/*
	 * 강의 썸네일 등록
	 */
	public int updateThumb(Ins_class_vidVO vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.updateThumb(vo);
		return res;
	}


	/*
	 *  모든 강의 부르기
	 */
	public ArrayList<Ins_classVO> classList() {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_classVO> list = mapper.classList();
		return list;
	}

	/*
	 * 강의에 해당하는 선생님 이름 부르기
	 */
	public String getName(String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		String name = mapper.getName(tc_id);
		return name;
	}

	/*
	 *  결제하려는 강의 정보 부르기
	 */
	public Ins_classVO buy(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		Ins_classVO vo = mapper.buy(ins_num);
		return vo;
	}
	
	/*
	 *  강의목록 저장
	 */
	public int insertList(HashMap<String, Object> map) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insertList(map);
		return res;
	}
	
	/*
	 * 강의에 등록된 비디오 리스트 가져오기
	 */
	public ArrayList<Ins_class_vidVO> getVidList(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_class_vidVO> list = mapper.getVidList(ins_num);
		return list;
	}

	/*
	 * 객관식 과제등록
	 */
	public int insertQ(Homework_mVO vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insertQ(vo);
		return res;
	}

	/*
	 * 등록된 객관식 과제 가져오기
	 */
	public ArrayList<Homework_mVO> getQList(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Homework_mVO> list = mapper.getQList(vid_num); 
		return list;
	}

	/*
	 * 주관식 과제 등록
	 */
	public int insertWQ(Homework_wVO vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insertQW(vo);
		return res;
	}

	/*
	 * 주관식 문제 가져오기
	 */
	public ArrayList<Homework_wVO> getQListW(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Homework_wVO> list = mapper.getWList(vid_num);
		return list;
	}

	/*
	 * 학생리스트로 과제 가져오기
	 */
	public ArrayList<Ins_classVO> insListBySTId(String st_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<SignUpClassVO> list1 = mapper.getLectureList(st_id);
		ArrayList<Ins_classVO> insClass = new ArrayList<>();
		for(SignUpClassVO vo : list1){
			insClass.add(mapper.getOneVO(vo.getIns_num()));		
		}
		return insClass;
	}

	/*
	 * 학생 답변 등록
	 */
	public int insertHA(HashMap<String, Object> map) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.insertHA(map);
		return res;
	}

	/*
	 * 학생이 답변한 문제 목록
	 */
	public ArrayList<HWanswer_stVO> getstudentHW(HashMap<String, Object> map) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<HWanswer_stVO> hwList = mapper.getstudentHW(map);
		return hwList;
	}

	/*
	 * hwanswer_st테이블의 st_correct의 값을 'n'으로 바꿈
	 */
	public int changeW(int hw_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int cnt = mapper.changeW(hw_num);
		return cnt;
	}
	
	/*
	 * 검색어를 입력하여 강의 찾기
	 */
	public ArrayList<Ins_classVO> searchList(HashMap<String, Object> map) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_classVO> list = mapper.searchList(map);
		return list;
	}

	/*
	 * 해당 아이디가 장바구니에 담은 강의 제목,가격 불러오기
	 */
	public Ins_classVO get(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		Ins_classVO getVO = mapper.get(ins_num);
		return getVO;
	}

	/*
	 * 비디오의 강의 번호 가져오기
	 */
	public int getIns_num(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.getIns_num(vid_num);
		return res;
	}

	/*
	 * 오답체크정보 저장
	 */
	public int updateHWST(HWanswer_stVO hWanswer_stVO) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.updateHWST(hWanswer_stVO);
		return res;
	}

	/*
	 * 오답정리 리스트 가져오기
	 */
	public ArrayList<HWanswer_stVO> getHWanswerList(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<HWanswer_stVO> list = mapper.getHWanswerList(vid_num);
		return list;
	}

	/*
	 * 작문 문제 가져오기
	 */
	public ArrayList<Homework_wVO> getSTW(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Homework_wVO> list = mapper.getSTW(vid_num);
		return list;
	}

	/*
	 * 학생 영작 등록
	 */
	public int regAnswer(StudentWAnswer sw) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.resAnswer(sw);
		return res;
	}

	/*
	 * 학생이 푼 영작문제 가져오기
	 */
	public ArrayList<StudentWAnswer> getSWAns(HashMap<String, Object> map) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<StudentWAnswer> list = mapper.getSWAns(map);
		return list;
	}

	/*
	 * 선생님 코맨트 없는 작문
	 */
	public ArrayList<StudentWAnswer> getNC(String st_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<StudentWAnswer> list = mapper.getNC(st_id);
		return list;
	}

	/*
	 * 
	 */
	public ArrayList<StudentWAnswer> getWC(String st_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<StudentWAnswer> list = mapper.getWC(st_id);
		return list;
	}

	/*
	 * 로그인한 선생님의 강의 번호가져오기
	 */
	public ArrayList<Integer> getIns_nums(String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Integer> nums = mapper.getIns_nums(tc_id);
		return nums;
	}

	/*
	 * 위의 강의번호로 저장한 비디오 가져오기
	 */
	public ArrayList<Integer> getVid_nums(ArrayList<Integer> ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Integer> nums = mapper.getVid_nums(ins_num);
		return nums;
	}

	/*
	 * 선생님 코멘트 없는 영작 - 선생님
	 */
	public ArrayList<StudentWAnswer> TWanswerNC(ArrayList<Integer> vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<StudentWAnswer> list = mapper.TWanswerNC(vid_num);
		return list;
	}

	/*
	 * 선생님 코멘트 있는 영작 - 선생님
	 */
	public ArrayList<StudentWAnswer> TWanswerWC(ArrayList<Integer> vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<StudentWAnswer> list = mapper.TWanswerWC(vid_num);
		return list;
	}

	/*
	 * 학생답변완료가져오기 
	 */
	public StudentWAnswer getSW(int wa_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		StudentWAnswer sw = mapper.getSW(wa_num);
		return sw;
	}

	/*
	 * 선생님 코멘트 등록
	 */
	public int updateTWA(StudentWAnswer vo) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.updateTWA(vo);
		return res;
	}
	
	public ArrayList<Ins_classVO> allList(String text) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_classVO> list = mapper.allList(text);
		return list;
	}

	public int getInsCount(String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.getInsCount(tc_id);
		return res;
	}

	public ArrayList<Ins_classVO> getInsClass(String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_classVO> vo = mapper.getInsClass(tc_id);
		return vo;
	}

	public int getListNCCount(ArrayList<Integer> ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.getListNCCount(ins_num);
		return res;
	}

	public int getListWCCount(ArrayList<Integer> ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		int res = mapper.getListWCCount(ins_num);
		return res;
	}

	public ArrayList<Ins_classVO> getInsListByNum(ArrayList<Integer> ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		ArrayList<Ins_classVO> list = mapper.getInsListByNum(ins_num);
		return list;
	}

	public String getTeacherId(int ins_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		String tc_id = mapper.getTeacherId(ins_num);
		return tc_id;
	}

	public String getTeacherName(String tc_id) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		String tc_name = mapper.getTeacherName(tc_id);
		return tc_name;
	}

	/*
	 * 비디오 제목 가져오기
	 */
	public String getVidTitle(int vid_num) {
		LectureMapper mapper = session.getMapper(LectureMapper.class);
		String s = mapper.getVidTitle(vid_num);
		return s;
	}

	

	
}
