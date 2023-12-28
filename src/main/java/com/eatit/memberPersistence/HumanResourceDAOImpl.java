package com.eatit.memberPersistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;

@Repository
public class HumanResourceDAOImpl implements HumanResourceDAO {
	private static final Logger logger = LoggerFactory.getLogger(HumanResourceDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.eatit.mapper.HrMapper";

	@Override
	public MemberVO selectHrContent(MemberVO vo) {
		logger.debug("DAO(selectHrContent) -> Mapper 호출");
		return sqlSession.selectOne(NAMESPACE+".selectHrContent", vo);
	}

	@Override
	public List<MemberVO> selectHrList(Criteria cri) {
		logger.debug("DAO(selectHrList) -> Mapper 호출");
		return sqlSession.selectList(NAMESPACE+".selectHrList", cri);
	}

	@Override
	public int getTotalCount() {
		logger.debug("DAO(getTotalCount) -> Mapper 호출");
		return sqlSession.selectOne(NAMESPACE+".totalCount");
	}

	@Override
	public void updateHrContent(MemberVO vo) {
		logger.debug("DAO(updateHrContent) -> Mapper 호출");
		sqlSession.update(NAMESPACE+".updateHrContent", vo);
	}

	@Override
	public List<MemberVO> selectSearchList(Map<String, Object> params, Criteria cri, String searchword) {
		logger.debug("DAO(selectSearchList) -> Mapper 호출");
		return sqlSession.selectList(NAMESPACE+".selectSearchList",params);
	}

	@Override
	public int getSearchCount(String searchword) {
		logger.debug("DAO(getSearchCount) -> Mapper 호출");
		return sqlSession.selectOne(NAMESPACE+".searchCount",searchword);
	}

	@Override
	public List<MemberVO> selectHrRegList(Criteria cri) {
		logger.debug("DAO(selectHrRegList) -> Mapper 호출");
		return sqlSession.selectList(NAMESPACE+".selectHrRegList", cri);
	}

}
