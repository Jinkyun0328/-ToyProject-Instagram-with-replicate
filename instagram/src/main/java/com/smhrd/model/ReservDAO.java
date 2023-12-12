package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.model.ReservVO;
import com.smhrd.database.SqlSessionManager;

public class ReservDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<ReservVO> SelectReserv(String receive_memId) {
		System.out.println("SelectReserv진입완료 "+receive_memId);
		SqlSession sqlSession = factory.openSession();

		List<ReservVO> result = sqlSession.selectList("reservList",receive_memId);
		System.out.println("sql 결과 " + result + " end!!!!!");
		sqlSession.close();

		return result;
	}
}
