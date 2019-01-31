CREATE TABLE `dma_sal_achv_fsd_defer_settle_pending_detail` (
	`stat_dt` VARCHAR(10) NOT NULL COMMENT '统计日期',
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号，即原业务编号',
	`area_nm` VARCHAR(100) NULL DEFAULT '' COMMENT '区域',
	`branch_nm` VARCHAR(100) NULL DEFAULT '' COMMENT '分公司',
	`original_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务获取人编号',
	`customer_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '主借人',
	`customer_list` VARCHAR(2000) NULL DEFAULT NULL COMMENT '共借人(所有客户姓名,已逗号隔开)',
	`repay_type_nm` VARCHAR(50) NULL DEFAULT '' COMMENT '还款方式',
	`product_type` VARCHAR(10) NULL DEFAULT NULL COMMENT '产品类型,即包含期数包含XYD为信用加成类型，其他为纯抵押类型',
	`borrow_amt` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '借款金额',
	`cur_repay_period` VARCHAR(50) NULL DEFAULT NULL COMMENT '[当前还款期数]',
	`shd_repay_date` VARCHAR(10) NULL DEFAULT NULL COMMENT '应还款日期',
	`shd_amt` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '应还金额',
	`current_Breach` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '应收滞纳金',
	`ovd_days` INT(7) NULL DEFAULT NULL COMMENT '逾期天数',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT '' COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT '' COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT '' COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT '' COMMENT '更新用户',
	INDEX `idx_fsd_defer_settle_pending_detail_business_id` (`business_id`)
)
COMMENT='房速贷待展期待结清明细表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `dma_sal_achv_fsd_defer_settle_pending_detail_his` (
	`stat_dt` VARCHAR(10) NOT NULL COMMENT '统计日期',
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号，即原业务编号',
	`area_nm` VARCHAR(100) NULL DEFAULT '' COMMENT '区域',
	`branch_nm` VARCHAR(100) NULL DEFAULT '' COMMENT '分公司',
	`original_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务获取人编号',
	`customer_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '主借人',
	`customer_list` VARCHAR(2000) NULL DEFAULT NULL COMMENT '共借人(所有客户姓名,已逗号隔开)',
	`repay_type_nm` VARCHAR(50) NULL DEFAULT '' COMMENT '还款方式',
	`product_type` VARCHAR(10) NULL DEFAULT NULL COMMENT '产品类型,即包含期数包含XYD为信用加成类型，其他为纯抵押类型',
	`borrow_amt` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '借款金额',
	`cur_repay_period` VARCHAR(50) NULL DEFAULT NULL COMMENT '[当前还款期数]',
	`shd_repay_date` VARCHAR(10) NULL DEFAULT NULL COMMENT '应还款日期',
	`shd_amt` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '应还金额,即本金+利息+服务费+其他费用',
	`current_Breach` DECIMAL(12,2) NULL DEFAULT '0.00' COMMENT '应收滞纳金',
	`ovd_days` INT(7) NULL DEFAULT NULL COMMENT '逾期天数',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT '' COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT '' COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT '' COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT '' COMMENT '更新用户',
	`part_dt` DATETIME NULL DEFAULT NULL COMMENT '分区日期',
	INDEX `idx_fsd_defer_settle_pending_detail_his_business_id` (`business_id`)
)
COMMENT='房速贷待展期待结清明细表'
COLLATE='utf8_general_ci'
PARTITION BY RANGE (TO_DAYS(part_dt))
(
PARTITION  dma_sal_achv_fsd_defer_settle_pending_detail_his_2018_04_08 VALUES LESS THAN (737158) ENGINE = InnoDB,
 PARTITION dma_sal_achv_fsd_defer_settle_pending_detail_his_2018_04_09 VALUES LESS THAN (737159) ENGINE = InnoDB,
 PARTITION dma_sal_achv_fsd_defer_settle_pending_detail_his_2018_04_10 VALUES LESS THAN (737160) ENGINE = InnoDB,
 PARTITION dma_sal_achv_fsd_defer_settle_pending_detail_his_2018_04_11 VALUES LESS THAN (737161) ENGINE = InnoDB,
 PARTITION dma_sal_achv_fsd_defer_settle_pending_detail_his_2018_04_12 VALUES LESS THAN (737162) ENGINE = InnoDB) 
; 

