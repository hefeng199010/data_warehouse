 -- DMA_CEO_RPT_DATA.dma_ceo_rpt_fin_revenue_yd  ceo看板财务收入表（一点车贷部分） 
 DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_fin_revenue_yd`; 
 CREATE TABLE DMA_CEO_RPT_DATA.dma_ceo_rpt_fin_revenue_yd
 (
stat_dt       VARCHAR(10)         COMMENT       '统计日期',
actual_repayment_date        VARCHAR(10)         COMMENT       '实收日期',
area_nm       VARCHAR(100)         COMMENT       '片区',
branch_nm       VARCHAR(100)         COMMENT       '分公司',
business_type_nm       VARCHAR(50)         COMMENT       '业务类型',
borrow_limit       VARCHAR(50)         COMMENT       '借款期限',
repay_type_nm       VARCHAR(50)         COMMENT       '还款方式',
business_id       VARCHAR(50)         COMMENT       '业务编号',
customer_nm       VARCHAR(50)         COMMENT       '客户名称',
borrow_amt       DECIMAL(12,2)         COMMENT       '放款额',
comp_srv_amt       DECIMAL(12,2)         COMMENT       '分公司服务费',
gps_cost_amt       DECIMAL(12,2)         COMMENT       'GPS服务费',
guarantee_amt       DECIMAL(12,2)         COMMENT       '月保证金',
actual_month_platform_service       DECIMAL(12,2)         COMMENT       '月平台服务费',
actual_p2p_platform_service       DECIMAL(12,2)         COMMENT       '团贷P2P平台服务费',
one_tm_db_fee       DECIMAL(12,2)         COMMENT       '担保费',
ode_acal_amt       DECIMAL(12,2)         COMMENT       '逾期利息',
current_Breach       DECIMAL(12,2)         COMMENT       '滞纳金',
trail_amt       DECIMAL(12,2)         COMMENT       '拖车费',
day_adv_settle_amt       DECIMAL(12,2)         COMMENT       '提前结清违约金',
dw_src_sys       VARCHAR(50)         COMMENT       '来源系统',
dw_src_tbl       VARCHAR(500)         COMMENT       '来源表',
dw_ins_tm       DATETIME         COMMENT       '插入时间',
dw_upd_tm       DATETIME         COMMENT       '更新时间',
dw_ins_usr       VARCHAR(50)         COMMENT       '插入用户',
dw_upd_usr       VARCHAR(50)         COMMENT       '更新用户',
KEY  idx_business_id(business_id),
KEY  idx_actual_repayment_date(actual_repayment_date),
KEY idx_actual_repayment_date_idx_business_id(business_id,actual_repayment_date),
KEY idx_area_nm(area_nm),
KEY idx_branch_nm(branch_nm),
KEY idx_customer_nm(customer_nm)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='ceo看板财务收入表（一点车贷部分）';


 -- DMA_CEO_RPT_DATA.dma_ceo_rpt_fin_revenue_yd  ceo看板财务收入表（一点车贷部分） 
 DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_fin_revenue_yd_his`; 
 CREATE TABLE DMA_CEO_RPT_DATA.dma_ceo_rpt_fin_revenue_yd_his
 (
stat_dt       VARCHAR(10)         COMMENT       '统计日期',
actual_repayment_date        VARCHAR(10)         COMMENT       '实收日期',
area_nm       VARCHAR(100)         COMMENT       '片区',
branch_nm       VARCHAR(100)         COMMENT       '分公司',
business_type_nm       VARCHAR(50)         COMMENT       '业务类型',
borrow_limit       VARCHAR(50)         COMMENT       '借款期限',
repay_type_nm       VARCHAR(50)         COMMENT       '还款方式',
business_id       VARCHAR(50)         COMMENT       '业务编号',
customer_nm       VARCHAR(50)         COMMENT       '客户名称',
borrow_amt       DECIMAL(12,2)         COMMENT       '放款额',
comp_srv_amt       DECIMAL(12,2)         COMMENT       '分公司服务费',
gps_cost_amt       DECIMAL(12,2)         COMMENT       'GPS服务费',
guarantee_amt       DECIMAL(12,2)         COMMENT       '月保证金',
actual_month_platform_service       DECIMAL(12,2)         COMMENT       '月平台服务费',
actual_p2p_platform_service       DECIMAL(12,2)         COMMENT       '团贷P2P平台服务费',
one_tm_db_fee       DECIMAL(12,2)         COMMENT       '担保费',
ode_acal_amt       DECIMAL(12,2)         COMMENT       '逾期利息',
current_Breach       DECIMAL(12,2)         COMMENT       '滞纳金',
trail_amt       DECIMAL(12,2)         COMMENT       '拖车费',
day_adv_settle_amt       DECIMAL(12,2)         COMMENT       '提前结清违约金',
dw_src_sys       VARCHAR(50)         COMMENT       '来源系统',
dw_src_tbl       VARCHAR(500)         COMMENT       '来源表',
dw_ins_tm       DATETIME         COMMENT       '插入时间',
dw_upd_tm       DATETIME         COMMENT       '更新时间',
dw_ins_usr       VARCHAR(50)         COMMENT       '插入用户',
dw_upd_usr       VARCHAR(50)         COMMENT       '更新用户',
`part_dt` DATETIME DEFAULT NULL COMMENT '分区日期',
KEY  idx_business_id(business_id),
KEY  idx_actual_repayment_date(actual_repayment_date),
KEY idx_part_dt(part_dt)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='ceo看板财务收入表（一点车贷部分）'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
( PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_01 VALUES LESS THAN (737181) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_02 VALUES LESS THAN (737182) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_03 VALUES LESS THAN (737183) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_04 VALUES LESS THAN (737184) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_05 VALUES LESS THAN (737185) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_06 VALUES LESS THAN (737186) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_07 VALUES LESS THAN (737187) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_08 VALUES LESS THAN (737188) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_09 VALUES LESS THAN (737189) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_revenue_yd_his_2018_05_10 VALUES LESS THAN (737190) ENGINE = INNODB) */
;