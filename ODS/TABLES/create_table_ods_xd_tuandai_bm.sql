
DROP  TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_business_information_ods`;
CREATE TABLE ODS_XD_TUANDAI_BM.tb_yidian_business_information_ods (
	`log_id` VARCHAR(50) NOT NULL COMMENT '日志id ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`business_area` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务区域，例如，华南',
	`branch_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务所属分公司名',
	`business_product` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务产品,例如GPS押车押证',
	`borrow_money` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '借款金额 ',
	`repayment_type` INT(11) NULL DEFAULT NULL COMMENT '还款方式（1:到期本息;2:每月付息;5等额本息） ',
	`borrow_limit` INT(11) NULL DEFAULT NULL COMMENT '借款期限 ',
	`mortgagee` VARCHAR(50) NULL DEFAULT NULL COMMENT '抵押权人 ',
	`creditor_lender` VARCHAR(50) NULL DEFAULT NULL COMMENT '债权人出借人 ',
	`family_is_aware_loan` BIT(1) NULL DEFAULT NULL COMMENT '家人是否知晓此借款 ',
	`guarantee` VARCHAR(50) NULL DEFAULT NULL COMMENT '担保人',
	`contract_type` INT(11) NULL DEFAULT NULL COMMENT '上标主体  1:鸿特一点车贷 2:前海一点车贷',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
        `dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	`part_dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分区时间',
	PRIMARY KEY (`business_id`, `part_dt`),
	INDEX `idx_part_dt` (`part_dt`)
)
COMMENT='一点车贷业务信息'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION tb_yidian_business_information_ods_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION tb_yidian_business_information_ods_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB)  */;
 

