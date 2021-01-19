package kr.co.vo;

import java.util.Date;

public class NakchalVO {

	private int nakno;
	private int sno;
	private String userid;
	private int nakprice;
	private Date nakdate;
	private String nakstatus;
	private String nakimg;
	
	
	
	
	
	public String getNakimg() {
		return nakimg;
	}
	public void setNakimg(String nakimg) {
		this.nakimg = nakimg;
	}
	public String getNakstatus() {
		return nakstatus;
	}
	public void setNakstatus(String nakstatus) {
		this.nakstatus = nakstatus;
	}
	public int getNakno() {
		return nakno;
	}
	public void setNakno(int nakno) {
		this.nakno = nakno;
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
	public int getNakprice() {
		return nakprice;
	}
	public void setNakprice(int nakprice) {
		this.nakprice = nakprice;
	}
	
	

	public Date getNakdate() {
		return nakdate;
	}
	public void setNakdate(Date nakdate) {
		this.nakdate = nakdate;
	}
	@Override
	public String toString() {
		return "NakchalVO [nakno=" + nakno + ", sno=" + sno + ", userid=" + userid + ", nakprice=" + nakprice
				+ ", nakdate=" + nakdate + ", nakstatus=" + nakstatus + ", nakimg=" + nakimg + "]";
	}
	
	
	
	
	
	
}
