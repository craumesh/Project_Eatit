package com.eatit.machineDomain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.eatit.productionDomain.masterdata_informationVO;
import com.eatit.productionDomain.ordersVO;
import com.eatit.productionDomain.recipeVO;

import lombok.Data;

@Data
public class machineVO {

	
	private int machine_code;
	private String machine_name;
	private String machine_status;
	private int employee_no;
	private String purpose_of_use;
	private Date installation_date;
	private String machine_location;
	private int order_id;
	
	private String name;
//	private String use_history;
//	private Date operating_time;
	
	private List<machinehistoryVO> infolist;
	private List<ordersVO> ordersVOlist;
	private List<masterdata_informationVO> masterdataVOlist;
	private List<recipeVO> recipeVOlist;
	
}


