package kr.test.vo;

import java.util.Date;

public class BoardVO {
	
	private int idx;
	private String writer;
	private String title;
	private String content;
	private int ref;
	private Date reg_date;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", writer=" + writer + ", title=" + title + ", content=" + content + ", ref="
				+ ref + ", reg_date=" + reg_date + "]";
	}
	
}
