package webproject;

import java.util.Date;

public class AlertVO {
	private String alertno;
	private String id; 
	private String sendid; 
	private String name; //아이디랑 동시에 이름확인용임 건들 ㄴㄴ
	private String alertcontent;
	private Date alertdate;
	private String moveurl;
	private int qnano;
	private int productno;
	private String resdate;
	private String alerttype;
	
	
	public AlertVO() {
	}
   
	


	//top에 불러오는용도
	public AlertVO(String alertno, String id, String sendid, String alertcontent, String moveurl, int qnano,
			int productno, String alerttype, String resdate) {
		this.alertno = alertno;
		this.id = id;
		this.sendid = sendid;
		this.alertcontent = alertcontent;
		this.moveurl = moveurl;
		this.qnano = qnano;
		this.productno = productno;
		this.resdate = resdate;
		this.alerttype = alerttype;
	}

	



	public AlertVO(String id, String sendid, String alertcontent, String moveurl, int qnano, int productno,
			String alerttype) {
		this.id = id;
		this.sendid = sendid;
		this.alertcontent = alertcontent;
		this.moveurl = moveurl;
		this.qnano = qnano;
		this.productno = productno;
		this.alerttype = alerttype;
	}

	public String getAlertno() {
		return alertno;
	}
	public void setAlertno(String alertno) {
		this.alertno = alertno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAlertcontent() {
		return alertcontent;
	}
	public void setAlertcontent(String alertcontent) {
		this.alertcontent = alertcontent;
	}
	public Date getAlertdate() {
		return alertdate;
	}
	public void setAlertdate(Date alertdate) {
		this.alertdate = alertdate;
	}
	public String getMoveurl() {
		return moveurl;
	}
	public void setMoveurl(String moveurl) {
		this.moveurl = moveurl;
	}
	public int getQnano() {
		return qnano;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getResdate() {
		return resdate;
	}


	public void setResdate(String resdate) {
		this.resdate = resdate;
	}


	public String getAlerttype() {
		return alerttype;
	}


	public void setAlerttype(String alerttype) {
		this.alerttype = alerttype;
	}


	public String getSendid() {
		return sendid;
	}

	public void setSendid(String sendid) {
		this.sendid = sendid;
	}
	
	
}
