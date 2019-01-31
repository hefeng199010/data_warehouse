DROP TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_general_expense`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_general_expense` (
  stat_dt       VARCHAR(10)         COMMENT       '跑批日期',
  `statistical_time` DATE DEFAULT NULL COMMENT '统计日期',
  `company_code` VARCHAR(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司代码',
  `campany_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司名称',
  `major_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '大类',
  `sub_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '小类',
  `rent_cost` DECIMAL(18,2) DEFAULT NULL COMMENT '房租费用',
  `depreciation_amortization_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '折旧摊销费',
  `long_term_apportioned_cost` DECIMAL(18,2) DEFAULT NULL COMMENT '长期待摊费用',
  `office_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '办公费',
  `travel_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '差旅费',
  `communication_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '通讯费',
  `advertising_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '广告宣传费',
  `vehicle_cost` DECIMAL(18,2) DEFAULT NULL COMMENT '车辆费用',
  `hospitality` DECIMAL(18,2) DEFAULT NULL COMMENT '招待费',
  `service_charge` DECIMAL(18,2) DEFAULT NULL COMMENT '服务费',
  `conference_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '会议费',
  `low_value_consumables` DECIMAL(18,2) DEFAULT NULL COMMENT '低值易耗品',
  `commission_charge` DECIMAL(18,2) DEFAULT NULL COMMENT '手续费',
  `other_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '其他费用',
  `artificial_cost_aggregate` DECIMAL(18,2) DEFAULT NULL COMMENT '人工费合计',
  `wages` DECIMAL(18,2) DEFAULT NULL COMMENT '工资',
  `performance_promotion_and_bonus` DECIMAL(18,2) DEFAULT NULL COMMENT '绩效提成及奖金',
  `social_security` DECIMAL(18,2) DEFAULT NULL COMMENT '社保',
  `accumulation_fund` DECIMAL(18,2) DEFAULT NULL COMMENT '公积金',
  `welfare_funds` DECIMAL(18,2) DEFAULT NULL COMMENT '福利费',
  `recruitment_costs` DECIMAL(18,2) DEFAULT NULL COMMENT '招聘费用',
  `training_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '培训费',
  `other` DECIMAL(18,2) DEFAULT NULL COMMENT '其他',
  `value_added_tax` DECIMAL(18,2) DEFAULT NULL COMMENT '增值税',
  `additional_tax` DECIMAL(18,2) DEFAULT NULL COMMENT '附加税',
  `corporate_income_tax` DECIMAL(18,2) DEFAULT NULL COMMENT '企业所得税',
  `general_expense_total` DECIMAL(18,2) DEFAULT NULL COMMENT '日常费用合计',
  `status` INT(2) DEFAULT NULL COMMENT '状态',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='日常支出费用'
;


DROP TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_expense`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_business_expense` (
  stat_dt       VARCHAR(10)         COMMENT       '跑批日期',
  `statistical_time` DATE DEFAULT NULL COMMENT '统计日期',
  `company_code` VARCHAR(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司代码',
  `campany_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司名称',
  `major_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '大类',
  `sub_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '小类',
  `business_rebate_commission` DECIMAL(18,2) DEFAULT NULL COMMENT '业务返点佣金',
  `mortgage_registration_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '抵押登记费',
  `assessment_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '评估费',
  `investigation_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '调查费',
  `parking_rate` DECIMAL(18,2) DEFAULT NULL COMMENT '停车费',
  `maintenance_cost` DECIMAL(18,2) DEFAULT NULL COMMENT '维修费',
  `inquiry_fee` DECIMAL(18,2) DEFAULT NULL COMMENT '查询费',
  `litigation_related_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '诉讼相关费用',
  `other_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '其他费用',
  `total_cost_of_business` DECIMAL(18,2) DEFAULT NULL COMMENT '业务费用合计',
  `status` INT(2) DEFAULT NULL COMMENT '状态',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='业务支出费用'
;


DROP TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_bonding_company_expense`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_bonding_company_expense` (
  stat_dt       VARCHAR(10)         COMMENT       '跑批日期',
  `statistical_time` DATE DEFAULT NULL COMMENT '统计日期',
  `company_code` VARCHAR(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司代码',
  `campany_name` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '公司名称',
  `major_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '大类',
  `sub_type` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '小类',
  `after_loan` DECIMAL(18,2) DEFAULT NULL COMMENT '贷后',
  `guarantee_company_total_cost` DECIMAL(18,2) DEFAULT NULL COMMENT '担保公司分摊费用合计',
  `yd_car_legal_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '一点车贷法务费用',
  `yd_car_daily_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '一点车贷日常费用',
  `house_legal_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '房贷法务费用',
  `house_daily_expenses` DECIMAL(18,2) DEFAULT NULL COMMENT '房贷日常费用',
  `status` INT(2) DEFAULT NULL COMMENT '状态',
  `dw_src_sys` VARCHAR(50) DEFAULT NULL COMMENT '来源系统',
  `dw_src_tbl` VARCHAR(500) DEFAULT NULL COMMENT '来源表',
  `dw_ins_tm` DATETIME DEFAULT NULL COMMENT '插入时间',
  `dw_upd_tm` DATETIME DEFAULT NULL COMMENT '更新时间',
  `dw_ins_usr` VARCHAR(50) DEFAULT NULL COMMENT '插入用户',
  `dw_upd_usr` VARCHAR(50) DEFAULT NULL COMMENT '更新用户'
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='担保公司分摊支出费用'
;
