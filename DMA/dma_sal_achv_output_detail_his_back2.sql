SET SESSION tmp_table_size=1024*1024*1024;
SET SESSION max_heap_table_size=1024*1024*1024;


INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
  ('${pt_dutyno}', '${p_duty_nm}','1','>>>>>>>>>> JOB START >>>>>>>>>>', '0', '总共7步！！', 0,'${p_day}',  NOW(),  'dl' );
  
DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp00`;
CREATE TEMPORARY TABLE `output_detail_tmp00` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`src_type` INT(11) NULL DEFAULT NULL COMMENT '',
KEY `output_detail_tmp00_car_business_id`(car_business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

-- 业务还款计划列表
 INSERT INTO output_detail_tmp00
 SELECT DISTINCT t1.`orig_business_id`,IFNULL(t1.`src_type`,1) src_type
 FROM ODS_XD_TUANDAI_BM.tb_repayment_biz_plan_list_dh_ods t1
 WHERE t1.part_dt = DATE_FORMAT('20181126','%Y-%m-%d') ;	


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
	`loan_rate` DECIMAL(10,4) DEFAULT NULL COMMENT '年利率',
	`borrow_limit` INT(11) DEFAULT NULL COMMENT '借款期限',
	`shd_principa_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '申请借款金额',
	`platform_id` VARCHAR(10) DEFAULT NULL COMMENT '资金方',
KEY `output_detail_tmp1_business_id`(BUSINESS_ID),
KEY `output_detail_tmp1_branch_id`(branch_id),
KEY `output_detail_tmp1_area_id`(area_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

-- 业务基本信息事实表
INSERT INTO output_detail_tmp1
SELECT t2.business_id,
       t2.first_business_id,
       t2.business_type,--	业务类型
	   t2.customer_name, -- 客户姓名
	   t2.branch_id,
	   t2.area_id,
	   CASE WHEN t2.business_id LIKE '%ZQ%' THEN '是' ELSE '否' END is_extion,
       CASE WHEN IFNULL(issue_type,0) = 0 THEN '否' ELSE '是' END is_issue,
	   t2.`loan_rate`,
	   t2.`apply_borrow_limit`,
	   t2.`shd_principa_amt`,
	   CASE WHEN t2.`platform_id`= 2 THEN '你我金融' ELSE '团贷网' END platform_id
FROM DWS_DATA.dws_agr_xd_business t2
WHERE t2.part_dt = DATE_FORMAT('20181126','%Y-%m-%d') 
  AND (IFNULL(t2.`business_type_detail` ,'business') NOT IN ('T150','A100') OR t2.business_type <> 'T140'); -- 20181101 巧芬剔除汽车垫资代采、汽车融资租赁、扶贫贷 


		
 DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp01`;
CREATE TEMPORARY TABLE `output_detail_tmp01` (
	`business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`out_date` DATETIME NULL DEFAULT NULL COMMENT '[合并还款计划时间]',
KEY `output_detail_tmp01_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

-- 出款明细事实表   修改
INSERT INTO output_detail_tmp01
SELECT t3.business_id,out_date out_date
FROM DWS_DATA.dws_evt_xd_output_list t3
WHERE t3.part_dt = DATE_FORMAT('20181126','%Y-%m-%d')
  AND t3.out_date >= '2016-03-11'
  AND t3.is_issue = '0';


-- 标的信息事实表
INSERT INTO output_detail_tmp01
SELECT a.BUSINESS_ID,
	   a.full_time out_date
FROM DWS_DATA.dws_agr_xd_issue_business a
WHERE a.part_dt = DATE_FORMAT('20181126','%Y-%m-%d') 
AND IFNULL(a.full_time,'') != ''
GROUP BY a.BUSINESS_ID;

-- 2018年10月补录的单，因没有补录出款信息，需求方提出以进件日期代替出款日期
INSERT INTO output_detail_tmp01
SELECT t2.business_id,
	    DATE_FORMAT(t2.input_time,'%Y-%m-%d') out_date
FROM DWS_DATA.dws_agr_xd_business t2
WHERE t2.part_dt = DATE_FORMAT('20181126','%Y-%m-%d') 
AND IFNULL(t2.`customer_class`,0) = -1 
AND DATE_FORMAT(input_time,'%Y-%m-%d')  >= '2016-03-11';

INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
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
KEY `output_detail_tmp2_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

-- 业务出款申请费用明细表 tb_business_apply_output_ods
INSERT INTO output_detail_tmp2
SELECT t3.first_business_id AS business_id,
       t1.business_id AS ext_business_id,
       DATE_FORMAT(t4.out_date,'%Y-%m-%d') AS date_id, 
       t1.one_time_fgsfw_amt,
	   t1.one_time_syqzfw_amt,
	   t1.one_time_xzzhf_amt,
	   -- t1.mon_fgsfw_amt,
	   t1.one_time_ptf_amt,
	   -- t1.mon_ptf_amt,
	   t1.one_time_dbf_amt
FROM 
(SELECT a.`business_id`,
       IFNULL(SUM(CASE WHEN a.`is_one_time_charge` = 2 AND a.`fee_item_name` IN ('分公司服务费') THEN a.`fee_value` END),0) one_time_fgsfw_amt, -- 分公司服务费
       IFNULL(SUM(CASE WHEN a.`is_one_time_charge` = 2 AND a.`fee_item_name` IN ('剩余前置服务费') THEN a.`fee_value` END),0) one_time_syqzfw_amt, -- 剩余前置服务费
       IFNULL(SUM(CASE WHEN a.`is_one_time_charge` = 2 AND a.`fee_item_name` IN ('行政综合费' ) THEN a.`fee_value` END),0) one_time_xzzhf_amt, -- 行政综合费
      -- ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 1 and a.`fee_item_name` like '%月收分公司服务费%'  THEN a.`fee_value` END),0) mon_fgsfw_amt, -- 分公司月服务费总额
       IFNULL(SUM(CASE WHEN a.`is_one_time_charge` = 2 AND a.`fee_item_name` IN ('平台费') THEN a.`fee_value` END),0) one_time_ptf_amt,  -- 平台费(一次性)
      -- ifnull(SUM(CASE WHEN a.`is_one_time_charge` = 1 and a.`fee_item_name` IN ('月收平台费') THEN a.`fee_value` END),0) mon_ptf_amt,  -- 月收平台费
       IFNULL(SUM(CASE WHEN a.`is_one_time_charge` = 2 AND a.`fee_item_name` IN ('担保费') THEN a.`fee_value` END),0) one_time_dbf_amt  -- 担保费(一次性)
