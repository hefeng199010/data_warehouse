create table dma_sal_achv_fsd_out_tra_sum
(
stat_dt       varchar(10)         comment       'ͳ������',
area_nm       varchar(100)         comment       '����',
branch_nm       varchar(100)         comment       '�ֹ�˾',
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
one_tm_xzzh_fee       decimal(12,2)         comment       '�����ۺϷ�',
new_pre_serv_fee_inc       decimal(12,2)         comment       '������ҵ������ǰ�÷���Ѵ���',
new_one_tm_fee       decimal(12,2)         comment       '������ҵ��һ������ȡ����',
new_mon_fee       decimal(12,2)         comment       '������ҵ������ȡ����',
etsn_pre_serv_fee_inc       decimal(12,2)         comment       'չ��ҵ������ǰ�÷���Ѵ���',
etsn_one_tm_fee       decimal(12,2)         comment       'չ��ҵ��һ������ȡ����',
etsn_mon_fee       decimal(12,2)         comment       'չ��ҵ������ȡ����',
input_dt       varchar(10)         comment       '��������',
update_dt       varchar(10)         comment       '��������',
dw_src_sys       varchar(50)         comment       '��Դϵͳ',
dw_src_tbl       varchar(500)         comment       '��Դ��',
dw_ins_tm       datetime         comment       '����ʱ��',
dw_upd_tm       datetime         comment       '����ʱ��',
dw_ins_usr       varchar(50)         comment       '�����û�',
dw_upd_usr       varchar(50)         comment       '�����û�'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ٴ�����ҵ����ٻ��ܱ�';