DROP  TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_car_personal_information_ods`; 
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_car_personal_information_ods` (
	`id` VARCHAR(50) NOT NULL COMMENT '编号 ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`customer_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '借款人姓名 ',
	`depository_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '用户团贷网存管注册ID',
	`ismain_customer` BIT(1) NULL DEFAULT NULL COMMENT '是否主借款人 ',
	`istogether_customer` BIT(1) NULL DEFAULT NULL COMMENT '是否共借人 ',
	`phone` VARCHAR(50) NULL DEFAULT NULL COMMENT '手机号码 ',
	`identity_card` VARCHAR(50) NULL DEFAULT NULL COMMENT '身份证号码 ',
	`ismainland_resident` BIT(1) NULL DEFAULT NULL COMMENT '是否大陆居民 ',
	`nation` VARCHAR(50) NULL DEFAULT NULL COMMENT '民族 ',
	`age` INT(11) NULL DEFAULT NULL COMMENT '年龄 ',
	`native_place` VARCHAR(50) NULL DEFAULT NULL COMMENT '籍贯 ',
	`sex` INT(11) NULL DEFAULT NULL COMMENT '性别(0表示女，1表示男)',
	`wed_status` INT(11) NULL DEFAULT NULL COMMENT '婚姻状况 ',
	`live_province` VARCHAR(50) NULL DEFAULT NULL COMMENT '现住宅地址所在省 ',
	`live_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '现住宅地址所在市 ',
	`live_country` VARCHAR(50) NULL DEFAULT NULL COMMENT '现住宅地址所在县 ',
	`live_address` VARCHAR(100) NULL DEFAULT NULL COMMENT '现住宅所在地 ',
	`is_has_car` BIT(1) NULL DEFAULT NULL COMMENT '借款人有无车产 ',
	`is_has_house` BIT(1) NULL DEFAULT NULL COMMENT '借款人有无房产 ',
	`overdue_condition` VARCHAR(200) NULL DEFAULT NULL COMMENT '截至借款前6个月内借款人征信报告中的逾期情况 ',
	`account_province` VARCHAR(50) NULL DEFAULT NULL COMMENT '户口地址所在省 ',
	`account_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '户口地址所在市 ',
	`account_country` VARCHAR(50) NULL DEFAULT NULL COMMENT '户口地址所在县 ',
	`account_address` VARCHAR(100) NULL DEFAULT NULL COMMENT '户口地址 ',
	`company_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '单位全称 ',
	`company_province` VARCHAR(50) NULL DEFAULT NULL COMMENT '单位地址所在省份 ',
	`company_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '单位地址所在城市 ',
	`company_country` VARCHAR(50) NULL DEFAULT NULL COMMENT '单位地址所在县/镇/区 ',
	`company_address` VARCHAR(100) NULL DEFAULT NULL COMMENT '单位地址 ',
	`company_phone` VARCHAR(50) NULL DEFAULT NULL COMMENT '单位电话 ',
	`job_pay` VARCHAR(50) NULL DEFAULT NULL COMMENT '月均收入 ',
	`is_are_private_owners` BIT(1) NULL DEFAULT NULL COMMENT '是否私营业主 ',
	`private_company_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '私营公司名称 ',
	`organization_create_time` DATETIME NULL DEFAULT NULL COMMENT '私营公司成立时间 ',
	`organization_type` VARCHAR(200) NULL DEFAULT NULL COMMENT '组织形式 ',
	`bank_account` VARCHAR(50) NULL DEFAULT NULL COMMENT '银行账号 ',
	`bank_phone_number` VARCHAR(50) NULL DEFAULT NULL COMMENT '银行预留手机号码 ',
	`open_bank` VARCHAR(50) NULL DEFAULT NULL COMMENT '开户行 ',
	`branch_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '支行名称 ',
	`bank_provice` VARCHAR(50) NULL DEFAULT NULL COMMENT '银行卡归属地省 ',
	`bank_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '银行卡归属地市 ',
	`account_type` VARCHAR(50) NULL DEFAULT NULL COMMENT '转账类型 ',
	`is_company_bank_account` BIT(1) NULL DEFAULT NULL COMMENT '是否提供对公账号 ',
	`is_merged_certificate` BIT(1) NULL DEFAULT NULL COMMENT '是否三证合一 ',
	`unifiedCode` VARCHAR(50) NULL DEFAULT NULL COMMENT '统一社会信用代码 ',
	`business_licence` VARCHAR(50) NULL DEFAULT NULL COMMENT '营业执照号 ',
	`bank_license` VARCHAR(50) NULL DEFAULT NULL COMMENT '开户许可证 ',
	`orgNo` VARCHAR(50) NULL DEFAULT NULL COMMENT '组织机构代码 ',
	`taxNo` VARCHAR(50) NULL DEFAULT NULL COMMENT '税务登记号 ',
	`contact_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '[联系人姓名(客户为企业时需要填写)]',
	`company_type` INT(11) NULL DEFAULT NULL COMMENT '企业类型  企业类型  ,0表示有限责任公司，1表示股份有限责任公司，2表示个人独资企业 3表示合伙企业',
	`actual_controller` VARCHAR(50) NULL DEFAULT NULL COMMENT '实际控制人 ',
	`company_found` DATETIME NULL DEFAULT NULL COMMENT '成立日期 ',
	`register_capital` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '注册资本 ',
	`register_province` VARCHAR(50) NULL DEFAULT NULL COMMENT '企业注册地址所在省份,客户为企业时需要填写 ',
	`register_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '企业注册地址所在城市,客户为企业时需要填写 ',
	`register_country` VARCHAR(50) NULL DEFAULT NULL COMMENT '企业注册地址所在县区,客户为企业时需要填写 ',
	`register_address` VARCHAR(100) NULL DEFAULT NULL COMMENT '企业注册地址详细地址,客户为企业时需要填写 ',
	`company_legal_person` VARCHAR(50) NULL DEFAULT NULL COMMENT '企业法人,客户为企业时需要填写 ',
	`legal_person_identity_card` VARCHAR(50) NULL DEFAULT NULL COMMENT '法人代表身份证 ',
	`legal_person_birthday` DATETIME NULL DEFAULT NULL COMMENT '法人代表出生日期 ',
	`legal_person_sex` INT(11) NULL DEFAULT NULL COMMENT '法人代表性别(0表示女，1表示男)',
	`legal_person_province` VARCHAR(50) NULL DEFAULT NULL COMMENT '法人代表现住宅地址所在省 ',
	`legal_person_city` VARCHAR(50) NULL DEFAULT NULL COMMENT '法人代表现住宅地址所在市 ',
	`legal_person_country` VARCHAR(50) NULL DEFAULT NULL COMMENT '法人代表现住宅地址所在县 ',
	`legal_person_address` VARCHAR(100) NULL DEFAULT NULL COMMENT '法人代表现住宅地址 ',
	`operate_range` VARCHAR(1000) NULL DEFAULT NULL COMMENT '企业经营范围,客户为企业时填写] ',
	`profession` VARCHAR(50) NULL DEFAULT NULL COMMENT '所处行业 ',
	`borrower_other_info` VARCHAR(500) NULL DEFAULT NULL,
	`email` VARCHAR(200) NULL DEFAULT NULL,
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	 `dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	`part_dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分区时间',
	INDEX `ix_business_id` (`business_id`),
	INDEX `idx_part_dt` (`part_dt`)
)
COMMENT='一点车贷贷款人信息'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION tb_yidian_car_personal_information_ods_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION tb_yidian_car_personal_information_ods_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB)  */;



