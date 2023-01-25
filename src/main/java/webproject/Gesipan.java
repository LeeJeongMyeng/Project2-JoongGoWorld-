package webproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




public class Gesipan {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	

	
	
	public List<GesipanVO> getGesiAllList(GesipanVO sch){
		List<GesipanVO> dlist = new ArrayList<GesipanVO>();
		String sql = "SELECT * FROM QNA\r\n"
				+ "WHERE ( id || title ) like '%'||?||'%'\r\n"
				+ "ORDER BY REGITDATE  DESC";
		
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			// 위 sql의 ?에 해당하는 문자열을 mapping해서 데이터를 전달
			// 1. 위 형태로 ?로 설정하는 해당 데이터 형태만 입력이 되지,
			// sql injection이 처리되지 않는다.
			// 2. ?로 같은 유형을 sql을 먼저 서버에 전달되기에 한번 컴파일된 이후로는
			//    빠르게 수행될 수 있다.
			// pstmt.setString(1번부터 ?에 해당하는 순서, 데이터 );
			pstmt.setString(1, sch.getGesiid()); //

			rs = pstmt.executeQuery(); // sql를 넣지 않는다.!!(주의)
			// select * ==> deptno, dname, loc
			while(rs.next()) {
				// select에 해당 컬럼에 맞는 컬럼명, 데이터유형에
				// 맞게 rs.get타입("컬럼명") 지정하여야 한다.
				dlist.add(new GesipanVO(
								   rs.getInt(1),
								   rs.getString(2),
								   rs.getString(3),
								   rs.getDate(4),
								   rs.getString(5),
								   rs.getString(6),
								   rs.getString(7)));
				}
			System.out.println("데이터 건수:"+dlist.size());
			
		} catch (SQLException e) {
			System.out.println("DB에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		
		return dlist;
	}
//----------------------------------------------------------------------------------------------------
	 public GesipanVO getQnAView(GesipanVO j){
		 GesipanVO mem=null;
		 // boolean isSuccess = false;
		 String sql = "SELECT * FROM QNA\r\n"
		 		+ "WHERE QNANO = ?\r\n"
		 		+ "AND id =?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, j.getGesiqnano()); //
			 pstmt.setString(2, j.getGesiid()); //
			 rs = pstmt.executeQuery();

			 if(rs.next()) {
				 mem= new GesipanVO(  
						 rs.getInt(1),
						 rs.getString(2),
						 rs.getString(3),
						 rs.getDate(4),
						 rs.getString(5),
						 rs.getString(6),
						 rs.getString(7)
						 );
				 
			 }
	
			 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return mem;
	 }
	//----------------------------------------------------------------------------------------------------
	 public int getQnAno(GesipanVO j){
		 int qnano=0;
		 // boolean isSuccess = false;
		 String sql = "SELECT qnano FROM QNA\r\n"
				 + "WHERE QNANO = ?\r\n"
				 + "AND id =?";
		 try {
			 con = DB.con();
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, j.getGesiqnano()); //
			 pstmt.setString(2, j.getGesiid()); //
			 rs = pstmt.executeQuery();
			 rs.next(); 
			 qnano= rs.getInt(1);
 
		 } catch (SQLException e) {
			 System.out.println("DB에러:"+e.getMessage());
		 } catch(Exception e) {
			 System.out.println("일반 에러:"+e.getMessage());
		 }finally {
			 DB.close(rs, pstmt, con);
		 }
		 
		 return qnano;
	 }
	 //----------------------------------------------------------------------------------------------------
	 public int insertQnA(GesipanVO d) {
			String sql = "INSERT INTO QNA values(qna_seq.nextval,?,?,sysdate,?,?,'미답변')";
			int Success = 0;
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, d.getGesititle());
				pstmt.setString(2, d.getGesiid());
				pstmt.setString(3, d.getGesiqnacontent());
				pstmt.setString(4, d.getGesiansercontent());
				
				//System.out.println("등록건수:"+pstmt.executeUpdate());
				int check = pstmt.executeUpdate();
				con.commit();
				
				if(check==1) {
				String sql2 = "SELECT qnano FROM QNA\r\n"
						 + "WHERE id = ?\r\n"
						 + "AND title =?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, d.getGesiid());
				pstmt.setString(2, d.getGesititle());
				
				rs = pstmt.executeQuery();
				rs.next(); 
				 Success= rs.getInt(1);
				}
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
	 
	 public int UpdateQnA(GesipanVO d,String userdiv) {
		 int Success2=0;
		 String sql = "UPDATE QNA \r\n"
		 		+ "SET title=?,REGITDATE = SYSDATE,qnacontent = ?";
		 if(userdiv.equals("관리자")) { // 관리자일 경우
			 sql += " ,ansercontent=?, Status ='답변완료' WHERE QNANO = ?";
		 }else{ //회원일경우
			 sql += " WHERE QNANO = ?";
		 }
	 
		
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, d.getGesititle());
			 pstmt.setString(2, d.getGesiqnacontent());
			 if(userdiv.equals("관리자")) { //관리자일경우 컬럼 입력값 
				 pstmt.setString(3, d.getGesiansercontent());
				 pstmt.setInt(4, d.getGesiqnano());
			 }else { //회원일 경우 컬럼 입력값
				 pstmt.setInt(3, d.getGesiqnano());
			 }
			 
			 Success2=pstmt.executeUpdate();
			 
			 if(userdiv.equals("관리자")) {
				 Alert al = new Alert();
				 AlertVO alert = new AlertVO(d.getGesiid(),
						 			"관리자",
						 			"문의글에 대한 답변이 등록되었습니다.",
						 			"Main.jsp?translate=3",
						 			d.getGesiqnano(),0,"문의");
				 Success2=al.insertAlert(alert);
				 
			 }
			 
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
	 
	 public int DeleteQnA(GesipanVO d) {
		 String sql = "DELETE qna\r\n"
		 		+ "WHERE qnano=?";
		 int Success3 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, d.getGesiqnano());

			 
			 //System.out.println("등록건수:"+pstmt.executeUpdate());
			 Success3 = pstmt.executeUpdate();
			 
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
		 return Success3;
	 }
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
