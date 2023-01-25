package webproject;

import java.nio.file.Paths;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*import org.apache.taglibs.standard.extra.spath.Path;*/

public class Prod {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	public int insertProd(ProdVO d) {
		String sql = "INSERT INTO olderproduct values(productno_seq.nextval,?,?,?,?,?,?,?,SYSDATE,'판매중',?,?,?,?,?,0,0)";
		int Success = 0;
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getProductname());
			pstmt.setString(2, d.getKind());
			pstmt.setString(3, d.getDealmethod());
			pstmt.setInt(4, d.getPrice());
			pstmt.setString(5, d.getSharewhether());
			pstmt.setString(6, d.getPriceoffer());
			pstmt.setString(7, d.getInformation());
			pstmt.setString(8, d.getFaddressval());
			pstmt.setString(9, d.getSaddressval());
			pstmt.setString(10, d.getCaddressval());
			pstmt.setString(11, d.getDaddressval());
			pstmt.setString(12, d.getWriterid());
			//System.out.println("등록건수:"+pstmt.executeUpdate());
			 pstmt.executeUpdate();
			con.commit();
			
			String sql2 = "SELECT productno FROM olderproduct\r\n"
					+ "WHERE productname = ?\r\n"
					+ "AND writerid = ?";
			
			 pstmt = con.prepareStatement(sql2);
	         pstmt.setString(1, d.getProductname());
	         pstmt.setString(2, d.getWriterid());
	         rs = pstmt.executeQuery(); 
	         if(rs.next()) {
	        	 Success = rs.getInt(1); 
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
	
	public int insertimage(ProdVO d,int productno) {
		String sql = "INSERT INTO proimg VALUES('img-'||proimg_seq.nextval,?,?)";
		int Success2 = 0;
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productno);
			pstmt.setString(2, d.getImgname());
			
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
	
//=====================================================================================
	 public List<ProdVO> getTot_ProductList(ProdVO sch){
	      List<ProdVO> tlist = new ArrayList<ProdVO>();
	      String sql = "SELECT i.*, p.IMGNO,p.IMGNAME\r\n"
	      		+ "FROM olderproduct i, proimg p\r\n"
	      		+ "WHERE i.productno= p.productno\r\n"
	      		+ "and (productname || kind || information || FADDRESSVAL || SADDRESSVAL\r\n"
	      		+ "	|| CADDRESSVAL || DADDRESSVAL) like '%'||?||'%'";
	      try {
	         con = DB.con();
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, sch.getProductname());
	         rs = pstmt.executeQuery(); 
	         while(rs.next()) {
	        	 	String filename =rs.getString("imgname");
	        	 	String[] filenamearr = filename.split(",");// 리턴퇸 파일명을 배열로 담음
	        	 	String filename1 = filenamearr[0];
	            tlist.add(new ProdVO(
	            		   rs.getInt("productno"),
	                       rs.getString("productname"),
	                       rs.getString("kind"),
	                       rs.getString("dealmethod"),
	                       rs.getInt("price"),
	                       rs.getString("sharewhether"),
	                       rs.getString("priceoffer"),
	                       rs.getString("information"),
	                       rs.getDate("registdate"),
	                       rs.getString("dealstat"),
	                       rs.getString("faddressval"),
	                       rs.getString("saddressval"),
	                       rs.getString("caddressval"),
	                       rs.getString("daddressval"),
	                       rs.getString("writerid"),
	                       rs.getInt("viewcount"),
	                       rs.getInt("likecount"),
	                       rs.getString("imgno"),
	                       filename1                     
	            		));
	         }
	         System.out.println("데이터 건수:"+tlist.size());
	         
	      } catch (SQLException e) {
	         System.out.println("DB에러:"+e.getMessage());
	      } catch(Exception e) {
	         System.out.println("일반 에러:"+e.getMessage());
	      }finally {
	         DB.close(rs, pstmt, con);
	      }
	      
	      return tlist;
	   }
	 //======================================================================
	 public int updatedealStatus(ProdVO d) {
			String sql = "UPDATE olderproduct\r\n"
					+ "SET dealstat = ?\r\n"
					+ "WHERE PRODUCTNO = ?";
			int uptSuccess = 0;
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				String dealstat = d.getDealstat();
				pstmt.setString(1, dealstat);
				pstmt.setInt(2, d.getProductno());
				uptSuccess = pstmt.executeUpdate();
				con.commit();
				
				if(dealstat.equals("거래완료")){
				String sql2 = "DELETE reserve\r\n"
						+ "    WHERE productno = ?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1,d.getProductno());
				pstmt.executeUpdate();
				con.commit();
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
			return uptSuccess;
		}
	 //====================================================================== 
	 public int likeinsert(ProdVO d) {
			String sql = "INSERT INTO cartlist values(?,?)";
			int Success2 = 0;
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, d.getProductno());
				pstmt.setString(2, d.getId());
				int check=0;
				check = pstmt.executeUpdate();
				
				if(check==1) {
				String sql2 = "UPDATE olderproduct\r\n"
						+ "	SET likecount = likecount+1\r\n"
						+ "	WHERE PRODUCTNO =?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, d.getProductno());
				Success2=pstmt.executeUpdate();
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
	 
	 public int likedelete(ProdVO d) {
		 String sql = "DELETE cartlist\r\n"
		 		+ "WHERE productno=?\r\n"
		 		+ "AND id=?";
		 int Success2 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, d.getProductno());
			 pstmt.setString(2, d.getId());
			 
			 int check=0;
				check = pstmt.executeUpdate();
				
				if(check==1) {
				String sql2 = "UPDATE olderproduct\r\n"
						+ "	SET likecount = likecount-1\r\n"
						+ "	WHERE PRODUCTNO =?";
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, d.getProductno());
				Success2=pstmt.executeUpdate();
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
	 //-=======================================================================
	 public int checklike(ProdVO d) {
		 String sql = "SELECT * FROM cartlist\r\n"
		 		+ "WHERE productno = ?\r\n"
		 		+ "AND id=?";
		 int Success2 = 0;
		 try {
			 con = DB.con();
			 con.setAutoCommit(false);
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, d.getProductno());
			 pstmt.setString(2, d.getId());
			 
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

	 
	 public List<ProdVO> getProdList(){
			List<ProdVO> plist = new ArrayList<ProdVO>();
			String sql = "SELECT * FROM Olderproduct";
			try {
				con = DB.con();
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					plist.add(new ProdVO(rs.getInt(1),
												rs.getString(2),
												rs.getString(3),
												rs.getString(4),
												rs.getInt(5),
												rs.getString(6),
												rs.getString(7),
												rs.getString(8),
												rs.getDate(9),
												rs.getString(10),
												rs.getString(11),
												rs.getString(12),
												rs.getString(13),
												rs.getString(14),
												rs.getString(15),
												rs.getInt(16),
												rs.getInt(17))
							 );
				}
				System.out.println("데이터 건수:"+plist.size());
				
			} catch (SQLException e) {
				System.out.println("DB에러:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("일반 에러:"+e.getMessage());
			}finally {
				DB.close(rs, pstmt, con);
			}		
			return plist;
		}
		
		// productno로 특정 글 불러오기
		public ProdVO getProdList(ProdVO sch){
			ProdVO plist = null;
			String sql = "SELECT * FROM Olderproduct WHERE productno=?";
			try {
				con = DB.con();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sch.getProductno());
				rs = pstmt.executeQuery();
				if(rs.next()) {
					plist=new ProdVO(rs.getInt(1),
												rs.getString(2),
												rs.getString(3),
												rs.getString(4),
												rs.getInt(5),
												rs.getString(6),
												rs.getString(7),
												rs.getString(8),
												rs.getDate(9),
												rs.getString(10),
												rs.getString(11),
												rs.getString(12),
												rs.getString(13),
												rs.getString(14),
												rs.getString(15),
												rs.getInt(16),
												rs.getInt(17));
							 
				}		
			} catch (SQLException e) {
				System.out.println("DB에러:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("일반 에러:"+e.getMessage());
			}finally {
				DB.close(rs, pstmt, con);
			}		
			return plist;
		}
		
		// productno로 특정 글의 이미지 파일 불러오기
		public String getProdImgList(ProdVO sch){
			String filename="";
			String sql = "SELECT i.imgname \r\n"
					+ "FROM proimg i, olderproduct p\r\n"
					+ "WHERE i.productno = p.productno\r\n"
					+ "AND i.productno = ?\r\n"
					+ "ORDER BY imgno";
			try {
				con = DB.con();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, sch.getProductno());
				rs = pstmt.executeQuery();
				rs.next(); 
				filename= rs.getString(1);
						
				
			
			} catch (SQLException e) {
				System.out.println("DB에러:"+e.getMessage());
			} catch(Exception e) {
				System.out.println("일반 에러:"+e.getMessage());
			}finally {
				DB.close(rs, pstmt, con);
			}		
			return filename;
		}	
	//========================================================================
		public int getProdImgCount(ProdVO sch){

				int count =0;
		      String sql = "SELECT REGEXP_COUNT(i.imgname,',')+1 imgcnt\r\n"
		            + "FROM proimg i, olderproduct p\r\n"
		            + "WHERE i.productno = p.productno\r\n"
		            + "AND i.productno = ?\r\n"
		            + "ORDER BY imgno";
		      try {
		         con = DB.con();
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, sch.getProductno());
		         rs = pstmt.executeQuery();
		         rs.next(); 
		         count=rs.getInt(1);
		                  
		         
		              
		      } catch (SQLException e) {
		         System.out.println("DB에러:"+e.getMessage());
		      } catch(Exception e) {
		         System.out.println("일반 에러:"+e.getMessage());
		      }finally {
		         DB.close(rs, pstmt, con);
		      }      
		      return count; 
		   }
		
		//========================================================================
		public int DeleteProd(ProdVO d) {
			int Success2 = 0; // 마지막에 리턴값 배열할 int
			Prod pd = new Prod();
			ProdVO pdvo = new ProdVO(d.getProductno()); //파일명 호출을 위해  new VO생성해서 담음
			String filenameval=pd.getProdImgList(pdvo); //해당 VO로 파일명 호출
			String[] filenamearr = filenameval.split(",");// 리턴퇸 파일명을 배열로 담음
			 try {
				 for(int i=0; i<filenamearr.length; i++) { //배열만큼 반복
						String loc="C:/Users/aoddl/git/JoongGo/JoongGo/src/main/webapp/2WebProject/img/saleProd/";
						Path filePath = Paths.get(loc+filenamearr[i]); //위치+배열(파일명)
						Files.deleteIfExists(filePath); // 삭제처리
					}
				 
				 String sql = "DELETE proimg WHERE productno=?"; //참조키때문에 이미지먼저 삭제
				 con = DB.con();
				 con.setAutoCommit(false);
				 pstmt = con.prepareStatement(sql);
				 pstmt.setInt(1, d.getProductno());
				int check= pstmt.executeUpdate();
				con.commit(); 
				// 내생각대로면 원래는 commit을 마지막에 하면되지만
				// 참조키 떄문에 이미지 테이블 데이터 삭제 후 커밋을 해줘야 아래의
				// 물건테이블이 실행될수 있다고 생각해서 일단 넣음
				
				if(check==1) { //이후 상품테이블의 해당 데이터 삭제
					String sql2 = "DELETE Olderproduct WHERE productno=?"; 
					pstmt = con.prepareStatement(sql2);
					 pstmt.setInt(1, d.getProductno());
					 Success2= pstmt.executeUpdate();
				}
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
			 return Success2;
		 }
	//===========================================================================
		public void UpViewcount(ProdVO d) {
			 String sql = "UPDATE olderproduct\r\n"
			 		+ "	SET viewcount = viewcount+1\r\n"
			 		+ "	WHERE PRODUCTNO =?";
			 
			 try {
				 con = DB.con();
				 con.setAutoCommit(false);
				 pstmt = con.prepareStatement(sql);
				 pstmt.setInt(1, d.getProductno());
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
		public void UpLikecount(ProdVO d) {
			String sql = "UPDATE olderproduct\r\n"
					+ "	SET likecount = likecount+1\r\n"
					+ "	WHERE PRODUCTNO =?";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, d.getProductno());
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
		public void DownLikecount(ProdVO d) {
			String sql = "UPDATE olderproduct\r\n"
					+ "	SET likecount = likecount-1\r\n"
					+ "	WHERE PRODUCTNO =?";
			
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, d.getProductno());
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
		
		public ProdVO GetUptProd(ProdVO p){
			ProdVO pd=null;
		        // boolean isSuccess = false;
		         String sql = "SELECT o.*,p.IMGNAME \r\n"
		         		+ "FROM olderproduct o,PROIMG p \r\n"
		         		+ "WHERE o.PRODUCTNO =p.PRODUCTNO\r\n"
		         		+ "AND o.PRODUCTNO =?";
		         try {
		            con = DB.con();
		            pstmt = con.prepareStatement(sql);
		            pstmt.setInt(1, p.getProductno()); //

		            rs = pstmt.executeQuery();
		            /*
		        (String id, String pass, String name, String grade, int point, String rday)
		             */
		            if(rs.next()) {
		            	pd= new ProdVO(  
		            			 rs.getInt(1),
		            		     rs.getString(2),
								 rs.getString(3),
								 rs.getString(4),
								 rs.getInt(5),
								 rs.getString(6),
								 rs.getString(7),
								 rs.getString(8),
								 rs.getDate(9),
								 rs.getString(10),
								 rs.getString(11),
								 rs.getString(12),
								 rs.getString(13),
								 rs.getString(14),
								 rs.getString(15),
								 rs.getInt(16),
								 rs.getInt(17),
								 rs.getString(18)
               
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
		         
		         return pd;
		      }
		
		public int updateProd(ProdVO upt) {
			int success=0;
		      String sql = "UPDATE olderproduct\r\n"
		      		+ "SET productname=?,\r\n"
		      		+ "kind=?,\r\n"
		      		+ "dealmethod=?,\r\n"
		      		+ "price=?,\r\n"
		      		+ "sharewhether=?,\r\n"
		      		+ "priceoffer=?,\r\n"
		      		+ "information=?,\r\n"
		      		+ "faddressval=?,\r\n"
		      		+ "saddressval=?,\r\n"
		      		+ "caddressval=?,\r\n"
		      		+ "daddressval=?\r\n"
		      		+ "WHERE productno=?";
		      try {
		         con = DB.con();
		         con.setAutoCommit(false);
		         pstmt = con.prepareStatement(sql);
		         
		         pstmt.setString(1, upt.getProductname());
		         pstmt.setString(2, upt.getKind());
		         pstmt.setString(3, upt.getDealmethod());
		         pstmt.setInt(4, upt.getPrice());
		         pstmt.setString(5, upt.getSharewhether());        
		         pstmt.setString(6, upt.getPriceoffer());
		         pstmt.setString(7, upt.getInformation());
		         pstmt.setString(8, upt.getFaddressval());
		         pstmt.setString(9, upt.getSaddressval());
		         pstmt.setString(10, upt.getCaddressval());
		         pstmt.setString(11, upt.getDaddressval());
		         //where 안에 들어갈 상품번호
		         pstmt.setInt(12, upt.getProductno());
		    
		         System.out.println("수정ㅋㅋ건수:"+pstmt.executeUpdate());
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
		      return success;
		}
		
		//============================================================================
		public int insertRes(String resdate, String id, int productno) {
			int isSuccess=0;;
			String Rresdate=resdate.replace("T"," ");
			String sql = "INSERT INTO reserve values('r'||rno_seq.nextval,?,null,'X',?,?)";
			try {
				con = DB.con();
				con.setAutoCommit(false);
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, Rresdate);
				pstmt.setString(2, id);
				pstmt.setInt(3, productno);
				isSuccess = pstmt.executeUpdate();
				
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
			return isSuccess;
		}
		
		//================================================================================
		
		
	public static void main(String[] args) {
		

	}

}
