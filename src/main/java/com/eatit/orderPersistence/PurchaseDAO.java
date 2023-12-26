package com.eatit.orderPersistence;

import java.util.List;

import com.eatit.orderDomain.PurchaseVO;

public interface PurchaseDAO {

	public void insertPurchaseOrder(PurchaseVO pvo) throws Exception;

	public List<PurchaseVO> getOrderList() throws Exception;

	public PurchaseVO getOrderDetail(int order_id) throws Exception;

	public int updateForm(PurchaseVO pvo) throws Exception;

}