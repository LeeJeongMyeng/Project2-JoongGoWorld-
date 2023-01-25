package webproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;






public class JGUser {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	 public boolean Login_boolean (JGUserVO sch){
		 	boolean LoginSuccess=false;
	      List<JGUserVO> Mlist = new ArrayList<JGUserVO>();
	      String sql = "SELECT * FROM olddealuser\r\n"
	      		+ "WHERE id= ?\r\n"
	      		+ "AND password = ?";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, sch.getId());
	         pstmt.setString(2, sch.getPassword());
	         rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
	         LoginSuccess=rs.next(); //해당 id,pass로 조회될땜만 true 그 외, false
	         
	         System.out.println("데이터 건수:4"+Mlist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return LoginSuccess;
	   }
	 public boolean Login_booleanE (JGUserVO sch){
		 boolean LoginSuccess=false;
		 List<JGUserVO> Mlist = new ArrayList<JGUserVO>();
		 String sql = "SELECT * FROM olddealuser\r\n"
		 		+ "WHERE email = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, sch.getEmail());
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 LoginSuccess=rs.next(); //해당 id,pass로 조회될땜만 true 그 외, false
			 
			 System.out.println("데이터 건수:2"+Mlist.size());
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러2:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return LoginSuccess;
	 }
	 //====================================================================================
	 public List<JGUserVO> getUserInfoAll(JGUserVO sch){
		 List<JGUserVO> mlist = new ArrayList<JGUserVO>();
		 String sql = "SELECT * FROM olddealuser\r\n"
		 		+ "WHERE id= ?\r\n"
		 		+ "AND password = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, sch.getId());
			 pstmt.setString(2, sch.getPassword());
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 
			 // select * ==> deptno, dname, loc
			 while(rs.next()) {
				 System.out.println("rs : " + rs);
				 // select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				 // 맞게 rs.get타입("컬럼명") 지정하여야 한다.
				 mlist.add(new JGUserVO(
						 rs.getString(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7),
						 rs.getString(8),
						 rs.getString(9),
						 rs.getString(10),
						 rs.getString(11),
						 rs.getInt(12),
						 rs.getInt(13),
						 rs.getInt(14),
						 rs.getInt(15)
						 ));
			 }
			 System.out.println("데이터 건수:1"+mlist.size());
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return mlist;
	 }	
	 
	 //====================================================================================
	 public Map<String,Object> getUserInfoAllMap(JGUserVO sch){
		 Map<String,Object> paramMap = new HashMap<String,Object>();
		 String sql = "SELECT * FROM olddealuser\r\n"
				 + "WHERE id= ?\r\n"
				 + "AND password = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, sch.getId());
			 pstmt.setString(2, sch.getPassword());
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 
			 // select * ==> deptno, dname, loc
			
			 while(rs.next()) {
				 
				 paramMap.put("id", rs.getString(1));
				 paramMap.put("password", rs.getString(2));
				 paramMap.put("userdiv", rs.getString(3));
				 paramMap.put("username", rs.getString(4));
				 paramMap.put("nickname", rs.getString(5));
				 paramMap.put("rrn", rs.getString(6));
				 paramMap.put("phonenumber", rs.getString(7));
				 paramMap.put("zipcode", rs.getString(8));
				 paramMap.put("address", rs.getString(9));
				 paramMap.put("detailaddress", rs.getString(10));
				 paramMap.put("email", rs.getString(11));
				 paramMap.put("point", rs.getString(12));
				 paramMap.put("salecount", rs.getString(13));
				 paramMap.put("buycount", rs.getString(14));
				 paramMap.put("declarationcount", rs.getString(15));
				 // select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				 // 맞게 rs.get타입("컬럼명") 지정하여야 한다.
			 }
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return paramMap;
	 }	
	 
