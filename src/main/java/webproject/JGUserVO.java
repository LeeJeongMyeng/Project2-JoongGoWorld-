package webproject;

import java.util.Map;

public class JGUserVO {
	private String id;
	private String password;
	private String userdiv;
	private String username;
	private String nickname;
	private String rrn;
	private String phonenumber;
	private String zipcode;
	private String address;
	private String detailaddress;
	private String email;
	private int point;
	private int salecount;
	private int buycount;
	private int declarationcount;
	private int bs;
	public JGUserVO() {
	}
	
	
	
	public JGUserVO(String id,String password, String nickname, String phonenumber, String zipcode, String address,
			String detailaddress, String email) {
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.email = email;
	}



	public JGUserVO(String id, String password, String userdiv, String username, String nickname, String rrn,
			String phonenumber, String zipcode, String address, String detailaddress, String email, int point,
			int salecount, int buycount, int declarationcount) {
		this.id = id;
		this.password = password;
		this.userdiv = userdiv;
		this.username = username;
		this.nickname = nickname;
		this.rrn = rrn;
		this.phonenumber = phonenumber;
		this.zipcode = zipcode;
		this.address = address;
		this.detailaddress = detailaddress;
		this.email = email;
		this.point = point;
		this.salecount = salecount;
		this.buycount = buycount;
		this.declarationcount = declarationcount;
	}
	
	public static String NVL(String data) {
	
		data = (data == null) ? "" : data;
		return data;
	}
	public JGUserVO(Map<String,Object> usermap) {
		
		this.id = NVL((String) usermap.get("id"));
		this.password = NVL((String) usermap.get("password"));;
		this.userdiv = NVL((String) usermap.get("userdiv"));;
		this.username = NVL((String) usermap.get("username"));;
		this.nickname = NVL((String) usermap.get("nickname"));;
		this.rrn = NVL((String) usermap.get("rrn"));;
		this.phonenumber = NVL((String) usermap.get("phonenumber"));;
		this.zipcode = NVL((String) usermap.get("zipcode"));;
		this.address = NVL((String) usermap.get("address"));;
		this.detailaddress = NVL((String) usermap.get("detailaddress"));;
		this.email = NVL((String) usermap.get("email"));;
		this.point = Integer.parseInt(NVL((String) usermap.get("point")));
		this.salecount = Integer.parseInt(NVL((String) usermap.get("salecount")));
		this.buycount = Integer.parseInt(NVL((String) usermap.get("buycount")));
		this.declarationcount = Integer.parseInt(NVL((String) usermap.get("declarationcount")));
	}

	
	public JGUserVO(String nickname, int salecount, int buycount) {
		this.nickname = nickname;
		this.salecount = salecount;
		this.buycount = buycount;
	}

	public JGUserVO(String nickname, int bs) {
		this.nickname = nickname;
		this.bs = bs;
	}

	public JGUserVO(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public JGUserVO(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserdiv() {
		return userdiv;
	}
	public void setUserdiv(String userdiv) {
		this.userdiv = userdiv;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getSalecount() {
		return salecount;
	}
	public void setSalecount(int salecount) {
		this.salecount = salecount;
	}
	public int getBuycount() {
		return buycount;
	}
	public void setBuycount(int buycount) {
		this.buycount = buycount;
	}
	public int getDeclarationcount() {
		return declarationcount;
	}
	public void setDeclarationcount(int declarationcount) {
		this.declarationcount = declarationcount;
	}

	public int getBs() {
		return bs;
	}

	public void setBs(int bs) {
		this.bs = bs;
	}
	
	
	
}
