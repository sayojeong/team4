package swdo.syj.yayoung.vo;

public class StudentWAnswer {
	
	private int wa_num;
	private String wa_stans;
	private String w_question;
	private String w_pointexp;
	private String wa_tcomment;
	private int vid_num;
	private String st_id;
	
	public StudentWAnswer() {
	}
	
	

	public StudentWAnswer(int wa_num, String wa_stans, String w_question, String w_pointexp, String wa_tcomment,
			int vid_num, String st_id) {
		super();
		this.wa_num = wa_num;
		this.wa_stans = wa_stans;
		this.w_question = w_question;
		this.w_pointexp = w_pointexp;
		this.wa_tcomment = wa_tcomment;
		this.vid_num = vid_num;
		this.st_id = st_id;
	}



	public int getWa_num() {
		return wa_num;
	}

	public void setWa_num(int wa_num) {
		this.wa_num = wa_num;
	}

	public String getWa_stans() {
		return wa_stans;
	}

	public void setWa_stans(String wa_stans) {
		this.wa_stans = wa_stans;
	}

	public String getW_question() {
		return w_question;
	}

	public void setW_question(String w_question) {
		this.w_question = w_question;
	}

	public String getW_pointexp() {
		return w_pointexp;
	}

	public void setW_pointexp(String w_pointexp) {
		this.w_pointexp = w_pointexp;
	}

	public String getWa_tcomment() {
		return wa_tcomment;
	}

	public void setWa_tcomment(String wa_tcomment) {
		this.wa_tcomment = wa_tcomment;
	}

	public int getVid_num() {
		return vid_num;
	}

	public void setVid_num(int vid_num) {
		this.vid_num = vid_num;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	@Override
	public String toString() {
		return "StudentWAnswer [wa_num=" + wa_num + ", wa_stans=" + wa_stans + ", w_question=" + w_question
				+ ", w_pointexp=" + w_pointexp + ", wa_tcomment=" + wa_tcomment + ", vid_num=" + vid_num + ", st_id="
				+ st_id + "]";
	}
	
	

}
