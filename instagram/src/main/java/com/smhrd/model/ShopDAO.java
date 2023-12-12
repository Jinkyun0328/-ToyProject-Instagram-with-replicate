package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShopDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public ShopVO getShopInfo(ShopVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        ShopVO shopInfo = null;

        try {
            shopInfo = sqlSession.selectOne("shop_select", vo);
            System.out.println("ShopInfo: " + shopInfo); // 로그 추가
            System.out.println("Executed SQL Query: " + sqlSession.getConfiguration().getMappedStatement("shop_select").getBoundSql(vo).getSql());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (shopInfo == null) {
            System.out.println("가게 정보가 null입니다.");
        }

        return shopInfo;
    }
	
	 public int updateShopImg(ShopVO vo) {
	        SqlSession sqlSession = factory.openSession(true);
	        List<ShopVO> shopInfo = null;
	        System.out.println("updateShopImg 실행");
	        int row = 0;
	        try {
	        	// System.out.println("getShopInfoAll 실행");
	        	row = sqlSession.update("updateShopImg", vo);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            sqlSession.close();
	        }

	        return row;
	    }
    
    public List<ShopVO> getShopInfoAll() {
        SqlSession sqlSession = factory.openSession(true);
        List<ShopVO> shopInfo = null;
        System.out.println("getShopInfoAll 실행");
        try {
        	// System.out.println("getShopInfoAll 실행");
            shopInfo = sqlSession.selectList("getShopInfoAll");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (shopInfo == null) {
            System.out.println("가게 정보가 null입니다.");
        }

        return shopInfo;
    }

	public List<ShopVO> shopSelectAll() {
		SqlSession sqlSession = factory.openSession(true);

		List<ShopVO> shopList = sqlSession.selectList("shopSelectAll"); // method name과 동일한 태그 사용(권장)
		
		sqlSession.close();

		return shopList;
	}
	
	public int shopReg(ShopVO vo) {
		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		int row = sqlSession.insert("shop_reg", vo);

		sqlSession.close();

		return row;
	}
	
}
