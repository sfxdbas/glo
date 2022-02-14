select
	a.code kittag,
	case
		when b.code = b.code then 'YES'
		else 'NO'
	end as licensed
from
	(
	select :code as code )
a
left join (
	select
		E.CODE
		--,n.black_listed,na.state_fk,ku.email_address,kd."name",u.role_fk
from
	enrollment_ref E,
	NODE N,
	node_assignment NA,
	KM_USER KU,
	kyc_dealer KD,
	USER_ROLE U
where
	E.ID = N.enrollment_ref
	and N.ID = NA.node_fk
	and left( ku.email_address,	strpos( ku.email_address, '@' ) -1 ) = lower( e.code )
	and kd.pk = na.kyc_dealer_fk
	and ku.pk = u.user_fk
	and code = :code )
b on a.code = b.code ;