package swdo.syj.yayoung.vo;

/*
 * 수강신청
 * 우다슬 2019-08-26 
 * */

public class SignUpClassVO {

	private int suc_num;	// 수강신청 번호
	private String suc_buydate; // 수강구매일
	private int progress;	// 진도율
	private String st_id;	// 학생 아이디
	private int ins_num;	// 강의등록 번호
	private String ins_cate; // 카테고리  (변수 추가 : 김성우  09/16)
	private String tc_name; // 선생님 이름  (변수 추가 : 김성우  09/16)
	private String ins_title; // 강의제목 (변수추가: 김성우 09/16)
	
	
	public SignUpClassVO(){}


	public SignUpClassVO(int suc_num, String suc_buydate, int progress, String st_id, int ins_num, String ins_cate,
			String tc_name, String ins_title) {
		super();
		this.suc_num = suc_num;
		this.suc_buydate = suc_buydate;
		this.progress = progress;
		this.st_id = st_id;
		this.ins_num = ins_num;
		this.ins_cate = ins_cate;
		this.tc_name = tc_name;
		this.ins_title = ins_title;
	}


	public int getSuc_num() {
		return suc_num;
	}


	public void setSuc_num(int suc_num) {
		this.suc_num = suc_num;
	}


	public String getSuc_buydate() {
		return suc_buydate;
	}


	public void setSuc_buydate(String suc_buydate) {
		this.suc_buydate = suc_buydate;
	}


	public int getProgress() {
		return progress;
	}


	public void setProgress(int progress) {
		this.progress = progress;
	}


	public String getSt_id() {
		return st_id;
	}


	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}


	public int getIns_num() {
		return ins_num;
	}


	public void setIns_num(int ins_num) {
		this.ins_num = ins_num;
	}


	public String getIns_cate() {
		return ins_cate;
	}


	public void setIns_cate(String ins_cate) {
		this.ins_cate = ins_cate;
	}


	public String getTc_name() {
		return tc_name;
	}


	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
	}


	public String getIns_title() {
		return ins_title;
	}


	public void setIns_title(String ins_title) {
		this.ins_title = ins_title;
	}


	@Override
	public String toString() {
		return "SignUpClassVO [suc_num=" + suc_num + ", suc_buydate=" + suc_buydate + ", progress=" + progress
				+ ", st_id=" + st_id + ", ins_num=" + ins_num + ", ins_cate=" + ins_cate + ", tc_name=" + tc_name
				+ ", ins_title=" + ins_title + "]";
	}

	
	
	
}
