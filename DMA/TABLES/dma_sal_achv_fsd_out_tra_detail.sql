create table dma_sal_achv_fsd_out_tra_detail
(
stat_dt       varchar(10)         comment       'ͳ������',
business_id       varchar(50)         comment       'ҵ����',
area_nm       varchar(100)         comment       '����',
branch_nm       varchar(100)         comment       '�ֹ�˾',
operator_nm       varchar(100)         comment       '�ͻ�����',
type_nm       varchar(100)         comment       '����',
business_type_nm       varchar(50)         comment       'ҵ������',
is_full_issue       varchar(50)         comment       '�Ƿ�����',
customer_nm       varchar(50)         comment       '�����',
input_dt       varchar(10)         comment       '��������',
update_dt       varchar(10)         comment       '��������',
repay_type_nm       varchar(50)         comment       '���ʽ',
mtge_type_nm       varchar(50)         comment       '��Ѻ����',
cur_state       varchar(50)         comment       '��ǰ״̬',
apl_borrow_limit       int(11)         comment       '����-�������',
apl_borrow_amt       decimal(12,2)         comment       '����-����� ',
appv_borrow_limit       int(11)         comment       '������-�������',
new_out_cnt       int(11)         comment       '�����������',
new_out_amt       decimal(12,2)         comment       '������ҵ������',
new_apl_cnt       int(11)         comment       '���������뵥����',
new_pass_cnt       int(11)         comment       '������ͨ��������',
new_sign_cnt       int(11)         comment       '������ǩԼ����',
etsn_amt       decimal(12,2)         comment       'չ��ҵ����',
ode_cnt       int(11)         comment       '���ڱ���',
ode_prpa       decimal(12,2)         comment       '���ڱ���',
ode_acal       decimal(12,2)         comment       '������Ϣ',
ode_plty       decimal(12,2)         comment       '����ΥԼ��',
settle_cnt       int(11)         comment       '�������',
bef_settle_prpa       decimal(12,2)         comment       '��ǰ������',
bef_settle_plty       decimal(12,2)         comment       '��ǰ����ΥԼ��',
nml_settle_prpa       decimal(12,2)         comment       '���ڽ�����',
ode_settle_prpa       decimal(12,2)         comment       '���ڽ�����',
mon_rate       decimal(12,2)         comment       'ƽ̨�»���Ϣ',
mon_crt_inc       decimal(12,2)         comment       '�´���',
one_tm_pt_fee       decimal(12,2)         comment       'ƽ̨�����-�ſ�ǰһ������ȡ',
mon_lj_pt_fee       decimal(12,2)         comment       'ƽ̨�����-ÿ����ȡ�ۼ�',
one_tm_fgsfw_fee       decimal(12,2)         comment       '�ֹ�˾�����-�ſ�ǰһ������ȡ',
mon_lj_fgsfw_fee       decimal(12,2)         comment       '�ֹ�˾�����-ÿ����ȡ�ۼ�',
one_tm_db_fee       decimal(12,2)         comment       '������',
one_tm_xzzh_fee       decimal(12,2)         comment       '�����ۺϷ�',
pre_sys_serv_fee_rto       decimal(12,2)         comment       'ǰ��ϵͳ�����ϵ��',
serv_fee_crt_inc       decimal(12,2)         comment       '���ڷ���Ѵ���',
new_pre_serv_fee_inc       decimal(12,2)         comment       '������ҵ������ǰ�÷���Ѵ���',
new_one_tm_fee       decimal(12,2)         comment       '������ҵ��һ������ȡ����',
new_mon_fee       decimal(12,2)         comment       '������ҵ������ȡ����',
etsn_pre_serv_fee_inc       decimal(12,2)         comment       'չ��ҵ������ǰ�÷���Ѵ���',
etsn_one_tm_fee       decimal(12,2)         comment       'չ��ҵ��һ������ȡ����',
etsn_mon_fee       decimal(12,2)         comment       'չ��ҵ������ȡ����',
pln_settle_tm       varchar(10)         comment       '�ƻ�����ʱ��',
act_settle_tm       varchar(10)         comment       'ʵ�ʽ���ʱ��',
dw_src_sys       varchar(50)         comment       '��Դϵͳ',
dw_src_tbl       varchar(500)         comment       '��Դ��',
dw_ins_tm       datetime         comment       '����ʱ��',
dw_upd_tm       datetime         comment       '����ʱ��',
dw_ins_usr       varchar(50)         comment       '�����û�',
dw_upd_usr       varchar(50)         comment       '�����û�',
PRIMARY KEY (stat_dt,business_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ٴ�����ҵ�������ϸ��';