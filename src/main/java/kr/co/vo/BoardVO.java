package kr.co.vo;

import java.util.Date;

public class BoardVO {
	
	private int boardno;
	private String userid;
	private String title;
	private String content;
	private Date wdate;
	private String boardimg;

	
	
	
	
	
	public String getBoardimg() {
		return boardimg;
	}
	public void setBoardimg(String boardimg) {
		this.boardimg = boardimg;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	@Override
	public String toString() {
		return "BoardVO [boardno=" + boardno + ", userid=" + userid + ", title=" + title + ", content=" + content
				+ ", wdate=" + wdate + ", boardimg=" + boardimg + "]";
	}
	
	

	
	
	
	
	

}