	 //====================================================================================
	 public JGUserVO login(JGUserVO j){
		 JGUserVO mem=null;
	        // boolean isSuccess = false;
	         String sql = "SELECT *\r\n"
	               + "FROM olddealuser\r\n"
	               + "WHERE id=? and password=?";
	         try {
	            con = DB.con();
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, j.getId()); //
	            pstmt.setString(2, j.getPassword());
	            rs = pstmt.executeQuery();
	            /*
	        (String id, String pass, String name, String grade, int point, String rday)
	             */
	            if(rs.next()) {
	               mem= new JGUserVO(                     
	            		     rs.getString(1),
							 rs.getString(2),
							 rs.getString(3),
							 rs.getString(4),
							 rs.getString(5),
							 rs.getString(6),
							 rs.getString(7),
							 rs.getString(8),
							 rs.getString(9),
							 rs.getString(10),
							 rs.getString(11),
							 rs.getInt(12),
							 rs.getInt(13),
							 rs.getInt(14),
							 rs.getInt(15)                 
	                     );
	              
	            }
	            // 해당 id, pass로 조회 될 때만 true, 그 외는 false
	            
	         } catch (SQLException e) {
	            System.out.println("DB에러:"+e.getMessage());
	         } catch(Exception e) {
	            System.out.println("일반 에러:"+e.getMessage());
	         }finally {
	            DB.close(rs, pstmt, con);
	         }
	         
