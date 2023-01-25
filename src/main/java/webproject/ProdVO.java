package webproject;

import java.util.Date;

public class ProdVO {
	private int productno;
	private String productname;
	private String kind;
	private String dealmethod;
	private int price;
	private String sharewhether;
	private String priceoffer;
	private String information;
	private Date registdate;
	private String dealstat;
	private String faddressval;
	private String saddressval;
	private String caddressval;
	private String daddressval;
	private String writerid;
	private int viewcount;
	private int likecount;
	private String imgno;
	private String imgname;
	private String id;
	private int imgcnt;
	
	public ProdVO() {
	}
	

	public ProdVO(int productno) {
		this.productno = productno;
	}



	public ProdVO(String imgname) {
		this.imgname = imgname;
	}
	
	
	



	public ProdVO(String imgname, int imgcnt) {
		this.imgname = imgname;
		this.imgcnt = imgcnt;
	}

	public ProdVO(String productname, String kind, String dealmethod, int price, String sharewhether,
			String priceoffer, String information, String faddressval, String saddressval, String caddressval,
			String daddressval,int productno) {
		this.productname = productname;
		this.kind = kind;
		this.dealmethod = dealmethod;
		this.price = price;
		this.sharewhether = sharewhether;
		this.priceoffer = priceoffer;
		this.information = information;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.productno = productno;
	}



	public ProdVO(int productno, String productname, String kind, String dealmethod, int price, String sharewhether,
			String priceoffer, String information, Date registdate, String dealstat, String faddressval,
			String saddressval, String caddressval, String daddressval, String writerid,int viewcount,int likecount) {
		this.productno = productno;
		this.productname = productname;
		this.kind = kind;
		this.dealmethod = dealmethod;
		this.price = price;
		this.sharewhether = sharewhether;
		this.priceoffer = priceoffer;
		this.information = information;
		this.registdate = registdate;
		this.dealstat = dealstat;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.writerid = writerid;		
		this.viewcount = viewcount;
		this.likecount = likecount;
	}
	public ProdVO(int productno, String productname, String kind, String dealmethod, int price, String sharewhether,
			String priceoffer, String information, Date registdate, String dealstat, String faddressval,
			String saddressval, String caddressval, String daddressval, String writerid,int viewcount,int likecount,String imgname) {
		this.productno = productno;
		this.productname = productname;
		this.kind = kind;
		this.dealmethod = dealmethod;
		this.price = price;
		this.sharewhether = sharewhether;
		this.priceoffer = priceoffer;
		this.information = information;
		this.registdate = registdate;
		this.dealstat = dealstat;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.writerid = writerid;		
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.imgname = imgname;
	}



	public ProdVO(String productname, int price, String faddressval, String saddressval, String caddressval,
			String daddressval, String imgname) {
		this.productname = productname;
		this.price = price;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.imgname = imgname;
	}

	


	public ProdVO(int productno, String productname, String kind, String dealmethod, int price, String sharewhether,
			String priceoffer, String information, Date registdate, String dealstat, String faddressval,
			String saddressval, String caddressval, String daddressval, String writerid,int viewcount,int likecount, String imgno,
			String imgname) {
		this.productno = productno;
		this.productname = productname;
		this.kind = kind;
		this.dealmethod = dealmethod;
		this.price = price;
		this.sharewhether = sharewhether;
		this.priceoffer = priceoffer;
		this.information = information;
		this.registdate = registdate;
		this.dealstat = dealstat;
		this.faddressval = faddressval;
		this.saddressval = saddressval;
		this.caddressval = caddressval;
		this.daddressval = daddressval;
		this.writerid = writerid;
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.imgno = imgno;
		this.imgname = imgname;
	}



	public int getProductno() {
		return productno;
	}



	public void setProductno(int productno) {
		this.productno = productno;
	}



	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	
	public String getDealmethod() {
		return dealmethod;
	}

	public void setDealmethod(String dealmethod) {
		this.dealmethod = dealmethod;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSharewhether() {
		return sharewhether;
	}

	public void setSharewhether(String sharewhether) {
		this.sharewhether = sharewhether;
	}

	public String getPriceoffer() {
		return priceoffer;
	}

	public void setPriceoffer(String priceoffer) {
		this.priceoffer = priceoffer;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public String getDealstat() {
		return dealstat;
	}

	public void setDealstat(String dealstat) {
		this.dealstat = dealstat;
	}

	public String getFaddressval() {
		return faddressval;
	}

	public void setFaddressval(String faddressval) {
		this.faddressval = faddressval;
	}

	public String getSaddressval() {
		return saddressval;
	}

	public void setSaddressval(String saddressval) {
		this.saddressval = saddressval;
	}

	public String getCaddressval() {
		return caddressval;
	}

	public void setCaddressval(String caddressval) {
		this.caddressval = caddressval;
	}

	public String getDaddressval() {
		return daddressval;
	}

	public void setDaddressval(String daddressval) {
		this.daddressval = daddressval;
	}

	public String getWriterid() {
		return writerid;
	}

	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}

	
	public int getViewcount() {
		return viewcount;
	}



	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}



	public int getLikecount() {
		return likecount;
	}



	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}



	public String getImgname() {
		return imgname;
	}

	
	
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}



	public String getImgno() {
		return imgno;
	}



	public void setImgno(String imgno) {
		this.imgno = imgno;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public int getImgcnt() {
		return imgcnt;
	}



	public void setImgcnt(int imgcnt) {
		this.imgcnt = imgcnt;
	}
	
	
	    
	   
	   
}
