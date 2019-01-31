-- dma_ceo_rpt_loan_balance 不需要存历史数据
DROP  TABLE IF EXISTS DMA_CEO_RPT_DATA.`dma_ceo_rpt_loan_balance`;
CREATE TABLE DMA_CEO_RPT_DATA.`dma_ceo_rpt_loan_balance`
(
stat_dt       VARCHAR(10)         COMMENT       '统计日期',
data_dt       VARCHAR(10)         COMMENT       '数据日期',
business_id       VARCHAR(50)         COMMENT       '业务编号',
area_nm       VARCHAR(100)         COMMENT       '片区',
branch_nm       VARCHAR(100)         COMMENT       '分公司',
business_type_nm       VARCHAR(50)         COMMENT       '业务类型',
customer_nm       VARCHAR(50)         COMMENT       '客户名称',
repay_type_nm       VARCHAR(50)         COMMENT       '还款方式',
borrow_limit       INT(11)         COMMENT       '借款期限',
borrow_amt       DECIMAL(20,2)         COMMENT       '放款金额',
tot_receive_interest       DECIMAL(20,2)         COMMENT       '应收总利息',
tot_actual_interest       DECIMAL(20,2)         COMMENT       '实收总利息',
due_unpaid_prin       DECIMAL(20,2)         COMMENT       '到期未收本金',
due_unpaid_interest       DECIMAL(20,2)         COMMENT       '到期未收利息',
left_principa_amt       DECIMAL(20,2)         COMMENT       '剩余本金',
left_interest_amt       DECIMAL(20,2)         COMMENT       '剩余利息',
dw_src_sys       VARCHAR(50)         COMMENT       '来源系统',
dw_src_tbl       VARCHAR(500)         COMMENT       '来源表',
dw_ins_tm       DATETIME         COMMENT       '插入时间',
dw_upd_tm       DATETIME         COMMENT       '更新时间',
dw_ins_usr       VARCHAR(50)         COMMENT       '插入用户',
dw_upd_usr       VARCHAR(50)         COMMENT       '更新用户',
`part_dt` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '分区时间',
INDEX `idx_dma_ceo_rpt_loan_balance_business_id` (`business_id`),
INDEX `idx_dma_ceo_rpt_loan_balance_part_dt` (`part_dt`)
)
COMMENT='ceo看板贷款余额表'
COLLATE='utf8_general_ci'
/*!50100 PARTITION BY RANGE (TO_DAYS(part_dt))
(PARTITION dma_ceo_rpt_loan_balance_2018_05_01 VALUES LESS THAN (737181) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_02 VALUES LESS THAN (737182) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_03 VALUES LESS THAN (737183) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_04 VALUES LESS THAN (737184) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_05 VALUES LESS THAN (737185) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_06 VALUES LESS THAN (737186) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_07 VALUES LESS THAN (737187) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_08 VALUES LESS THAN (737188) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_09 VALUES LESS THAN (737189) ENGINE = InnoDB,
 PARTITION dma_ceo_rpt_loan_balance_2018_05_10 VALUES LESS THAN (737190) ENGINE = InnoDB)  */;
 
 


