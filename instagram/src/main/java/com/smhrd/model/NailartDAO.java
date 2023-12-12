package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class NailartDAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

    public List<NailartVO> getNailInfoAll(StaffVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        List<NailartVO> NailInfo = null;
        
        System.out.println("NailartDAO.getNailInfoAll 실행");
        System.out.println("입력값 : "+vo.getStaffSeq());
        try {
        	NailInfo = sqlSession.selectList("getNailInfoAll", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (NailInfo == null) {
            System.out.println("네일아트 정보가 null입니다.");
        }

        return NailInfo;
    }


























}
	
	