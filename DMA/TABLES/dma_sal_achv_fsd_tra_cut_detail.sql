CREATE TABLE `dma_sal_achv_fsd_tra_cut_detail` (
stat_dt       varchar(10)         comment       '统计日期',
business_id       varchar(50)         comment       '业务编号',
area_nm       varchar(100)         comment       '区域名称',
branch_nm       varchar(100)         comment       '分公司名称',
operator_nm       varchar(100)         comment       '经办客户经理名称',
repay_type_nm       varchar(100)         comment       '还款方式',
type_nm       varchar(50)         comment       '类型',
business_type_nm       varchar(50)         comment       '业务类型',
customer_nm       varchar(50)         comment       '借款人',
phase_nm       varchar(50)         comment       '流程阶段',
borrow_limit       int(11)         comment       '借款期限（月）',
borrow_amt       decimal(12,2)         comment       '借款金额',
input_dt       varchar(8)         comment       '受理日期',
update_dt       varchar(8)         comment       '更新日期',
dw_src_sys       varchar(50)         comment       '来源系统',
dw_src_tbl       varchar(500)         comment       '来源表',
dw_ins_tm       datetime         comment       '插入时间',
dw_upd_tm       datetime         comment       '更新时间',
dw_ins_usr       varchar(50)         comment       '插入用户',
dw_upd_usr       varchar(50)         comment       '更新用户',
PRIMARY KEY (`stat_dt`, `business_id`)
)
COMMENT='房速贷减缩版业务跟踪表'
COLLATE='utf8_general_ci'
