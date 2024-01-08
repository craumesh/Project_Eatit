package com.eatit.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.domain.ProductCriteria;
import com.eatit.domain.ProductVO;
import com.eatit.persistence.MasterDataDAO;

import java.util.List;

import javax.inject.Inject;

@Service
public class MasterDataServiceImpl implements MasterDataService {
 
	private static final Logger logger = LoggerFactory.getLogger(MasterDataServiceImpl.class);
	
	@Inject
	private MasterDataDAO mddao;
	
	
	@Override
	public List<ProductVO> ProductList() throws Exception {
		logger.debug("ProductList()");
		return mddao.getProductList();
	}


	@Override
	public void productInsert(ProductVO pvo) {
		
		mddao.productInsert(pvo);
		
		
	}


	@Override
	public int productUpdate(ProductVO pvo)throws Exception {
		logger.debug("S:productUpdate(ProductVO pvo)");
		return mddao.productUpdate(pvo);
		
	}


	@Override
	public void productDelete(int product_no,String product_code) throws Exception {
		mddao.deleteProduct(product_no,product_code);
		
	}


	@Override
	public List<ProductVO> productListPage(ProductCriteria cri) throws Exception {
		
		return mddao.getProductListPage(cri);
	}


	@Override
	public int totalProductCount() throws Exception {
		
		return mddao.getProductCount();
	}


	@Override
	public List<ProductVO> searchProducts(String keyword)throws Exception {
		logger.debug("searchProducts(String keyword)");
		return mddao.searchProducts(keyword);
	}


	@Override
	public List<ProductVO> getMIMList() throws Exception {
		
		return mddao.getMIMList();
	}


	@Override
	public void MIMInsert(ProductVO pvo) throws Exception {
		
		mddao.MIMInsert(pvo);
	}


	@Override
	public int MIMUpdate(ProductVO pvo) throws Exception {
		
		return mddao.MIMUpdate(pvo);
	}


	@Override
	public void MIMDelete(int product_no) throws Exception {
		mddao.deleteMIM(product_no);
		
	}
   
}


