package swdo.syj.yayoung.vo;

public class NoteVO {
	private int note_num;
	private String st_id;
	private String note_title;
	private String note_content;
	
	public NoteVO() {
	}

	public NoteVO(int note_num, String st_id, String note_title, String note_content) {
		super();
		this.note_num = note_num;
		this.st_id = st_id;
		this.note_title = note_title;
		this.note_content = note_content;
	}

	public int getNote_num() {
		return note_num;
	}

	public void setNote_num(int note_num) {
		this.note_num = note_num;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getNote_title() {
		return note_title;
	}

	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}

	public String getNote_content() {
		return note_content;
	}

	public void setNote_content(String note_content) {
		this.note_content = note_content;
	}

	@Override
	public String toString() {
		return "NoteVO [note_num=" + note_num + ", st_id=" + st_id + ", note_title=" + note_title + ", note_content="
				+ note_content + "]";
	}

	
	
	
}
