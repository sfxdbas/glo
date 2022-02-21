
select -- daily
	coalesce( count( na.pk ),
	0 ) as rowcount
from
	node nd
left join node_assignment na on
	nd.id = na.node_fk
where
	na.kyc_dealer_fk not in (
	select
		distinct( DEALER_FK )
	from
		DEALER_EXCLUSION_LIST )
	and not  exists  (
	select
		1
	from
		simrop_registration_trend srt
	where
		srt.node_id = na.node_fk
		and TRUNC( srt.SYNC_DATE ) = TRUNC( SYSDATE )
)
--	and nd.LAST_SYNC_TIME >= :expectedLastSyncTime
--	and ( nd.deleted is null
	and nd.deleted = :deleted 
--	)
--	and exists(
--	select
--		pk
--	from
--		KM_USER_DEALER_MAPPER k
--	where
--		k.kyc_dealer_fk = na.kyc_dealer_fk
--		and km_user_fk = :kmuser
--		and k.deleted = :falseParam )
	;
	
	
	
	select --monthly
	coalesce( count( na.pk ),
	0 ) as rowcount
from
	node_assignment na
left join node nd on
	nd.id = na.node_fk
where
	na.kyc_dealer_fk not in (
	select
		distinct( DEALER_FK )
	from
		DEALER_EXCLUSION_LIST )
	and exists (
	select
		1
	from
		simrop_registration_trend srt
	where
		srt.node_id = na.node_fk
		and TRUNC( srt.SYNC_DATE ) >= :monthBeginning )
--	and  nd.LAST_SYNC_TIME >= :expectedLastSyncTime
	and --( nd.deleted is null
	 nd.deleted = :deleted 
	 -- )
--	and exists(
--	select
--		pk
--	from
--		KM_USER_DEALER_MAPPER k
--	where
--		k.kyc_dealer_fk = na.kyc_dealer_fk
--		and km_user_fk = :kmuser
--		and k.deleted = :falseParam );