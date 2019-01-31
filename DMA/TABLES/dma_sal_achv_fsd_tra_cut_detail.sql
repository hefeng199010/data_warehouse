CREATE TABLE `dma_sal_achv_fsd_tra_cut_detail` (
stat_dt       varchar(10)         comment       'ͳ������',
business_id       varchar(50)         comment       'ҵ����',
area_nm       varchar(100)         comment       '��������',
branch_nm       varchar(100)         comment       '�ֹ�˾����',
operator_nm       varchar(100)         comment       '����ͻ���������',
repay_type_nm       varchar(100)         comment       '���ʽ',
type_nm       varchar(50)         comment       '����',
business_type_nm       varchar(50)         comment       'ҵ������',
customer_nm       varchar(50)         comment       '�����',
phase_nm       varchar(50)         comment       '���̽׶�',
borrow_limit       int(11)         comment       '������ޣ��£�',
borrow_amt       decimal(12,2)         comment       '�����',
input_dt       varchar(8)         comment       '��������',
update_dt       varchar(8)         comment       '��������',
dw_src_sys       varchar(50)         comment       '��Դϵͳ',
dw_src_tbl       varchar(500)         comment       '��Դ��',
dw_ins_tm       datetime         comment       '����ʱ��',
dw_upd_tm       datetime         comment       '����ʱ��',
dw_ins_usr       varchar(50)         comment       '�����û�',
dw_upd_usr       varchar(50)         comment       '�����û�',
PRIMARY KEY (`stat_dt`, `business_id`)
)
COMMENT='���ٴ�������ҵ����ٱ�'
COLLATE='utf8_general_ci'