DROP  TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_withdrawals_loans_information_ods`; 
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_withdrawals_loans_information_ods` (
	`id` VARCHAR(50) NOT NULL COMMENT 'id ',
	`issue_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '标的ID ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`withdraw_status` INT(11) NULL DEFAULT '0' COMMENT '提现状态 0未放款(默认状态)1满标放款申请中2放款成功3放款失败',
	`xd_withdraw_id` VARCHAR(50) NULL DEFAULT NULL,
	`application_time` DATETIME NULL DEFAULT NULL COMMENT '申请提现时间 ',
	`application_money` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '申请提现金额 ',
	`actual_arrival_money` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '实际到帐金额 ',
	`actual_arrival_time` DATETIME NULL DEFAULT NULL COMMENT '实际到账时间 ',
	`borrower_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '借款人姓名 ',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	`update_time` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	 `dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	`part_dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分区时间',
	INDEX `ix_business_id` (`business_id`),
	INDEX `ix_issue_id` (`issue_id`),
	INDEX `idx_part_dt` (`part_dt`)
)
COMMENT='一点车贷提现放款信息'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_17 VALUES LESS THAN (737167) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION tb_yidian_withdrawals_loans_information_ods_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB)  */;


DROP  TABLE IF EXISTS ODS_XD_TUANDAI_BM.`tb_yidian_wind_control_approval_ods`; 
CREATE TABLE ODS_XD_TUANDAI_BM.`tb_yidian_wind_control_approval_ods` (
	`log_id` VARCHAR(50) NOT NULL COMMENT '日志id ',
	`business_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务单号 ',
	`payment_method` INT(11) NULL DEFAULT NULL COMMENT '还款方式(1到期本息,2每月付息,5等额本息) ',
	`borrow_limit` INT(11) NULL DEFAULT NULL COMMENT '借款期限 ',
	`car_mortgage_amount` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '车辆抵押额度 ',
	`borrow_money` DECIMAL(10,2) NULL DEFAULT NULL COMMENT '借款金额 ',
	`approval_opinion` VARCHAR(500) NULL DEFAULT NULL COMMENT '审批意见 ',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间 ',
	 `dw_src_sys` VARCHAR(50) NULL DEFAULT NULL COMMENT '来源系统',
	`dw_src_tbl` VARCHAR(500) NULL DEFAULT NULL COMMENT '来源表',
	`dw_ins_tm` DATETIME NULL DEFAULT NULL COMMENT '插入时间',
	`dw_upd_tm` DATETIME NULL DEFAULT NULL COMMENT '更新时间',
	`dw_ins_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '插入用户',
	`dw_upd_usr` VARCHAR(50) NULL DEFAULT NULL COMMENT '更新用户',
	`part_dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分区时间',
	INDEX `ix_business_id` (`business_id`),
	INDEX `idx_part_dt` (`part_dt`)
)
COMMENT='一点车贷风控审批信息'
COLLATE='utf8_general_ci'
ENGINE=INNODB
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_17 VALUES LESS THAN (737167) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_18 VALUES LESS THAN (737168) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_19 VALUES LESS THAN (737169) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_20 VALUES LESS THAN (737170) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_21 VALUES LESS THAN (737171) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_22 VALUES LESS THAN (737172) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_23 VALUES LESS THAN (737173) ENGINE = InnoDB,
 PARTITION tb_yidian_wind_control_approval_ods_2018_04_24 VALUES LESS THAN (737174) ENGINE = InnoDB)  */;

