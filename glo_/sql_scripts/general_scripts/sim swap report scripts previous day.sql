select * from sim_swap_demographic 
where check_status = 'FAILED_CHECK'
and date(create_date) = date(now)-1
; ----Cancelled Swap

select * from sim_swap_demographic
where check_status = 'CHECKED' 
and registration_status = 'FAILED'
and date(create_date) = date(now)-1
; ----  Checked, Failed push to Siebel

select * from sim_swap_demographic
where registration_status = 'SENT_TO_SIEBEL' 
and swap_status = 'SWAPPED'
and date(create_date) = date(now)-1
; --- Sent to Siebel, Swappped

select * from sim_swap_demographic
where registration_status = 'SENT_TO_SIEBEL'
and swap_status <> 'SWAPPED'
and date(create_date) = date(now)-1
; --- Sent to Siebel, not Swappped (This is not possible though)

select * from sim_swap_demographic
where check_status = 'CHECKED' 
and (registration_status = 'FAILED' or  registration_status  is null) 
and date(create_date) = date(now)-1
;
-- Checked and Not Sent to Siebel

select * from sim_swap_demographic 
where check_status is null
and date(create_date) = date(now)-1
; ----- Unchecked


-- canceled swap 
select count(1) -- *
from sim_swap_demographic 
where check_status = 'FAILED_CHECK'
and date(create_date) = date(now)-1
; ----Cancelled Swap

select count(1) -- *
from sim_swap_demographic
where check_status = 'CHECKED' 
and registration_status = 'FAILED'
and date(create_date) = date(now)-1
; ----  Checked, Failed push to Siebel

select count(1) -- * 
from sim_swap_demographic
where registration_status = 'SENT_TO_SIEBEL' 
and swap_status = 'SWAPPED'
and date(create_date) = date(now)-1
; --- Sent to Siebel, Swappped

select count(1) --* 
from sim_swap_demographic
where registration_status = 'SENT_TO_SIEBEL'
and swap_status <> 'SWAPPED'
and date(create_date) = date(now)-1
; --- Sent to Siebel, not Swappped (This is not possible though)

select count(1) -- *
from sim_swap_demographic
where check_status = 'CHECKED' 
and (registration_status = 'FAILED' or  registration_status  is null) 
and date(create_date) = date(now)-1
;
-- Checked and Not Sent to Siebel

select count(1) -- *
from sim_swap_demographic 
where check_status is null
and date(create_date) = date(now)-1
; ----- Unchecked