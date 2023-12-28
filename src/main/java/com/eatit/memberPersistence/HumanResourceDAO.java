package com.eatit.memberPersistence;

import java.util.List;
import java.util.Map;

import com.eatit.mainDomain.Criteria;
import com.eatit.memberDomain.MemberVO;

public interface HumanResourceDAO {
	
	public MemberVO selectHrContent(MemberVO vo);

	public List<MemberVO> selectHrList(Criteria cri);
	
	public int getTotalCount();
	
	public void updateHrContent(MemberVO vo);
	
	public List<MemberVO> selectSearchList(Map<String, Object> params, Criteria cri, String searchword);
	
	public int getSearchCount(String searchword);
}
