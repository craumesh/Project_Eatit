package com.eatit.businessPersistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.businessDomain.DeliveryVO;
import com.eatit.mainDomain.Criteria;

@Repository
public class DeliveryDAOImpl implements DeliveryDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(DeliveryDAOImpl.class);
	
	private static final String NAMESPACE = "com.eatit.mapper.DeliveryMapper";
	
	@Inject
	private SqlSession SqlSession;

	@Override
	public int selectCountTotalDelivery() {
		logger.debug("DAO: selectCountTotalDelivery()");
		return SqlSession.selectOne(NAMESPACE + ".selectCountTotalDelivery");
	}

	@Override
	public List<DeliveryVO> selectDeliveryList(Criteria cri) {
		logger.debug("DAO: selectDeliveryList(cri)");
		return SqlSession.selectList(NAMESPACE + ".selectDeliveryList", cri);
	}

	@Override
	public int selectCountMatchingDelivery(Map<String, Object> params) {
		logger.debug("DAO: selectCountMatchingDelivery(params)");
		return SqlSession.selectOne(NAMESPACE + ".selectCountMatchingDelivery", params);
	}

	@Override
	public List<DeliveryVO> selectMatchingDeliveryList(Map<String, Object> params) {
		logger.debug("DAO: selectMatchingDeliveryList(params)");
		return SqlSession.selectList(NAMESPACE + ".selectMatchingDeliveryList", params);
	}
	
}
