package kr.co.vo;

import java.util.Date;




public class SangpoomcVO {
	
	private int sno;
	private String sname;
	private Date opendate;
	private String closedate;
	private String scontent;
	private String status;
	private String startprice;
	private String thumbimg;
	private String img;
	private String sartist;
	private String syear;
	private String stype;
	private String ssize;
	
	private String nowprice;
	
	
	

	
	

	
	
	
	
	

	

	
	
	
	
	
	public String getSartist() {
		return sartist;
	}
	public void setSartist(String sartist) {
		this.sartist = sartist;
	}
	public String getSyear() {
		return syear;
	}
	public void setSyear(String syear) {
		this.syear = syear;
	}
	public String getStype() {
		return stype;
	}
	public void setStype(String stype) {
		this.stype = stype;
	}
	public String getSsize() {
		return ssize;
	}
	public void setSsize(String ssize) {
		this.ssize = ssize;
	}
	
	public String getNowprice() {
		return nowprice;
	}
	public void setNowprice(String nowprice) {
		this.nowprice = nowprice;
	}
	public String getThumbimg() {
		return thumbimg;
	}
	public void setThumbimg(String thumbimg) {
		this.thumbimg = thumbimg;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Date getOpendate() {
		return opendate;
	}
	public void setOpendate(Date opendate) {
		this.opendate = opendate;
	}
	public String getClosedate() {
		return closedate;
	}
	public void setClosedate(String closedate) {
		this.closedate = closedate;
	}
	
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStartprice() {
		return startprice;
	}
	public void setStartprice(String startprice) {
		this.startprice = startprice;
	}
	@Override
	public String toString() {
		return "SangpoomcVO [sno=" + sno + ", sname=" + sname + ", opendate=" + opendate + ", closedate=" + closedate
				+ ", scontent=" + scontent + ", status=" + status + ", startprice=" + startprice + ", thumbimg="
				+ thumbimg + ", img=" + img + ", sartist=" + sartist + ", syear=" + syear + ", stype=" + stype
				+ ", ssize=" + ssize + ", nowprice=" + nowprice + "]";
	}
	
	
	
	
	
	

}//class end