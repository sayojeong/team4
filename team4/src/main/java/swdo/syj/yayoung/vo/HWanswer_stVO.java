package swdo.syj.yayoung.vo;

public class HWanswer_stVO {

	private int hw_num;
	private int hw_answer;
	private String st_id;
	private String st_correct;
	private int vid_num;
	private String m_question;
	private int m_answer;
	private String m_exp;
	private int ins_num;
	
	
	public HWanswer_stVO() {}
	
	


	public HWanswer_stVO(int hw_num, int hw_answer, String st_id, String st_correct, int vid_num, String m_question,
			int m_answer, String m_exp, int ins_num) {
		super();
		this.hw_num = hw_num;
		this.hw_answer = hw_answer;
		this.st_id = st_id;
		this.st_correct = st_correct;
		this.vid_num = vid_num;
		this.m_question = m_question;
		this.m_answer = m_answer;
		this.m_exp = m_exp;
		this.ins_num = ins_num;
	}




	public int getHw_num() {
		return hw_num;
	}


	public void setHw_num(int hw_num) {
		this.hw_num = hw_num;
	}


	public int getHw_answer() {
		return hw_answer;
	}


	public void setHw_answer(int hw_answer) {
		this.hw_answer = hw_answer;
	}


	public String getSt_id() {
		return st_id;
	}


	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}


	public String getSt_correct() {
		return st_correct;
	}


	public void setSt_correct(String st_correct) {
		this.st_correct = st_correct;
	}


	public int getVid_num() {
		return vid_num;
	}


	public void setVid_num(int vid_num) {
		this.vid_num = vid_num;
	}


	public String getM_question() {
		return m_question;
	}


	public void setM_question(String m_question) {
		this.m_question = m_question;
	}


	public int getM_answer() {
		return m_answer;
	}


	public void setM_answer(int m_answer) {
		this.m_answer = m_answer;
	}


	public String getM_exp() {
		return m_exp;
	}


	public void setM_exp(String m_exp) {
		this.m_exp = m_exp;
	}


	public int getIns_num() {
		return ins_num;
	}


	public void setIns_num(int ins_num) {
		this.ins_num = ins_num;
	}


	@Override
	public String toString() {
		return "HWanswer_stVO [hw_num=" + hw_num + ", hw_answer=" + hw_answer + ", st_id=" + st_id + ", st_correct="
				+ st_correct + ", vid_num=" + vid_num + ", m_question=" + m_question + ", m_answer=" + m_answer
				+ ", m_exp=" + m_exp + ", ins_num=" + ins_num + "]";
	}

	
	
	
}
