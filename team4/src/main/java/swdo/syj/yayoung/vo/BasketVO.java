package swdo.syj.yayoung.vo;

public class BasketVO {
	
	private int bas_num;
	private int ins_num;
	private String st_id;
	private String ins_title;
	private int ins_price;
	
	public BasketVO(){}

	public BasketVO(int bas_num, int ins_num, String st_id, String ins_title, int ins_price) {
		super();
		this.bas_num = bas_num;
		this.ins_num = ins_num;
		this.st_id = st_id;
		this.ins_title = ins_title;
		this.ins_price = ins_price;
	}

	public int getBas_num() {
		return bas_num;
	}

	public void setBas_num(int bas_num) {
		this.bas_num = bas_num;
	}

	public int getIns_num() {
		return ins_num;
	}

	public void setIns_num(int ins_num) {
		this.ins_num = ins_num;
	}

	public String getSt_id() {
		return st_id;
	}

	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}

	public String getIns_title() {
		return ins_title;
	}

	public void setIns_title(String ins_title) {
		this.ins_title = ins_title;
	}

	public int getIns_price() {
		return ins_price;
	}

	public void setIns_price(int ins_price) {
		this.ins_price = ins_price;
	}

	@Override
	public String toString() {
		return "BasketVO [bas_num=" + bas_num + ", ins_num=" + ins_num + ", st_id=" + st_id + ", ins_title=" + ins_title
				+ ", ins_price=" + ins_price + "]";
	}
}
