package kr.co.vo;

import java.util.Date;

public class IpchalVO {

	private int ipno;
	private int sno;
	private String userid;
	private int ipprice;
	private Date ipdate;
	
	
	
	
	public int getIpno() {
		return ipno;
	}
	public void setIpno(int ipno) {
		this.ipno = ipno;
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
	public int getIpprice() {
		return ipprice;
	}
	public void setIpprice(int ipprice) {
		this.ipprice = ipprice;
	}
	public Date getIpdate() {
		return ipdate;
	}
	public void setIpdate(Date ipdate) {
		this.ipdate = ipdate;
	}
	@Override
	public String toString() {
		return "IpchalVO [ipno=" + ipno + ", sno=" + sno + ", userid=" + userid + ", ipprice=" + ipprice + ", ipdate="
				+ ipdate + "]";
	}
	
	
	
	
	
}
