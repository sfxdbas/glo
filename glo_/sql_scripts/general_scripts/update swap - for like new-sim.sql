
update
	sim_swap_demographic
set
	swap_status = 'SWAPPED',
	registration_status = 'SENT_TO_SIEBEL',
	reg_status_description = 'SUCCESS'
where
	lower (reg_status_description) like '%new sim%'
	and date(create_date) between '2021-11-01' and '2021-11-24';