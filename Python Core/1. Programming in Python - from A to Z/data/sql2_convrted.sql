create or replace view caedw.access_authnt_vw as select
axau.access_authnt_id
, axau.access_authnt_no
, axau.verson_no
, axau.secrty_view_cd
, scyvewcd.stndrd_mn secrty_view_mn
, scyvewcd.stndrd_ds secrty_view_ds
, axau.auto_rgstrn_in
, axau.authnt_type_cd
, atctypcd.stndrd_mn authnt_type_mn
, atctypcd.stndrd_ds authnt_type_ds
, axau.access_class_id
, acsclsid.access_class_na
, axau.abm_daily_limit_id
, axau.abm_weekly_limit_id
, axau.pos_daily_limit_id
, axau.pos_weekly_limit_id
, axau.electr_bnking_authrz_in
, axau.last_active_dt
, axau.distbn_media_cd
, dismdacd.stndrd_mn distbn_media_mn
, dismdacd.stndrd_ds distbn_media_ds
, axau.losstl_in
, axau.fraud_in
, axau.issue_dt
, axau.expiry_dt
, axau.source_appl_cd
, srcappcd.stndrd_mn source_appl_mn
, srcappcd.stndrd_ds source_appl_ds
, axau.web_full_prtfol_allow_cd
, wepoalcd.stndrd_mn web_full_prtfol_allow_mn
, wepoalcd.stndrd_ds web_full_prtfol_allow_ds
, axau.abm_hold_dposit_cd
, abhodecd.stndrd_mn abm_hold_dposit_mn
, abhodecd.stndrd_ds abm_hold_dposit_ds
, axau.abm_partl_hold_dposit_cd
, abphdecd.stndrd_mn abm_partl_hold_dposit_mn
, abphdecd.stndrd_ds abm_partl_hold_dposit_ds
, axau.appl_stat_cd
, appstscd.stndrd_mn appl_stat_mn
, appstscd.stndrd_ds appl_stat_ds
, axau.pin_type_cd
, pintypcd.stndrd_mn pin_type_mn
, pintypcd.stndrd_ds pin_type_ds
, axau.pin_mismtc_ct
, axau.last_issued_verson_no
, axau.access_class_cd
, acsclscd.stndrd_mn access_class_mn
, acsclscd.stndrd_ds access_class_ds
, axau.issung_branch_no
, axau.card_subtyp_cd
, crdstycd.stndrd_mn card_subtyp_mn
, crdstycd.stndrd_ds card_subtyp_ds
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
delta.`/mnt/test/access_authnt_t1` axau
left outer join delta.`/mnt/test/stndrd_cd_t1` scyvewcd
on axau.secrty_view_cd = scyvewcd.stndrd_cd
and scyvewcd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` atctypcd
on axau.authnt_type_cd = atctypcd.stndrd_cd
and atctypcd.to_dt = '9999-12-31'
left outer join (select access_class_t1.access_class_id, access_class_t1.access_class_na from delta.`/mnt/test/access_class_t1` where access_class_t1.to_dt = '9999-12-31' group by access_class_t1.access_class_id, access_class_t1.access_class_na) as acsclsid
on axau.access_class_id = acsclsid.access_class_id
left outer join delta.`/mnt/test/stndrd_cd_t1` dismdacd
on axau.distbn_media_cd = dismdacd.stndrd_cd
and dismdacd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` srcappcd
on axau.source_appl_cd = srcappcd.stndrd_cd
and srcappcd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` wepoalcd
on axau.web_full_prtfol_allow_cd = wepoalcd.stndrd_cd
and wepoalcd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` abhodecd
on axau.abm_hold_dposit_cd = abhodecd.stndrd_cd
and abhodecd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` abphdecd
on axau.abm_partl_hold_dposit_cd = abphdecd.stndrd_cd
and abphdecd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` appstscd
on axau.appl_stat_cd = appstscd.stndrd_cd
and appstscd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` pintypcd
on axau.pin_type_cd = pintypcd.stndrd_cd
and pintypcd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` acsclscd
on axau.access_class_cd = acsclscd.stndrd_cd
and acsclscd.to_dt = '9999-12-31'
left outer join delta.`/mnt/test/stndrd_cd_t1` crdstycd
on axau.card_subtyp_cd = crdstycd.stndrd_cd
and crdstycd.to_dt = '9999-12-31';
