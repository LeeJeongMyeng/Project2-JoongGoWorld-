package webproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Alert {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int insertAlert(AlertVO d) { // 알람 넣기용
		String sql = "INSERT INTO alert values('alert-'||alert_seq.nextval,?,?,?,sysdate,?,?,?,?)";
		int Success = 0;
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getId());
			pstmt.setString(2, d.getSendid());
			pstmt.setString(3, d.getAlertcontent());
			pstmt.setString(4, d.getMoveurl());
			pstmt.setInt(5, d.getQnano());
			pstmt.setInt(6, d.getProductno());
			pstmt.setString(7, d.getAlerttype());
			


			Success= pstmt.executeUpdate();
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback 에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return Success;
	}
	
	//=============================================================================
	public int countMAlert(AlertVO alert){ //알람 그림 있나없나 확인용
		int count=0;
		String sql = "SELECT count(*) FROM alert\r\n"
				+ "WHERE id=? or id=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,alert.getId());
			pstmt.setString(2,alert.getName());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count= rs.getInt(1);
			}
			 
			
			System.out.println("카운트:"+count);
					
			
		
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}		
		return count;
	}
	
	public List<AlertVO> getAlertList(AlertVO alert){ //top에 불러들이는 놈
	      List<AlertVO> tlist = new ArrayList<AlertVO>();
	      String sql = "SELECT a.*,TO_CHAR(TO_DATE(r.RESDATE,'yyyy/mm/dd HH24:MI:SS'),\r\n"
	      		+ "'YYYY/MM/DD - HH24\"시\"MI\"분\"') AS resdate,r.rno\r\n"
	      		+ "FROM ALERT a \r\n"
	      		+ "LEFT OUTER JOIN RESERVE r\r\n"
	      		+ "ON a.sendid  =r.ID\r\n"
	      		+ "WHERE a.id=? OR a.id=?";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, alert.getId());
	         pstmt.setString(2, alert.getName());
	         rs = pstmt.executeQuery(); 
	         while(rs.next()) {
	            tlist.add(new AlertVO(
	            		   rs.getString("alertno"),
	            		   rs.getString("id"),
	            		   rs.getString("sendid"),
	                       rs.getString("alertcontent"),
	                       rs.getString("moveurl"),
	                       rs.getInt("qnano"),
	                       rs.getInt("productno"),
	                       rs.getString("alerttype"),
	                       rs.getString("resdate")	                       
	            		));}
	         
	         System.out.println("데이터 건수:"+tlist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("ddDB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return tlist;
	   }

	//======================================================================
	public int getAlert(String alertno){
		int Succcess=0;
		String sql = "SELECT a.*,TO_CHAR(TO_DATE(r.RESDATE,'yyyy/mm/dd HH24:MI:SS'),\r\n"
				+ "'YYYY/MM/DD - HH24\"시\"MI\"분\"') AS resdate,r.RNO\r\n"
				+ "FROM ALERT a \r\n"
				+ "LEFT OUTER JOIN RESERVE r\r\n"
				+ "ON a.sendid  =r.ID\r\n"
				+ "WHERE a.ALERTNO=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,alertno);
			
			rs = pstmt.executeQuery();
			rs.next(); 
			String id = rs.getString(3);
			String sendid = rs.getString(2);
			String date = rs.getString(10);
			String alertcontent="님이 거래요청을 수락하셨습니다.<br>거래시간:"+date;
			String moveurl=	rs.getString(6);
			int qnano=rs.getInt(7);
			int productno =rs.getInt(8);
			String alerttype = "수락";
			String dealstat = "예약중";
			System.out.println(productno);
			
			String sql2 = "UPDATE olderproduct\r\n"
					+ "SET dealstat = ?\r\n"
					+ "WHERE PRODUCTNO = ?";
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql2);
			
			pstmt.setString(1, dealstat);
			pstmt.setInt(2, productno);
			pstmt.executeUpdate();
			
			
				Alert al = new Alert();
				al.DeleteReserveAll(id); //수락한 사람 이외 약속신청 데이터 삭제
				al.DeleteAlertALL(productno); //수락했으니, 해당 판매글에 대한 약속알림 전체삭제
				AlertVO alert2 = new AlertVO(id,sendid,alertcontent,moveurl,qnano,productno,alerttype);
				Succcess=al.insertAlert(alert2); // 수락 대상에게 알림메시지 보내기
				
		
					
			
		
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}		
		return Succcess;
	}
	//======================================================================
	public int DeleteAlert(AlertVO d) {
		 String sql = "DELETE alert\r\n"
		 		+ "WHERE alertno=?";
		 int Success2 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, d.getAlertno());

			 Success2 = pstmt.executeUpdate();
				
			 con.commit();
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
			 try {
				 con.rollback();
			 } catch (SQLException e1) {
				 // TODO Auto-generated catch block
				 System.out.println("rollback 에러:"+e1.getMessage());
			 }
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 return Success2;
	 }
	//======================================================================
	
	//======================================================================
	public void DeleteReserveAll(String id) { //수락 누르면 나머지 약속잡기 제거
		String sql = "DELETE reserve\r\n"
				+ "    WHERE NOT id = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			pstmt.executeUpdate();
			
			con.commit();
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback 에러:"+e1.getMessage());
			}
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
	}
	//==========================================================================
	public int DeleteAlertALL(int productno) { //수락누르면 해당 물품메시지 전부 제거
		 String sql = "DELETE alert\r\n"
		 		+ "WHERE productno = ? AND alerttype='약속신청'";
		 int Success2 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1,productno);

			 Success2 = pstmt.executeUpdate();
				
			 con.commit();
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
			 try {
				 con.rollback();
			 } catch (SQLException e1) {
				 // TODO Auto-generated catch block
				 System.out.println("rollback 에러:"+e1.getMessage());
			 }
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 return Success2;
	 }
	public static void main(String[] args) {
		
	}

}
