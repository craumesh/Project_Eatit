package com.eatit.warehouseDomain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WarehouseVO {
	private int warehouse_no;
	private String warehouse_location_name;
	private String warehouse_name;
	private String warehouse_sortation;
	private int warehouse_admin_no;
	private String warehouse_use_status;
	private String warehouse_note;
	private String warehouse_updater;
	private Timestamp warehouse_updatedate;
	
	// join에 필요한 값
	private int member_no;
	private String member_name;
	private String member_contact;
	private String member_email;
}
