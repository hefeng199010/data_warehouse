-- DMB_FIN_DATA
/*DDL 信息*/
DROP TABLE IF EXISTS DMB_FIN_DATA.`dmb_fin_yidian_overdue_days_detail`;
CREATE TABLE DMB_FIN_DATA.`dmb_fin_yidian_overdue_days_detail` (
`stat_dt` VARCHAR(8) DEFAULT NULL COMMENT '统计日期',
  `dat_dt` VARCHAR(8) DEFAULT NULL COMMENT '数据日期',
  `log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
  `plan_id` VARCHAR(50) DEFAULT NULL COMMENT '还款计划ID',
  `repayment_id` VARCHAR(50) DEFAULT NULL COMMENT '还款ID',
  `business_id` VARCHAR(50) DEFAULT NULL COMMENT '业务单号',
  `issue_id` VARCHAR(50) DEFAULT NULL COMMENT '标的ID',
  `business_after_id` VARCHAR(50) DEFAULT NULL COMMENT '期数',
  `actual_repayment_date` DATETIME DEFAULT NULL COMMENT '实还日期',
  `actual_amount` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '实还总金额',
  `actual_principal` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '实还本金',
  `actual_interest` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '实还利息',
  `receivable_repayment_date` DATETIME DEFAULT NULL COMMENT '应收日期',
  `receivable_amount` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '应还总金额',
  `receivable_principal` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '应还本金',
  `receivable_interest` DECIMAL(10,2) NOT NULL DEFAULT '0.00' COMMENT '应还利息',
  `overdue_days` INT(7) DEFAULT NULL COMMENT '逾期天数',
  `overdue_stage` VARCHAR(3) DEFAULT NULL COMMENT '逾期阶段',
`dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区日期',
  INDEX idx_plan_id(plan_id),
  INDEX idx_repayment_id(repayment_id),
  INDEX idx_business_id(business_id),
  INDEX idx_issue_id(issue_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='一点逾期基本信息表'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION dmb_fin_yidian_overdue_days_detail            VALUES LESS THAN (737208) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_overdue_days_detail_2018_05_29 VALUES LESS THAN (737209) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_overdue_days_detail_2018_05_30 VALUES LESS THAN (737210) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_overdue_days_detail_2018_05_31 VALUES LESS THAN (737211) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_overdue_days_detail_2018_06_01 VALUES LESS THAN (737212) ENGINE = InnoDB)  */;
;

DROP TABLE IF EXISTS DMB_FIN_DATA.`dmb_fin_yidian_repay_actual_and_other_dtl`;
CREATE TABLE DMB_FIN_DATA.`dmb_fin_yidian_repay_actual_and_other_dtl` (
`stat_dt` VARCHAR(8) DEFAULT NULL COMMENT '统计日期',
  `dat_dt` VARCHAR(8) DEFAULT NULL COMMENT '数据日期',
  `business_id` VARCHAR(50) DEFAULT NULL COMMENT '业务单号',
  `issue_id` VARCHAR(50) DEFAULT NULL COMMENT '标的ID',
  `business_after_id` VARCHAR(50) DEFAULT NULL COMMENT '期数',
  `log_id` VARCHAR(50) NOT NULL COMMENT 'id',
  `actual_repayment_date` DATETIME DEFAULT NULL COMMENT '实还日期',
  `actual_principal` DECIMAL(10,2) DEFAULT NULL COMMENT '实还本金',
  `actual_interest` DECIMAL(10,2) DEFAULT NULL COMMENT '实还利息', 
  `actual_gps_month_service` DECIMAL(32,2) DEFAULT NULL COMMENT '实还gps月服务费',
  `actual_month_cash_deposi` DECIMAL(32,2) DEFAULT NULL COMMENT '实还月保证金',
  `actual_month_platform_service` DECIMAL(32,2) DEFAULT NULL COMMENT '实还月平台服务费',
  `actual_month_asset_service` DECIMAL(32,2) DEFAULT NULL COMMENT '实还月资产端服务费',
  `actual_p2p_platform_service` DECIMAL(32,2) DEFAULT NULL COMMENT '实还资金端平台费',
  `actual_delaying_payment` DECIMAL(32,2) DEFAULT NULL COMMENT '实还滞纳金',
  `actual_delaying_interest` DECIMAL(32,2) DEFAULT NULL COMMENT '实还罚息(逾期利息)',
  `actual_prepayment_contract` DECIMAL(32,2) DEFAULT NULL COMMENT '实还提前结清违约金',
  `actual_surplus` DECIMAL(32,2) DEFAULT NULL COMMENT '实还结余',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区日期',
  INDEX idx_log_id(log_id),
  INDEX idx_business_id(business_id),
  INDEX idx_issue_id(issue_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='一点实还费用明细表'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl            VALUES LESS THAN (737208) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_29 VALUES LESS THAN (737209) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_30 VALUES LESS THAN (737210) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_31 VALUES LESS THAN (737211) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_06_01 VALUES LESS THAN (737212) ENGINE = InnoDB)  */;
 ;
 
 
 DROP TABLE IF EXISTS DMB_FIN_DATA.`dmb_fin_yidian_repay_plan_and_other_dtl`;
CREATE TABLE DMB_FIN_DATA.`dmb_fin_yidian_repay_plan_and_other_dtl` (
`stat_dt` VARCHAR(8) DEFAULT NULL COMMENT '统计日期',
  `dat_dt` VARCHAR(8) DEFAULT NULL COMMENT '数据日期',
  `business_id` VARCHAR(50) DEFAULT NULL COMMENT '业务单号',
  `issue_id` VARCHAR(50) DEFAULT NULL COMMENT '标的ID',
  `business_after_id` VARCHAR(50) DEFAULT NULL COMMENT '期数',
  `log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
  `receive_repayment_date` DATETIME DEFAULT NULL COMMENT '应收日期',
  `receive_principal` DECIMAL(10,2) DEFAULT NULL COMMENT '应收本金',
  `receive_interest` DECIMAL(10,2) DEFAULT NULL COMMENT '应收利息',
  `receive_gps_month_service` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还gps月服务费',
  `receive_month_cash_deposi` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还月保证金',
  `receive_month_platform_service` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还月平台服务费',
  `receive_p2p_platform_service` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还资金端平台费',
  `receive_overdue_service` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还逾期服务费',
  `receive_platform_delaying_payment` DECIMAL(32,2) NOT NULL DEFAULT '0.00' COMMENT '应还滞纳金',
    `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区日期',
  INDEX idx_log_id(log_id),
  INDEX idx_business_id(business_id),
  INDEX idx_issue_id(issue_id)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='一点应还费用明细表'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl            VALUES LESS THAN (737208) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_29 VALUES LESS THAN (737209) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_30 VALUES LESS THAN (737210) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_05_31 VALUES LESS THAN (737211) ENGINE = InnoDB,
 PARTITION dmb_fin_yidian_repay_actual_and_other_dtl_2018_06_01 VALUES LESS THAN (737212) ENGINE = InnoDB)  */;
 ;


 
 
CREATE TABLE DWS_DATA.`dws_evt_xd_output_list` (
  `BUSINESS_ID` VARCHAR(50) DEFAULT NULL COMMENT '[业务编号]',
  `OUTPUT_ID` INT(11) DEFAULT NULL COMMENT '[出款编号]',
  `OUTPUT_TIME` VARCHAR(50) DEFAULT NULL COMMENT '[出款时间]',
  `OUTPUT_TYPE` VARCHAR(50) DEFAULT NULL COMMENT '[转账类型]',
  `OUTPUT_MONEY` DECIMAL(12,2) DEFAULT NULL COMMENT '[出款金额]',
  `BANK_NAME` VARCHAR(50) DEFAULT NULL COMMENT '[开户银行]',
  `CUSTOMER_NAME` VARCHAR(50) DEFAULT NULL COMMENT '[开户户名]',
  `BANK_ACCOUNT` VARCHAR(50) DEFAULT NULL COMMENT '[银行卡号]',
  `UPDATE_USER` VARCHAR(50) DEFAULT NULL COMMENT '[更新人]',
  `UPDATE_TIME` DATETIME DEFAULT NULL COMMENT '[更新时间]',
  `regist_out_flag` VARCHAR(50) DEFAULT NULL COMMENT '[登记出款标记 Y:标记为登记出款 空或者N:未标记为登记出款]',
  `Actual_OutTime` VARCHAR(50) DEFAULT NULL COMMENT '[实际出款时间]',
  `Actual_OutOperator` VARCHAR(50) DEFAULT NULL COMMENT '[实际出款人]',
  `BANK_SUBNAME` VARCHAR(100) DEFAULT NULL COMMENT '[支行名称]',
  `Bank_Provice` VARCHAR(50) DEFAULT NULL COMMENT '[银行卡归属地省]',
  `Bank_City` VARCHAR(50) DEFAULT NULL COMMENT '[银行卡归属地省]',
  `merge_time` DATETIME DEFAULT NULL COMMENT '[合并还款计划时间]',
  `repay_id` INT(11) DEFAULT NULL COMMENT '[还款计划编号]',
  `user_guid` VARCHAR(50) DEFAULT NULL COMMENT '[资产端用户ID，关联绑卡表主键]',
  `CreditorId_platformUserId` VARCHAR(50) DEFAULT NULL COMMENT '[委托收款人id]',
  `business_type` VARCHAR(50) DEFAULT NULL COMMENT '业务类型',
  `business_type_detail` VARCHAR(50) DEFAULT NULL COMMENT '具体业务类型分类',
  `input_time` DATETIME DEFAULT NULL COMMENT '受理时间',
  `branch_id` VARCHAR(50) DEFAULT NULL COMMENT '业务所属分公司编号',
  `issue_id` VARCHAR(50) DEFAULT NULL COMMENT '上标编号，线下业务则为空',
  `is_issue` VARCHAR(50) DEFAULT NULL COMMENT '是否线上，1：是，0：否',
  `out_date` DATETIME DEFAULT NULL COMMENT '出款时间（线上指提现时间，线下指出款时间）',
  `out_amt` DECIMAL(15,2) DEFAULT NULL COMMENT '出款金额（线上指提现金额，线下指出款总金额）',
  `out_fee` DECIMAL(15,2) DEFAULT NULL COMMENT '出款费用（线上指提现一次性费用，线下费用为0）',
  `Is_Valid` VARCHAR(50) DEFAULT NULL COMMENT '是否有效',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区日期'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='出款明细事实表'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION dws_evt_xd_output_list            VALUES LESS THAN (737208) ENGINE = InnoDB,
 PARTITION dws_evt_xd_output_list_2018_05_29 VALUES LESS THAN (737209) ENGINE = InnoDB,
 PARTITION dws_evt_xd_output_list_2018_05_30 VALUES LESS THAN (737210) ENGINE = InnoDB,
 PARTITION dws_evt_xd_output_list_2018_05_31 VALUES LESS THAN (737211) ENGINE = InnoDB,
 PARTITION dws_evt_xd_output_list_2018_06_01 VALUES LESS THAN (737212) ENGINE = InnoDB)  */;
 ;