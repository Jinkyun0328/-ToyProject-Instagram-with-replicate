package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class DAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberVO vo) {
		// (1) 연결객체(sqlsession, connection)를 빌려오기
		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		// (2) 연결객체를 사용해서 어떤 sql 구문을 실행
		// ---> sql구문 : Mapper.xml파일 안에 있음
		int row = sqlSession.insert("join", vo);

		// (3) 연결객체 반납
		sqlSession.close();

		return row;
	}

	public MemberVO login(MemberVO vo) {
		// (1) 연결객체(sqlsession, connection)를 빌려오기
		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit
			
		// (2) 연결객체를 사용해서 어떤 sql 구문을 실행
		// ---> sql구문 : Mapper.xml파일 안에 있음
		
		MemberVO mvo = sqlSession.selectOne("login", vo);
		// select를 수행하고 나면 리턴타입 >> T
		// 제네릭 기법
		// 클래스 내부에서 사용하게 될 자료형을 외부에서 지정하는 방법
		// 리턴타입이 Object였다면, 결과값을 강제 형변환 해줘야 하는데
		// T 형식이기 때문에 다운캐스팅 할 필요가 없다.
		
		// (3) 연결객체 반납
		sqlSession.close();

		return mvo;
	}
	
	public List<Object> selectAll() {
		
		// 1. session 빌려오기
		SqlSession sqlSession = factory.openSession(true);
		
		List<Object> list = sqlSession.selectList("selectAll"); // method name과 동일한 태그 사용(권장)
	
		// 3. session 반납하기
		sqlSession.close();

		// 4. 조회한 결과값 반환
		return list;
	}
	
	public int update(MemberVO vo) {
		
		// 1. session 빌려오기
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.update("member_update", vo);
	
		// 3. session 반납하기
		sqlSession.close();

		// 4. 조회한 결과값 반환
		return row;
	}
	
	public MemberVO emailCheck(MemberVO vo) {
		
		SqlSession sqlSession = factory.openSession(true); 

		MemberVO mvo = sqlSession.selectOne("emailCheck", vo);

		sqlSession.close();

		return mvo;
	}
}
