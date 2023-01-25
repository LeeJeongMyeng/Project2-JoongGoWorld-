package webproject;

import java.util.Date;

public class GesipanVO {
 
 private int gesiqnano;
 private String gesititle;
 private String gesiid;
 private Date gesiregitdate;
 private String gesiqnacontent;
 private String gesiansercontent;
 private String status;
public GesipanVO() {
}


public GesipanVO(int gesiqnano, String gesititle, String gesiid, Date gesiregitdate, String gesiqnacontent,
		String gesiansercontent, String status) {
	this.gesiqnano = gesiqnano;
	this.gesititle = gesititle;
	this.gesiid = gesiid;
	this.gesiregitdate = gesiregitdate;
	this.gesiqnacontent = gesiqnacontent;
	this.gesiansercontent = gesiansercontent;
	this.status = status;
}




public GesipanVO(int gesiqnano) {
	this.gesiqnano = gesiqnano;
}


public GesipanVO(int gesiqnano, String gesititle, String gesiqnacontent) {
	this.gesiqnano = gesiqnano;
	this.gesititle = gesititle;
	this.gesiqnacontent = gesiqnacontent;
}


public GesipanVO(String gesititle, String gesiid, String gesiqnacontent, String gesiansercontent) {
	this.gesititle = gesititle;
	this.gesiid = gesiid;
	this.gesiqnacontent = gesiqnacontent;
	this.gesiansercontent = gesiansercontent;
}

public GesipanVO(int gesiqnano,String gesititle,String gesiid, Date gesiregitdate, String gesiqnacontent,
		String gesiansercontent) {
	this.gesiqnano = gesiqnano;
	this.gesititle = gesititle;
	this.gesiid = gesiid;
	this.gesiregitdate = gesiregitdate;
	this.gesiqnacontent = gesiqnacontent;
	this.gesiansercontent = gesiansercontent;
}

public GesipanVO(int gesiqnano, String gesiid) {
	this.gesiqnano = gesiqnano;
	this.gesiid = gesiid;
}

public int getGesiqnano() {
	return gesiqnano;
}
public void setGesiqnano(int gesiqnano) {
	this.gesiqnano = gesiqnano;
}
public String getGesititle() {
	return gesititle;
}
public void setGesititle(String gesititle) {
	this.gesititle = gesititle;
}
public String getGesiid() {
	return gesiid;
}
public void setGesiid(String gesiid) {
	this.gesiid = gesiid;
}
public Date getGesiregitdate() {
	return gesiregitdate;
}
public void setGesiregitdate(Date gesiregitdate) {
	this.gesiregitdate = gesiregitdate;
}
public String getGesiqnacontent() {
	return gesiqnacontent;
}
public void setGesiqnacontent(String gesiqnacontent) {
	this.gesiqnacontent = gesiqnacontent;
}
public String getGesiansercontent() {
	return gesiansercontent;
}
public void setGesiansercontent(String gesiansercontent) {
	this.gesiansercontent = gesiansercontent;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

 
}