FROM ODS_XD_TUANDAI_BM.`tb_business_apply_output_ods` a 
WHERE a.part_dt = DATE_FORMAT('20181126','%Y-%m-%d')
  AND a.business_id IS NOT NULL
GROUP BY a.`business_id`)t1
LEFT JOIN output_detail_tmp1 t3 ON t1.business_id = t3.business_id
JOIN output_detail_tmp01 t4 ON t1.business_id = t4.business_id;


INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp2', '200', '获取出款费用明细', 0,'${p_day}',  NOW(),  'dl' );	
  
  
  
-- 业务还款计划费用项目明细表tb_car_business_after_detail_ods
DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp3`;
CREATE TEMPORARY TABLE `output_detail_tmp3` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`business_after_id` VARCHAR(50) NOT NULL COMMENT '[期数]',
	`plan_repayment_date` DATETIME NULL DEFAULT NULL COMMENT '[合并还款计划时间]',
	`mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费',
	`mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台月服务费',
KEY `output_detail_tmp3_car_business_id`(car_business_id),
KEY `output_detail_tmp3_business_after_id`(business_after_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

INSERT INTO output_detail_tmp3
SELECT business_id car_business_id,
       business_after_id,
	   `plan_repayment_date`,
       mon_fgsfw_amt,
       mon_ptf_amt
FROM (SELECT  a.`business_id`,
				a.`business_after_id`,
				a.`plan_repayment_date`,
				SUM(CASE WHEN a.fee_name LIKE '%月收分公司服务费%' THEN IFNULL(a.plan_fee_value,0) ELSE 0 END) mon_fgsfw_amt,
				SUM(CASE WHEN a.fee_name LIKE '%平台费%' THEN a.plan_fee_value ELSE 0 END) mon_ptf_amt
		FROM ODS_XD_TUANDAI_BM.`tb_car_business_after_detail_ods` a
		WHERE a.part_dt = DATE_FORMAT('20181126','%Y-%m-%d')
		  AND a.`business_after_id` NOT LIKE '%00%' 
		GROUP BY a.`business_id`,
				 a.`business_after_id`,
				 a.`plan_repayment_date`)t 
LEFT JOIN output_detail_tmp00 b ON t.business_id = b.car_business_id
WHERE mon_ptf_amt+mon_fgsfw_amt >0
  AND b.src_type = 1
  ;
  
INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp3', '300', '统计信贷系统按月收费用明细', 0,'${p_day}',  NOW(),  'dl' );	

DROP TEMPORARY TABLE IF EXISTS `output_detail_tmp4`;
CREATE TEMPORARY TABLE `output_detail_tmp4` (
	`car_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`ext_business_id` VARCHAR(50) NOT NULL COMMENT '[业务编号]',
	`date_id` DATE NULL DEFAULT NULL COMMENT '[统计日期]',
	`mon_fgsfw_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '分公司月服务费',
	`mon_ptf_amt` DECIMAL(12,2) NULL DEFAULT NULL COMMENT '平台月服务费',
KEY `output_detail_tmp4_car_business_id`(car_business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ;

-- [贷后管理主表]
INSERT INTO output_detail_tmp4
SELECT o.car_business_id,
       o.ext_business_id,
       a.plan_repayment_date date_id,
       IFNULL(a.mon_fgsfw_amt,0) mon_fgsfw_amt,
       IFNULL(a.mon_ptf_amt,0) mon_ptf_amt
FROM (SELECT o.car_business_id, car_business_after_id, repayed_flag,finance_confirmed_date,fatct_replayDate,IFNULL(o.`car_business_after_defer`,o.`car_business_id`)ext_business_id ,fact_principa
		FROM ODS_XD_TUANDAI_BM.tb_car_business_after_ods o 
		JOIN output_detail_tmp00 t1 ON o.car_business_id = t1.car_business_id 
		WHERE o.part_dt =  DATE_FORMAT('20181126','%Y-%m-%d')
		  AND IFNULL(o.repayed_flag,0)!=6	
		  AND t1.src_type = 1) o
LEFT JOIN output_detail_tmp3 a ON a.car_business_id = o.car_business_id AND a.business_after_id = o.car_business_after_id ;  -- repayed_type = 6 表示申请展期的那一期


-- 还款计划应还项目明细表 tb_repayment_biz_plan_list_detail_dh_ods
INSERT INTO output_detail_tmp4
SELECT t2.orig_business_id AS car_business_id,
       t1.business_id AS ext_business_id,
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
  AND part_dt = DATE_FORMAT('20181126','%Y-%m-%d')
  GROUP BY a.`plan_list_id`,
	   a.`business_id`,
	   a.due_date)t1
LEFT JOIN (
SELECT t.`plan_list_id`,t.`orig_business_id`,t.`fact_repay_date`,t.`finance_comfirm_date`, IFNULL(t.`repay_flag`,0) repay_flag
FROM `ODS_XD_TUANDAI_BM`.`tb_repayment_biz_plan_list_dh_ods` t 
WHERE IFNULL(t.`src_type`,1) != 1 
  AND t.part_dt = DATE_FORMAT('20181126','%Y-%m-%d')
  )t2 ON t1.plan_list_id = t2.plan_list_id
WHERE IFNULL(t2.repay_flag,0) !=6; 
  

INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
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
KEY `output_detail_tmp5_business_id`(business_id)
)ENGINE=MEMORY DEFAULT CHARSET=utf8 ; 

INSERT INTO output_detail_tmp5 
SELECT *
FROM (
		SELECT  tt.business_id,
				tt.ext_business_id,
			   tt.date_id,
			   SUM(one_time_fgsfw_amt) one_time_fgsfw_amt,
			   SUM(one_time_syqzfw_amt) one_time_syqzfw_amt,
			   SUM(one_time_xzzhf_amt) one_time_xzzhf_amt,
			   SUM(mon_fgsfw_amt) mon_fgsfw_amt,
			   SUM(one_time_ptf_amt) one_time_ptf_amt,
			   SUM(mon_ptf_amt) mon_ptf_amt,
			   SUM(one_time_dbf_amt) one_time_dbf_amt
		FROM 
		(
			SELECT t1.business_id,
				   t1.ext_business_id,
		           DATE_FORMAT(t1.date_id,'%Y-%m-%d') date_id,
				   t1.one_time_fgsfw_amt,
				   t1.one_time_syqzfw_amt,
				   t1.one_time_xzzhf_amt,
				   0 AS mon_fgsfw_amt,
				   t1.one_time_ptf_amt,
				   0 AS mon_ptf_amt,
				   t1.one_time_dbf_amt
			FROM output_detail_tmp2 t1
			UNION ALL
			 SELECT t1.car_business_id AS business_id, 
				   t1.ext_business_id,
		           DATE_FORMAT(t1.date_id,'%Y-%m-%d') date_id,
				   0 AS one_time_fgsfw_amt,
				   0 AS one_time_syqzfw_amt,
				   0 AS one_time_xzzhf_amt,
				   t1.mon_fgsfw_amt,
				   0 AS one_time_ptf_amt,
				   t1.mon_ptf_amt,
				   0 AS one_time_dbf_amt
			FROM output_detail_tmp4 t1
		)tt
		GROUP BY  tt.business_id,
				  tt.ext_business_id,
				  tt.date_id
		  ) td 
WHERE one_time_fgsfw_amt+one_time_syqzfw_amt+one_time_xzzhf_amt+mon_fgsfw_amt + one_time_ptf_amt + mon_ptf_amt+ one_time_dbf_amt>0;
    

INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
  ('${pt_dutyno}', '${p_duty_nm}','1','output_detail_tmp5', '500', '汇总贷后系统和信贷系统一次性收和月收费用明细', 0,'${p_day}',  NOW(),  'dl' );	
    
  
  
ALTER TABLE dma_sal_achv_output_detail_his TRUNCATE PARTITION dma_sal_achv_output_detail_his_${pt_day};
INSERT INTO dma_sal_achv_output_detail_his 	  
SELECT     t1.business_id,
	       t1.ext_business_id,
		   t1.date_id,
		   DATE_FORMAT(t3.out_date,'%Y-%m-%d'),
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
		   NOW() dw_ins_tm,
		   'dl' dw_ins_usr,
		    DATE_FORMAT('20181126','%Y-%m-%d') part_dt
FROM output_detail_tmp5 t1
JOIN (SELECT DISTINCT  t2.business_id,
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
	   FROM output_detail_tmp1 t2
	   WHERE t2.business_id NOT LIKE '%ZQ%') t2 ON t1.business_id = t2.first_business_id
JOIN output_detail_tmp01 t3 ON t1.ext_business_id = t3.business_id
LEFT JOIN DIM_DATA.`dim_prd_xd_business_type` t4 ON t2.business_type = t4.business_type
LEFT JOIN DIM_DATA.dim_org_info t5 ON t2.branch_id = t5.branch_id
WHERE t5.dw_src_sys ='xd';


INSERT INTO public_data.tb_duty_detail_log
  (duty_id,duty_nm,duty_type, deal_nm,step_id, step_desc, row_cnt, state_dt,create_tm, create_usr)
VALUES
  ('${pt_dutyno}', '${p_duty_nm}','1','>>>>>>>>>> JOB END >>>>>>>>>>', '300', '出款明细表，成功！！！！', 0,'${p_day}',  NOW(),  'dl' );




