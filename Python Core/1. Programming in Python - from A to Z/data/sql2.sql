IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'caedw.access_authnt') AND type in (N'V'))
DROP VIEW caedw.access_authnt;
GO
CREATE VIEW caedw.access_authnt AS select 
axau.access_authnt_id
, axau.access_authnt_no
, axau.verson_no
, axau.secrty_view_cd
, scyvewcd.stndrd_mn SECRTY_VIEW_MN
, scyvewcd.stndrd_ds SECRTY_VIEW_DS
, axau.auto_rgstrn_in
, axau.authnt_type_cd
, atctypcd.stndrd_mn AUTHNT_TYPE_MN
, atctypcd.stndrd_ds AUTHNT_TYPE_DS
, axau.access_class_id
, acsclsid.access_class_na
, axau.abm_daily_limit_id
, axau.abm_weekly_limit_id
, axau.pos_daily_limit_id
, axau.pos_weekly_limit_id
, axau.electr_bnking_authrz_in
, axau.last_active_dt
, axau.distbn_media_cd
, dismdacd.stndrd_mn DISTBN_MEDIA_MN
, dismdacd.stndrd_ds DISTBN_MEDIA_DS
, axau.losstl_in
, axau.fraud_in
, axau.issue_dt
, axau.expiry_dt
, axau.source_appl_cd
, srcappcd.stndrd_mn SOURCE_APPL_MN
, srcappcd.stndrd_ds SOURCE_APPL_DS
, axau.web_full_prtfol_allow_cd
, wepoalcd.stndrd_mn WEB_FULL_PRTFOL_ALLOW_MN
, wepoalcd.stndrd_ds WEB_FULL_PRTFOL_ALLOW_DS
, axau.abm_hold_dposit_cd
, abhodecd.stndrd_mn ABM_HOLD_DPOSIT_MN
, abhodecd.stndrd_ds ABM_HOLD_DPOSIT_DS
, axau.abm_partl_hold_dposit_cd
, abphdecd.stndrd_mn ABM_PARTL_HOLD_DPOSIT_MN
, abphdecd.stndrd_ds ABM_PARTL_HOLD_DPOSIT_DS
, axau.appl_stat_cd
, appstscd.stndrd_mn APPL_STAT_MN
, appstscd.stndrd_ds APPL_STAT_DS
, axau.pin_type_cd
, pintypcd.stndrd_mn PIN_TYPE_MN
, pintypcd.stndrd_ds PIN_TYPE_DS
, axau.pin_mismtc_ct
, axau.last_issued_verson_no
, axau.access_class_cd
, acsclscd.stndrd_mn ACCESS_CLASS_MN
, acsclscd.stndrd_ds ACCESS_CLASS_DS
, axau.issung_branch_no
, axau.card_subtyp_cd
, crdstycd.stndrd_mn CARD_SUBTYP_MN
, crdstycd.stndrd_ds CARD_SUBTYP_DS
, axau.cnp_daily_limit_id
, axau.cnp_weekly_limit_id
, axau.flash_prfnce_in
, axau.mobil_wallet_provsn_in
, axau.mobil_wallet_intrac_token_ct
, axau.mobil_wallet_vsa_token_ct
, axau.altrnt_access_authnt_no
, axau.last_change_dt
, axau.to_dt
, axau.load_ts
from
 caedw.ACCESS_AUTHNT_T1 AXAU 
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 SCYVEWCD 
ON axau.secrty_view_cd = scyvewcd.stndrd_cd
AND scyvewcd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 ATCTYPCD 
ON axau.authnt_type_cd = atctypcd.stndrd_cd
AND atctypcd.to_dt = '9999-12-31'
 LEFT OUTER JOIN (SELECT access_class_T1.access_class_id, access_class_T1.access_class_na FROM caedw.ACCESS_CLASS_T1 WHERE access_class_T1.to_dt = '9999-12-31' GROUP BY access_class_T1.access_class_id, access_class_T1.access_class_na) AS ACSCLSID 
ON axau.access_class_id = acsclsid.access_class_id
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 DISMDACD 
ON axau.distbn_media_cd = dismdacd.stndrd_cd
AND dismdacd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 SRCAPPCD 
ON axau.source_appl_cd = srcappcd.stndrd_cd
AND srcappcd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 WEPOALCD 
ON axau.web_full_prtfol_allow_cd = wepoalcd.stndrd_cd
AND wepoalcd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 ABHODECD 
ON axau.abm_hold_dposit_cd = abhodecd.stndrd_cd
AND abhodecd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 ABPHDECD 
ON axau.abm_partl_hold_dposit_cd = abphdecd.stndrd_cd
AND abphdecd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 APPSTSCD 
ON axau.appl_stat_cd = appstscd.stndrd_cd
AND appstscd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 PINTYPCD 
ON axau.pin_type_cd = pintypcd.stndrd_cd
AND pintypcd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 ACSCLSCD 
ON axau.access_class_cd = acsclscd.stndrd_cd
AND acsclscd.to_dt = '9999-12-31'
 LEFT OUTER JOIN caedw.STNDRD_CD_T1 CRDSTYCD 
ON axau.card_subtyp_cd = crdstycd.stndrd_cd
AND crdstycd.to_dt = '9999-12-31';