package kr.co.vo;



public class WishVO {

	private int cno;
	private int sno;
	private String userid;
	private String wishimg;
	private String sname;
	
	
	
	
	
	
	public String getWishimg() {
		return wishimg;
	}
	public void setWishimg(String wishimg) {
		this.wishimg = wishimg;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "WishVO [cno=" + cno + ", sno=" + sno + ", userid=" + userid + ", wishimg=" + wishimg + ", sname="
				+ sname + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
