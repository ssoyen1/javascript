<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
		// <h1>jQuery2/html2.jsp</h1>
		String id = request.getParameter("id");
		String result="";
// 		if(id.equals("kim")){
// 			result="아이디 중복";
// 		}else{
// 			result="아이디 사용가능";
// 		}


		// 디비연결정보 (상수)
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
	
	
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		System.out.println(" 드라이브 로드 성공!");
		
		
		// 2. 디비 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW); 
		System.out.println(" 디비 연결 성공 ! ");
		System.out.println(" con : " + con);
		
		
		// 3. SQL 작성 & pstmt 객체 만들기
		// SELECT * FROM itwill_member WHERE gender = "M";
// 		String sql = "select * from itwill_member where gender=?"; // 물음포 따옴표 필요 X (타입상관없이 받겠다)
		String sql = "select * from itwill_member where id=?"; // 물음포 따옴표 필요 X (타입상관없이 받겠다)
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		
		// ???
		pstmt.setString(1, id);
		
		
		// 4. SQL 실행 
		// * 실행구문은 sql 구문이 실행시 테이블에 영향을 주는지 판단
		//pstmt.executeUpdate();   : insert구문 , update구문, delete구문 -> DB테이블데이터 조작.영향을 줌(수정,삭제)
 		//pstmt.executeQuery();    : select구문  						   -> DB테이블데이터에 영향 주지 X
 		//ResultSet : select문의 결과 레코드셋이라는 데이터를 저장하는 객체


		//pstmt.executeQuery();
		ResultSet rs = pstmt.executeQuery(); // 레코드셋 = 리절트셋으로 저장됨 	
											 // 커서가 놓인 위치로 데이터 유무알 수 있음. 행 단위로 움직임 
		System.out.println(" SQL구문 실행 완료! ");
		
		// 이까지 했을때 데이터가 조회되지는 않음. 왜냐 SELECT 실행하는 것과 보여주는 것은 분리되어있음 
		
		
		
		
		// 5. 데이터 처리
		//	  => 정보를 가져다가 출력
		if(rs.next()){ 
			// 아이디 있음, 아이디 중복
			result="아이디 중복";
		}else{
			// 아이디 없음, 아이디 사용가능
			result="아이디 사용가능";
			
		}
	%>
	<%=id+":"+result%> <!-- 출력한 결과를 success:function(rdata)로 보내서 체크함 -->

