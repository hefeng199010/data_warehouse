
DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_detail`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_detail` (
	`stat_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '统计日期',
	`business_id` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '业务单号',
	`area_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '业务区域',
	`branch_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '分公司',
	`operator_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '业务获取人',
	`type_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '类型',
	`business_type_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务类型',
	`customer_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '客户名称',
	`repay_type_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '还款方式',
	`accounter_confirm_time` DATETIME NULL DEFAULT NULL COMMENT '放款日期',
	`borrow_limit` INT(11) NULL DEFAULT NULL COMMENT '借款期限',
	`borrow_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '放款金额',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	PRIMARY KEY (`stat_dt`, `business_id`)
)
COMMENT='ceo看板业务放款明细表'
COLLATE='utf8_general_ci'
ENGINE=INNODB
;

DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_detail_his`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_detail_his` (
	`stat_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '统计日期',
	`business_id` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '业务单号',
	`area_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '业务区域',
	`branch_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '分公司',
	`operator_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '业务获取人',
	`type_nm` VARCHAR(100) NULL DEFAULT NULL COMMENT '类型',
	`business_type_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务类型',
	`customer_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '客户名称',
	`repay_type_nm` VARCHAR(50) NULL DEFAULT NULL COMMENT '还款方式',
	`accounter_confirm_time` DATETIME NULL DEFAULT NULL COMMENT '放款日期',
	`borrow_limit` INT(11) NULL DEFAULT NULL COMMENT '借款期限',
	`borrow_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '放款金额',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	 `part_dt` DATETIME NULL DEFAULT NULL COMMENT '分区日期',
	INDEX `idx_dma_ceo_rpt_business_detail_his` (`part_dt`)
)
COMMENT='ceo看板业务放款明细历史表'
COLLATE='utf8_general_ci'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION dma_ceo_rpt_business_detail_his_2018_04_08 VALUES LESS THAN (737158) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_09 VALUES LESS THAN (737159) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_10 VALUES LESS THAN (737160) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_11 VALUES LESS THAN (737161) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_12 VALUES LESS THAN (737162) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_13 VALUES LESS THAN (737163) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_14 VALUES LESS THAN (737164) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_15 VALUES LESS THAN (737165) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_16 VALUES LESS THAN (737166) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_17 VALUES LESS THAN (737167) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_25 VALUES LESS THAN (737175) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_26 VALUES LESS THAN (737176) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_detail_his_2018_04_27 VALUES LESS THAN (737177) ENGINE = InnoDB)  */;


