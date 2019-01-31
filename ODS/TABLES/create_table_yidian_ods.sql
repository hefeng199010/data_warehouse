DROP TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_repayment_actual_ods`;
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_repayment_actual_ods` (
	`log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
	`repayment_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '还款ID ',
	`plan_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '还款计划ID ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`issue_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '标的ID ',
	`period` INT(11) NULL DEFAULT NULL COMMENT '本次还款对应团贷网标的期数',
	`business_after_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '期数 ',
	`repay_type` INT(11) NULL DEFAULT NULL COMMENT '还款状态，1：正常还款；2：逾期还款；3：垫付还款',
	`clear_type` INT(11) NULL DEFAULT NULL COMMENT '结清方式0：未结清1：正常结清2：提前结清3：亏损结清;',
	`pay_type` INT(11) NULL DEFAULT NULL COMMENT '还款类型 0：第三方代扣 1：线下还款 2：银行代扣',
	`need_platform_repay` BIT(1) NULL DEFAULT NULL COMMENT '是否需要进行平台还款，若传false则不会进行资金分发平台还款操作 ',
	`finance_confirm_date` DATETIME NULL DEFAULT NULL COMMENT '财务人员确认还款日期',
	`finance_confirm_name` VARCHAR(50) NULL DEFAULT NULL,
	`repayment_date` DATETIME NULL DEFAULT NULL COMMENT '实还日期 ',
	`amount` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '实还金额 ',
	`principal` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '借款人实还本金 ',
	`interest` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '借款人实还利息 ',
	`overdue_days` INT(11) NULL DEFAULT NULL COMMENT '逾期天数(无则值为0) ',
	`spot_amount` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付金额(无则值为0) ',
	`spot_principal` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付本金(无则值为0) ',
	`spot_interest` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付利息(无则值为0) ',
	`spot_cash_deposit` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付保证金(无则值为0) ',
	`spot_guarantee_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付担保费(无则值为0) ',
	`spot_fund_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付资金端服务费(无则值为0) ',
	`spot_asset_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付资产端服务费(无则值为0) ',
	`spot_partner_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '资产端垫付合作方服务费(无则值为0) ',
	`roll_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '展期总费用(无则值为0) ',
	`roll_fund_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '展期资金端服务费 ',
	`roll_asset_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '展期资产端服务费 ',
	`roll_guarantee_fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '展期担保公司服务费 ',
	`td_user_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '标的借款人团贷用户ID（当需要进行平台还款时，必填）,当前标对应的借款人团贷用户ID，若共借标，则为共借人的团贷用户ID',
	`sub_company_user_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '分公司存管账户ID（当需要进行平台还款时，必填）,对应上标接口的分公司存管账号ID，当分润到分公司账户时，将分润到此账户',
	`guarantee_td_user_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '担保公司存管账户ID（当需要进行平台还款时，必填）应上标接口的担保公司存管账号ID,当分润到担保公司账户时，将分润到此账户',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	`update_time` DATETIME NULL DEFAULT NULL COMMENT '更新时间 ',
	  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区时间',
	INDEX `ix_business_id` (`business_id`),
	INDEX `ix_issue_id` (`issue_id`)
)
COMMENT='实际还款'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION tb_yidian_repayment_actual_ods VALUES LESS THAN (737189) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_10 VALUES LESS THAN (737190) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_11 VALUES LESS THAN (737191) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_12 VALUES LESS THAN (737192) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_13 VALUES LESS THAN (737193) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_14 VALUES LESS THAN (737194) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_15 VALUES LESS THAN (737195) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_16 VALUES LESS THAN (737196) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_ods_2018_05_17 VALUES LESS THAN (737197) ENGINE = InnoDB)  */;
;


