
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>s
<body>
	<h1>select.jsp</h1>

	<h2> DB에 저장되어 있는 정보 조회</h2>
	
	<hr>
		<%
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
		String sql = "select * from itwill_member order by idx desc"; // 물음포 따옴표 필요 X (타입상관없이 받겠다)
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		
		
		
		
		
		// ???
// 		pstmt.setString(1, "M");
		
		
		
		
		
		
	
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
		
		// 데이터 있을 때 
		// rs.next() : 레코드셋의 커서를 움직여서 데이터가 있는지 없는지 체크
		//			   rs.next의 리턴값 : 조건식에 들어가있음-> T/F 나옴 -> boolean
		
		
		
		
		
		// for (초기.조건.증감식 필요o)
		// while (초기.조건.증감식 필요X. 조건만 비교하면 됨)
		

// 		if(rs.next()){     // if는 한개만 나옴? 나머지 데이트들 전체 출력(While문 사용)
		while(rs.next()){ 
			// 데이터 있을 때 (없을 때 빠져나감)
			// 데이터 저장 (DB -> 변수)
 			// rs.getXXX( INT 컬럼인덱스 ) : 검색속도가 빠르다. 테이블 설계중요. 데이터 정확도 떨어짐
 			// rs.getXXX( STRING 컬럼명 )  : 데이터 정확도 높음. 컬럼명을 외워야함. 
			
			
			// 인덱스 정보 저장	
 			//rs.getInt(columnLabel)
 			//int idx = rs.getInt("idx"); //idx = 목차 			
			int idx = rs.getInt(4);		// 1.index 2.name 3.gender 4.age..
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			int age = rs.getInt("age");
			String jumin = rs.getString("jumin");
			
			  out.println("IDX: "+idx+"<br>");
			  out.println("name: "+name+"<br>");
			  out.println("gender: "+gender+"<br>");
			  out.println("age: "+age+"<br>");
			  out.println("jumin: "+jumin+"<br>");
			%>
			  <hr>  
			<%
				}
			%>
	
		
			
			// 나머지 데이트들 전체 출력(While문 사용)
			// for (초기.조건.증감식 필요o)
			// while (초기.조건.증감식 필요X. 조건만 비교하면 됨)
				

				
			%>
			
			

<%-- 			이름 = <%= %><br> --%>
<%-- 			성별 = <%= %><br> --%>
<%-- 			나이 = <%= %><br> --%>
<%-- 			주민번호 = <%= %><br> --%>
			
		
		
		
	
	
	
</body>
</html>