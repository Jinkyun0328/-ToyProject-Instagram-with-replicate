package com.smhrd.database;

import java.io.IOException;
import java.io.InputStream;

// import가 안 나오면 ibatis 로드를 안 한 것. Maven Dependencies에서 있는지 확인하고 없으면 pom.xml에서 로드하기
// 기본 패키지가 아니라 mybatis library에서 제공해주고 있는 패키지!!
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	public static SqlSessionFactory sqlSessionFactory;
	// 객체의 이름을 부르는 순간 바로 실행되는 코드
	
	static {
		String resource = "com/smhrd/database/mybatis-config.xml";
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			// connection pool을 관리해주는 공장
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	// sqlSessionFactory라는 객체를 리턴해주는 메소드
	// SqlSessionFactory == CP
	// SqlSession == Connection(SQL구문 동작시킬 수 있는)
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
	
}
