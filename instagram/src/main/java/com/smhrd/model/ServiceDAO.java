package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ServiceDAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public Double getSVC_seq(ServiceVO servo) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		Double SVC_seq = sqlSession.selectOne("select_serviceSeq", servo);
		
		return SVC_seq;
	}

	public List<Double> getSVC_seq2(ServiceVO servo) {
		
		SqlSession sqlSession = factory.openSession(true);

		List<Double> SVC_seqList = sqlSession.selectList("select_serviceSeqList", servo);
		
		return SVC_seqList;
	}




























}
	
	