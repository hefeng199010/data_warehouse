SET SESSION tmp_table_size=1024*1024*1024;
SET SESSION max_heap_table_size=1024*1024*1024;


insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','>>>>>>>>>> JOB START >>>>>>>>>>', '0', '总共7步！！', 0,'${p_day}',  NOW(),  'dl' );
  
DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp00`;
CREATE TEMPORARY TABLE `output_detail_tmp00` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`src_type` INT(11) NULL DEFAULT NULL COMMENT '',
key `output_detail_tmp00_car_business_id`(car_business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

 insert into output_detail_tmp00
 SELECT DISTINCT t1.`orig_business_id`,IFNULL(t1.`src_type`,1) src_type
 from ODS_XD_TUANDAI_BM.tb_repayment_biz_plan_list_dh_ods t1
 where t1.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d') ;	


DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp1`;
CREATE TEMPORARY TABLE `output_detail_tmp1` (
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`first_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`business_type` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务类型',
	`customer_name` VARCHAR(50) NULL DEFAULT NULL COMMENT '客户名称',
	`branch_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '业务所属分公司编号',
	`area_id` VARCHAR(50) NULL DEFAULT NULL COMMENT '区域编号',
	`is_extion` VARCHAR(10) DEFAULT NULL COMMENT '是否展期',
	`is_issue` VARCHAR(10) DEFAULT NULL COMMENT '是否上标',
	`loan_rate` decimal(10,4) DEFAULT NULL COMMENT '年利率',
	`borrow_limit` int(11) DEFAULT NULL COMMENT '借款期限',
	`shd_principa_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '申请借款金额',
	`platform_id` VARCHAR(10) DEFAULT NULL COMMENT '资金方',
key `output_detail_tmp1_business_id`(BUSINESS_ID),
key `output_detail_tmp1_branch_id`(branch_id),
key `output_detail_tmp1_area_id`(area_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

insert into output_detail_tmp1
select t2.business_id,
       t2.first_business_id,
       t2.business_type,--	业务类型
	   t2.customer_name, -- 客户姓名
	   t2.branch_id,
	   t2.area_id,
	   CASE WHEN t2.business_id LIKE '%ZQ%' THEN '是' ELSE '否' END is_extion,
       case when ifnull(issue_type,0) = 0 then '否' else '是' end is_issue,
	   t2.`loan_rate`,
	   t2.`apply_borrow_limit`,
	   t2.`shd_principa_amt`,
	   CASE WHEN t2.`platform_id`= 2 THEN '你我金融' ELSE '团贷网' END platform_id
from DWS_DATA.dws_agr_xd_business t2
where t2.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d') 
  AND (IFNULL(t2.`business_type_detail` ,'business') NOT IN ('T150','A100') or t2.business_type <> 'T140'); -- 20181101 巧芬剔除汽车垫资代采、汽车融资租赁、扶贫贷 


		
 DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp01`;
CREATE TEMPORARY TABLE `output_detail_tmp01` (
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`out_date` DATETIME NULL DEFAULT NULL COMMENT '[合并还款计划时间]',
key `output_detail_tmp01_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

insert into output_detail_tmp01
select t3.business_id,min(out_date) out_date
from DWS_DATA.dws_evt_xd_output_list t3
where t3.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d')
  and t3.out_date >= '2016-03-11'
  and t3.is_issue = '0'
group by t3.business_id;

insert into output_detail_tmp01
select a.BUSINESS_ID,
	   min(a.full_time) out_date
from DWS_DATA.dws_agr_xd_issue_business a
where a.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d') 
and ifnull(a.full_time,'') != ''
group by a.BUSINESS_ID;

-- 2018年10月补录的单，因没有补录出款信息，需求方提出以进件日期代替出款日期
insert into output_detail_tmp01
select t2.business_id,
	    DATE_FORMAT(t2.input_time,'%Y-%m-%d') out_date
from DWS_DATA.dws_agr_xd_business t2
where t2.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d') 
and IFNULL(t2.`customer_class`,0) = -1 
and DATE_FORMAT(input_time,'%Y-%m-%d')  >= '2016-03-11';

insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp1', '100', '获取业务编号基本信息和出款时间', 0,'${p_day}',  NOW(),  'dl' );	

DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp2`;
CREATE TEMPORARY TABLE `output_detail_tmp2` (
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`ext_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`date_id` DATETIME NULL DEFAULT NULL COMMENT '[合并还款计划时间]',
	`one_time_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司服务费',
	`one_time_syqzfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '剩余前置服务费',
	`one_time_xzzhf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '行政综合费',
	-- `mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费总额',
	`one_time_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台费(一次性)',
	-- `mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '月收平台费',
	`one_time_dbf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '担保费(一次性)',
key `output_detail_tmp2_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

insert into output_detail_tmp2
select t3.first_business_id as business_id,
       t1.business_id as ext_business_id,
       date_format(t4.out_date,'%Y-%m-%d') as date_id, 
       t1.one_time_fgsfw_amt,
	   t1.one_time_syqzfw_amt,
	   t1.one_time_xzzhf_amt,
	   -- t1.mon_fgsfw_amt,
	   t1.one_time_ptf_amt,
	   -- t1.mon_ptf_amt,
	   t1.one_time_dbf_amt
from 
(SELECT a.`business_id`,
       ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 2 and a.`fee_item_name` IN ('分公司服务费') THEN a.`fee_value` END),0) one_time_fgsfw_amt, -- 分公司服务费
       ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 2 and a.`fee_item_name` IN ('剩余前置服务费') THEN a.`fee_value` END),0) one_time_syqzfw_amt, -- 剩余前置服务费
       ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 2 and a.`fee_item_name` IN ('行政综合费' ) THEN a.`fee_value` END),0) one_time_xzzhf_amt, -- 行政综合费
      -- ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 1 and a.`fee_item_name` like '%月收分公司服务费%'  THEN a.`fee_value` END),0) mon_fgsfw_amt, -- 分公司月服务费总额
       ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 2 and a.`fee_item_name` IN ('平台费') THEN a.`fee_value` END),0) one_time_ptf_amt,  -- 平台费(一次性)
      -- ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 1 and a.`fee_item_name` IN ('月收平台费') THEN a.`fee_value` END),0) mon_ptf_amt,  -- 月收平台费
       ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 2 and a.`fee_item_name` IN ('担保费') THEN a.`fee_value` END),0) one_time_dbf_amt  -- 担保费(一次性)
FROM ODS_XD_TUANDAI_BM.`tb_business_apply_output_ods` a 
WHERE a.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d')
  and a.business_id is not null
GROUP BY a.`business_id`)t1
left join output_detail_tmp1 t3 on t1.business_id = t3.business_id
join output_detail_tmp01 t4 on t1.business_id = t4.business_id;


insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp2', '200', '获取出款费用明细', 0,'${p_day}',  NOW(),  'dl' );	
  
  
  
  
DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp3`;
CREATE TEMPORARY TABLE `output_detail_tmp3` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`business_after_id` VARCHAR(50) NOT NULL COMMENT '[期数]',
	`plan_repayment_date` DATETIME NULL DEFAULT NULL COMMENT '[合并还款计划时间]',
	`mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费',
	`mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台月服务费',
key `output_detail_tmp3_car_business_id`(car_business_id),
key `output_detail_tmp3_business_after_id`(business_after_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

insert into output_detail_tmp3
SELECT business_id car_business_id,
       business_after_id,
	   `plan_repayment_date`,
       mon_fgsfw_amt,
       mon_ptf_amt
FROM (SELECT  a.`business_id`,
				a.`business_after_id`,
				a.`plan_repayment_date`,
				SUM(CASE WHEN a.fee_name LIKE '%月收分公司服务费%' THEN ifnull(a.plan_fee_value,0) ELSE 0 END) mon_fgsfw_amt,
				SUM(CASE WHEN a.fee_name LIKE '%平台费%' THEN a.plan_fee_value ELSE 0 END) mon_ptf_amt
		FROM ODS_XD_TUANDAI_BM.`tb_car_business_after_detail_ods` a
		WHERE a.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d')
		  AND a.`business_after_id` NOT LIKE '%00%' 
		GROUP BY a.`business_id`,
				 a.`business_after_id`,
				 a.`plan_repayment_date`)t 
left join output_detail_tmp00 b on t.business_id = b.car_business_id
WHERE mon_ptf_amt+mon_fgsfw_amt >0
  and b.src_type = 1
  ;
  
insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp3', '300', '统计信贷系统按月收费用明细', 0,'${p_day}',  NOW(),  'dl' );	

DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp4`;
CREATE TEMPORARY TABLE `output_detail_tmp4` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`ext_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`date_id` date NULL DEFAULT NULL COMMENT '[统计日期]',
	`mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费',
	`mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台月服务费',
key `output_detail_tmp4_car_business_id`(car_business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

insert into output_detail_tmp4
select o.car_business_id,
       o.ext_business_id,
       a.plan_repayment_date date_id,
       ifnull(a.mon_fgsfw_amt,0) mon_fgsfw_amt,
       ifnull(a.mon_ptf_amt,0) mon_ptf_amt
from (select o.car_business_id, car_business_after_id, repayed_flag,finance_confirmed_date,fatct_replayDate,IFNULL(o.`car_business_after_defer`,o.`car_business_id`)ext_business_id ,fact_principa
		from ODS_XD_TUANDAI_BM.tb_car_business_after_ods o 
		join output_detail_tmp00 t1 on o.car_business_id = t1.car_business_id 
		where o.part_dt =  DATE_FORMAT('${pt_day}','%Y-%m-%d')
		  and ifnull(o.repayed_flag,0)!=6	
		  and t1.src_type = 1) o
left join output_detail_tmp3 a on a.car_business_id = o.car_business_id and a.business_after_id = o.car_business_after_id ;  -- repayed_type = 6 表示申请展期的那一期


insert into output_detail_tmp4
SELECT t2.orig_business_id AS car_business_id,
       t1.business_id as ext_business_id,
       t1.due_date date_id,
       t1.mon_fgsfw_amt,
       t1.mon_ptf_amt
FROM 
(SELECT a.`plan_list_id`,
	   a.`business_id`,
	   a.due_date,
		SUM(CASE WHEN a.plan_item_name LIKE '%月收分公司服务费%' THEN a.plan_amount ELSE 0 END) mon_fgsfw_amt,
		SUM(CASE WHEN a.plan_item_name LIKE '%平台费%' THEN a.plan_amount ELSE 0 END) mon_ptf_amt
FROM  `ODS_XD_TUANDAI_BM`.`tb_repayment_biz_plan_list_detail_dh_ods` a
WHERE IFNULL(a.`src_type`,1) != 1
  AND part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d')
  GROUP BY a.`plan_list_id`,
	   a.`business_id`,
	   a.due_date)t1
LEFT JOIN (
SELECT t.`plan_list_id`,t.`orig_business_id`,t.`fact_repay_date`,t.`finance_comfirm_date`, IFNULL(t.`repay_flag`,0) repay_flag
FROM `ODS_XD_TUANDAI_BM`.`tb_repayment_biz_plan_list_dh_ods` t 
WHERE IFNULL(t.`src_type`,1) != 1 
  AND t.part_dt = DATE_FORMAT('${pt_day}','%Y-%m-%d')
  )t2 ON t1.plan_list_id = t2.plan_list_id
WHERE ifnull(t2.repay_flag,0) !=6; 
  

insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp4', '400', '统计贷后系统和信贷系统月收费用明细', 0,'${p_day}',  NOW(),  'dl' );	  

DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp5`;
CREATE TEMPORARY TABLE `output_detail_tmp5` (
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`ext_business_id` VARCHAR(50) NOT NULL COMMENT '[展期业务编号]',
	`date_id` VARCHAR(10) NULL DEFAULT NULL COMMENT '[统计日期]',
	`one_time_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司服务费',
	`one_time_syqzfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '剩余前置服务费',
	`one_time_xzzhf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '行政综合费',
	 `mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费总额',
	`one_time_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台费(一次性)',
	 `mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '月收平台费',
	`one_time_dbf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '担保费(一次性)',
key `output_detail_tmp5_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ; 

insert into output_detail_tmp5 
select *
from (
		select  tt.business_id,
				tt.ext_business_id,
			   tt.date_id,
			   sum(one_time_fgsfw_amt) one_time_fgsfw_amt,
			   sum(one_time_syqzfw_amt) one_time_syqzfw_amt,
			   sum(one_time_xzzhf_amt) one_time_xzzhf_amt,
			   sum(mon_fgsfw_amt) mon_fgsfw_amt,
			   sum(one_time_ptf_amt) one_time_ptf_amt,
			   sum(mon_ptf_amt) mon_ptf_amt,
			   sum(one_time_dbf_amt) one_time_dbf_amt
		from 
		(
			select t1.business_id,
				   t1.ext_business_id,
		           date_format(t1.date_id,'%Y-%m-%d') date_id,
				   t1.one_time_fgsfw_amt,
				   t1.one_time_syqzfw_amt,
				   t1.one_time_xzzhf_amt,
				   0 as mon_fgsfw_amt,
				   t1.one_time_ptf_amt,
				   0 as mon_ptf_amt,
				   t1.one_time_dbf_amt
			from output_detail_tmp2 t1
			union all
			 select t1.car_business_id as business_id, 
				   t1.ext_business_id,
		           date_format(t1.date_id,'%Y-%m-%d') date_id,
				   0 as one_time_fgsfw_amt,
				   0 as one_time_syqzfw_amt,
				   0 as one_time_xzzhf_amt,
				   t1.mon_fgsfw_amt,
				   0 as one_time_ptf_amt,
				   t1.mon_ptf_amt,
				   0 as one_time_dbf_amt
			from output_detail_tmp4 t1
		)tt
		group by  tt.business_id,
				  tt.ext_business_id,
				  tt.date_id
		  ) td 
where one_time_fgsfw_amt+one_time_syqzfw_amt+one_time_xzzhf_amt+mon_fgsfw_amt + one_time_ptf_amt + mon_ptf_amt+ one_time_dbf_amt>0;
    

insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp5', '500', '汇总贷后系统和信贷系统一次性收和月收费用明细', 0,'${p_day}',  NOW(),  'dl' );	
    
  
  
alter table dma_sal_achv_output_detail_his truncate partition dma_sal_achv_output_detail_his_${pt_day};
insert into dma_sal_achv_output_detail_his 	  
select     t1.business_id,
	       t1.ext_business_id,
		   t1.date_id,
		   date_format(t3.out_date,'%Y-%m-%d'),
		   t4.business_type_nm,
		   t5.branch_nm,
		   t5.area_nm,
		   t2.`customer_name`,
	       t2.is_issue,
		   t2.`loan_rate`,
		   t2.`borrow_limit`,
		   t2.`shd_principa_amt`,
		   t2.platform_id,
		   t1.one_time_fgsfw_amt,
		   t1.one_time_syqzfw_amt,
		   t1.one_time_xzzhf_amt,
		   t1.mon_fgsfw_amt,
		   t1.one_time_ptf_amt,
	       t1.mon_ptf_amt,
		   t1.one_time_dbf_amt,
		   now() dw_ins_tm,
		   'dl' dw_ins_usr,
		    DATE_FORMAT('${pt_day}','%Y-%m-%d') part_dt
from output_detail_tmp5 t1
join (select distinct  t2.business_id,
				   t2.first_business_id,
				   t2.business_type,--	业务类型
				   t2.customer_name, -- 客户姓名
				   t2.branch_id,
				   t2.area_id,
				   t2.is_extion,
				   t2.is_issue,
				   t2.`loan_rate`,
				   t2.`borrow_limit`,
				   t2.`shd_principa_amt`,
				   t2.platform_id
	   from output_detail_tmp1 t2
	   where t2.business_id not like '%ZQ%') t2 on t1.business_id = t2.first_business_id
join output_detail_tmp01 t3 on t1.ext_business_id = t3.business_id
left join DIM_DATA.`dim_prd_xd_business_type` t4 on t2.business_type = t4.business_type
left join DIM_DATA.dim_org_info t5 on t2.branch_id = t5.branch_id
where t5.dw_src_sys ='xd';


insert into public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
values
  ('${pt_dutyno}', '${p_duty_nm}','1','>>>>>>>>>> JOB END >>>>>>>>>>', '300', '出款明细表，成功！！！！', 0,'${p_day}',  NOW(),  'dl' );




