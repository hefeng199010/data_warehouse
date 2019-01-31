
DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_sum`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_sum` (
	`stat_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '统计日期',
	`data_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '数据日期',
	`area_nm` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '业务区域',
	`branch_nm` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分公司',
	`business_type_nm` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '业务类型',
	`new_apl_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务申请单数',
	`new_pass_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务通过单数',
	`new_sign_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务签约单数',
	`new_output_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务放款单数',
	`new_output_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '新增业务放款金额',
	`new_pass_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务通过率',
	`new_sign_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务签约率',
	`new_output_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务放款率',
	`extension_amount` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '续贷（展期）金额',
	`extension_cnt` INT(11) NULL DEFAULT NULL COMMENT '续贷（展期）单数',
	`extension_amount_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '续贷（展期）比例（金额）',
	`extension_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '续贷（展期）比例（单数）',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	PRIMARY KEY (`stat_dt`, `data_dt`, `area_nm`, `branch_nm`, `business_type_nm`)
)
COMMENT='ceo看板业务汇总表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_sum_his`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_sum_his` (
	`stat_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '统计日期',
	`data_dt` VARCHAR(10) NOT NULL DEFAULT '' COMMENT '数据日期',
	`area_nm` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '业务区域',
	`branch_nm` VARCHAR(100) NOT NULL DEFAULT '' COMMENT '分公司',
	`business_type_nm` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '业务类型',
	`new_apl_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务申请单数',
	`new_pass_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务通过单数',
	`new_sign_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务签约单数',
	`new_output_cnt` INT(11) NULL DEFAULT NULL COMMENT '新增业务放款单数',
	`new_output_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '新增业务放款金额',
	`new_pass_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务通过率',
	`new_sign_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务签约率',
	`new_output_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '新增业务放款率',
	`extension_amount` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '续贷（展期）金额',
	`extension_cnt` INT(11) NULL DEFAULT NULL COMMENT '续贷（展期）单数',
	`extension_amount_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '续贷（展期）比例（金额）',
	`extension_cnt_pct` DECIMAL(10,4) NULL DEFAULT NULL COMMENT '续贷（展期）比例（单数）',
	`dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	`part_dt` DATETIME NULL DEFAULT NULL COMMENT '分区日期',
	INDEX `idx_dma_ceo_rpt_business_sum_his` (`part_dt`)
)
COMMENT='ceo看板业务汇总历史表'
COLLATE='utf8_general_ci'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION dma_ceo_rpt_business_sum_his_2018_04_08 VALUES LESS THAN (737158) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_09 VALUES LESS THAN (737159) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_10 VALUES LESS THAN (737160) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_11 VALUES LESS THAN (737161) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_12 VALUES LESS THAN (737162) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_13 VALUES LESS THAN (737163) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_14 VALUES LESS THAN (737164) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_15 VALUES LESS THAN (737165) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_16 VALUES LESS THAN (737166) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_17 VALUES LESS THAN (737167) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_25 VALUES LESS THAN (737175) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_26 VALUES LESS THAN (737176) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_business_sum_his_2018_04_27 VALUES LESS THAN (737177) ENGINE = InnoDB)  */;

 