DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_fin_profit`;
CREATE TABLE DMA_CEO_RPT_DATA.dma_ceo_rpt_fin_profit 
(
stat_dt       VARCHAR(10)         COMMENT       '统计日期（按月）',
area_nm       VARCHAR(100)         COMMENT       '片区',
branch_nm       VARCHAR(100)         COMMENT       '分公司',
business_type_nm       VARCHAR(50)         COMMENT       '业务类型',
revenue_amt       DECIMAL(20,2)         COMMENT       '收入合计',
daily_expenses_amt       DECIMAL(20,2)         COMMENT       '支出-日常费用支出',
business_expenses_amt       DECIMAL(20,2)         COMMENT       '支出-业务费用支出',
guar_comp_share_amt       DECIMAL(20,2)         COMMENT       '支出-担保公司分摊',
tot_expenses_amt       DECIMAL(20,2)         COMMENT       '支出合计',
profit_amt       DECIMAL(20,2)         COMMENT       '利润',
loan_bal_amt       DECIMAL(20,2)         COMMENT       '贷款余额：剩余本金+剩余利息',
roa_pct       DECIMAL(10,4)         COMMENT       '资产回报率',
cost_manage_pct       DECIMAL(10,4)         COMMENT       '费用管理情况',
dw_src_sys       VARCHAR(50)         COMMENT       '来源系统',
dw_src_tbl       VARCHAR(500)         COMMENT       '来源表',
dw_ins_tm       DATETIME         COMMENT       '插入时间',
dw_upd_tm       DATETIME         COMMENT       '更新时间',
dw_ins_usr       VARCHAR(50)         COMMENT       '插入用户',
dw_upd_usr       VARCHAR(50)         COMMENT       '更新用户',
part_dt       DATETIME         COMMENT       '分区日期',
KEY idx_part_dt(part_dt)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='ceo看板财务利润表'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
( PARTITION dma_ceo_rpt_fin_profit_2018_05_01 VALUES LESS THAN (737181) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_02 VALUES LESS THAN (737182) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_03 VALUES LESS THAN (737183) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_04 VALUES LESS THAN (737184) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_05 VALUES LESS THAN (737185) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_06 VALUES LESS THAN (737186) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_07 VALUES LESS THAN (737187) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_08 VALUES LESS THAN (737188) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_09 VALUES LESS THAN (737189) ENGINE = INNODB,
 PARTITION dma_ceo_rpt_fin_profit_2018_05_10 VALUES LESS THAN (737190) ENGINE = INNODB) */
; 