DROP TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_repayment_plan_ods`;
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_repayment_plan_ods` (
	`log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
	`plan_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '还款计划ID ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`issue_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '标的ID ',
	`business_after_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '期数 ',
	`loan_extension_type` TINYINT(1) NULL DEFAULT NULL COMMENT '0非展期,1为线上展期，2线下展期',
	`loan_extension_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '展期编号',
	`repayment_date` DATETIME NULL DEFAULT NULL COMMENT '应收日期 ',
	`amount` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '借款人总应还金额',
	`principal` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '应收本金 ',
	`interest` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '应收利息 ',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	`update_time` DATETIME NULL DEFAULT NULL COMMENT '更新时间 ',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区时间',
	INDEX `ix_business_id` (`business_id`)
)
COMMENT='还款计划'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION tb_yidian_repayment_plan_ods VALUES LESS THAN (737189) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_10 VALUES LESS THAN (737190) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_11 VALUES LESS THAN (737191) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_12 VALUES LESS THAN (737192) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_13 VALUES LESS THAN (737193) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_14 VALUES LESS THAN (737194) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_15 VALUES LESS THAN (737195) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_16 VALUES LESS THAN (737196) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_ods_2018_05_17 VALUES LESS THAN (737197) ENGINE = InnoDB)  */;
;


DROP TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_repayment_plan_other_fee_ods`;
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_repayment_plan_other_fee_ods` (
	`log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
	`plan_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '对应tb_yidian_repayment_actual的log_id ',
	`fee_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '费用项目 ',
	`fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '实收费用金额 ',
	`fee_type` INT(11) NULL DEFAULT NULL COMMENT '所属费用分类，1：分公司服务费分类；2：担保公司费分类；3：资金端平台费分类；5：罚息(逾期利息),6：滞纳金；8：保证金；9：合作公司服务费 10：结余转还款(必填)',
	`fee_owner_type` INT(11) NULL DEFAULT NULL COMMENT '所属分润账户(1表示分公司账户，2表示担保公司账户，3表示平台账户,4:不需要分润)',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	`update_time` DATETIME NULL DEFAULT NULL COMMENT '更新时间 ',
	  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区时间',
	INDEX `ix_plan_id` (`plan_id`)
)
COMMENT='还款计划应还其他费用'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION tb_yidian_repayment_plan_other_fee_ods VALUES LESS THAN (737189) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_10 VALUES LESS THAN (737190) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_11 VALUES LESS THAN (737191) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_12 VALUES LESS THAN (737192) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_13 VALUES LESS THAN (737193) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_14 VALUES LESS THAN (737194) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_15 VALUES LESS THAN (737195) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_16 VALUES LESS THAN (737196) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_plan_other_fee_ods_2018_05_17 VALUES LESS THAN (737197) ENGINE = InnoDB)  */;
;

DROP TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_repayment_actual_other_fee_ods`;
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_repayment_actual_other_fee_ods` (
	`log_id` VARCHAR(50) NOT NULL COMMENT 'id ',
	`actual_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '对应tb_yidian_repayment_actual的log_id ',
	`fee_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '费用项目 ',
	`fee` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '实收费用金额 ',
	`fee_type` INT(11) NULL DEFAULT NULL COMMENT '所属费用分类，1：分公司服务费分类；2：担保公司费分类；3：资金端平台费分类；4：结余；5：罚息(逾期利息)；6：滞纳金；7：提前结清违约金；8：保证金；9：合作公司服务费',
	`fee_owner_type` INT(11) NULL DEFAULT NULL COMMENT '所属分润账户(1表示分公司账户，2表示担保公司账户，3表示平台账户,4:不需要分润)',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	`update_time` DATETIME NULL DEFAULT NULL COMMENT '更新时间 ',
		  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户',
  `part_dt` DATETIME DEFAULT NULL COMMENT '分区时间',
	INDEX `ix_actual_id` (`actual_id`)
)
COMMENT='还款其他费用'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION tb_yidian_repayment_actual_other_fee_ods VALUES LESS THAN (737189) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_10 VALUES LESS THAN (737190) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_11 VALUES LESS THAN (737191) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_12 VALUES LESS THAN (737192) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_13 VALUES LESS THAN (737193) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_14 VALUES LESS THAN (737194) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_15 VALUES LESS THAN (737195) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_16 VALUES LESS THAN (737196) ENGINE = InnoDB,
 PARTITION tb_yidian_repayment_actual_other_fee_ods_2018_05_17 VALUES LESS THAN (737197) ENGINE = InnoDB)  */;
;