	         return mem;
	      }
	 public JGUserVO loginE(JGUserVO j){
		 JGUserVO mem=null;
		 // boolean isSuccess = false;
		 String sql = "SELECT * FROM olddealuser\r\n"
			 		+ "WHERE email = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, j.getEmail()); //
			 rs = pstmt.executeQuery();
			 /*
	        (String id, String pass, String name, String grade, int point, String rday)
			  */
			 if(rs.next()) {
				 mem= new JGUserVO(                     
						 rs.getString(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7),
						 rs.getString(8),
						 rs.getString(9),
						 rs.getString(10),
						 rs.getString(11),
						 rs.getInt(12),
						 rs.getInt(13),
						 rs.getInt(14),
						 rs.getInt(15)                 
						 );
				 
			 }
			 // 해당 id, pass로 조회 될 때만 true, 그 외는 false
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return mem;
	 }
	 //====================================================================================
	 public List<JGUserVO> getUserInfoAllE(JGUserVO sch){
		 List<JGUserVO> mlist = new ArrayList<JGUserVO>();
		 String sql = "SELECT * FROM olddealuser\r\n"
		 		+ "WHERE email = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, sch.getEmail());

			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 // select * ==> deptno, dname, loc
			 while(rs.next()) {
				 // select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				 // 맞게 rs.get타입("컬럼명") 지정하여야 한다.
				 mlist.add(new JGUserVO(
						 rs.getString(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getString(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7),
						 rs.getString(8),
						 rs.getString(9),
						 rs.getString(10),
						 rs.getString(11),
						 rs.getInt(12),
						 rs.getInt(13),
						 rs.getInt(14),
						 rs.getInt(15)
						 ));
			 }
			 System.out.println("데이터 건수2:"+mlist.size());
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return mlist;
	 }	
	 //====================================================================================	 
	 public boolean checkId (String id){
		 	boolean isSuccess=false;
	      List<JGUserVO> Mlist = new ArrayList<JGUserVO>();
	      String sql = "SELECT * FROM olddealuser\r\n"
	      		+ "WHERE id=?";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
	         isSuccess=rs.next(); //해당 id,pass로 조회될땜만 true 그 외, false
	         
	         //System.out.println("데이터 건수:"+Mlist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return isSuccess;
	   }
	 //====================================================================================	 
	 public boolean checkRrn (String rrn){
		 boolean isrrnSuccess=false;
		 String sql = "SELECT * FROM olddealuser\r\n"
				 + "WHERE id=?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, rrn);
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 isrrnSuccess=rs.next(); //해당 id,pass로 조회될땜만 true 그 외, false
			 
			 //System.out.println("데이터 건수:"+Mlist.size());
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return isrrnSuccess;
	 }
	 //====================================================================================	 

	 public int insertJGUser(JGUserVO d) {
			String sql = "INSERT INTO olddealuser VALUES(?,?,?,?,?,?,?,?,?,?,?,1000,0,0,0)";
			int Success = 0;
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, d.getId());
				pstmt.setString(2, d.getPassword());
				pstmt.setString(3, d.getUserdiv());
				pstmt.setString(4, d.getUsername());
				pstmt.setString(5, d.getNickname());
				pstmt.setString(6, d.getRrn());
				pstmt.setString(7, d.getPhonenumber());
				pstmt.setString(8, d.getZipcode());
				pstmt.setString(9, d.getAddress());
				pstmt.setString(10, d.getDetailaddress());
				pstmt.setString(11, d.getEmail());
				//System.out.println("등록건수:"+pstmt.executeUpdate());
				Success = pstmt.executeUpdate(); 
				
				
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
	
	 //====================================================================================	 
	 
	 public void userdel(JGUserVO d) {
		 String sql = "DELETE FROM olddealuser WHERE id=? AND password=?";
		 
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, d.getId());
			 pstmt.setString(2, d.getPassword());
			
			 pstmt.executeUpdate();
			 
			 con.commit();
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
			 try {
				 con.rollback();
			 } catch (SQLException e1) {
				 System.out.println("rollback 에러:"+e1.getMessage());
			 }
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
	 }
	 //====================================================================================	
	 public List<JGUserVO> getTop3User(){
		 List<JGUserVO> mlist = new ArrayList<JGUserVO>();
		 String sql = "SELECT nickname, buycount,salecount\r\n"
		 		+ "  FROM (SELECT nickname,salecount,BUYCOUNT, buycount+salecount AS bs\r\n"
		 		+ "   FROM olddealuser\r\n"
		 		+ "   ORDER BY bs DESC) WHERE ROWNUM <= 3";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 // select * ==> deptno, dname, loc
			 while(rs.next()) {
				 // select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				 // 맞게 rs.get타입("컬럼명") 지정하여야 한다.
				 mlist.add(new JGUserVO(
						 rs.getString(1),
						 rs.getInt(2),						 
						 rs.getInt(3)						 
						 ));
			 }
			 System.out.println("데이터 건수3:"+mlist.size());
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return mlist;
	 }	
	 
	 //====================================================================================
	 public int updateJGUser(JGUserVO d) {
			String sql = "UPDATE olddealuser\r\n"
					+ "SET PASSWORD =?,\r\n"
					+ "	NICKNAME =?,\r\n"
					+ "	PHONENUMBER =?,\r\n"
					+ "	ZIPCODE =?,\r\n"
					+ "	ADDRESS =?,\r\n"
					+ "	DETAILADDRESS =?,\r\n"
					+ "	EMAIL =?\r\n"
					+ "WHERE id=?";
			int uptSuccess = 0;
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, d.getPassword());
				pstmt.setString(2, d.getNickname());
				pstmt.setString(3, d.getPhonenumber());
				pstmt.setString(4, d.getZipcode());
				pstmt.setString(5, d.getAddress());
				pstmt.setString(6, d.getDetailaddress());
				pstmt.setString(7, d.getEmail());
				pstmt.setString(8, d.getId());
				//System.out.println("등록건수:"+pstmt.executeUpdate());
				uptSuccess = pstmt.executeUpdate();
				
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
			return uptSuccess;
		}
	public static void main(String[] args) {


	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 삭제필ㅇ
	public List<Map<String,Object>> getUserInfoAllMap2(JGUserVO sch){
		 
		 List arr = new ArrayList<>();
		 String sql = "SELECT * FROM olddealuser\r\n"
				 + "WHERE id= ?\r\n"
				 + "AND password = ?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, sch.getId());
			 pstmt.setString(2, sch.getPassword());
			 rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			 
			 // select * ==> deptno, dname, loc
			
			 while(rs.next()) {
				 Map<String,Object> paramMap = new HashMap<String,Object>();
				 paramMap.put("id", rs.getString(1));
				 paramMap.put("password", rs.getString(2));
				 paramMap.put("userdiv", rs.getString(3));
				 paramMap.put("username", rs.getString(4));
				 paramMap.put("nickname", rs.getString(5));
				 paramMap.put("rrn", rs.getString(6));
				 paramMap.put("phonenumber", rs.getString(7));
				 paramMap.put("zipcode", rs.getString(8));
				 paramMap.put("address", rs.getString(9));
				 paramMap.put("detailaddress", rs.getString(10));
				 paramMap.put("email", rs.getString(11));
				 paramMap.put("point", rs.getString(12));
				 paramMap.put("salecount", rs.getString(13));
				 paramMap.put("buycount", rs.getString(14));
				 paramMap.put("declarationcount", rs.getString(15));
				 arr.add(paramMap);
				 // select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				 // 맞게 rs.get타입("컬럼명") 지정하여야 한다.
			 }
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return arr;
	 }	

}
