update node n 
set n.black_listed = (select true from enrollment_ref e
						where e.id = n.enrollment_ref)
where n.enrollment_ref in (select id from enrollment_ref e
							where e.code in ('insert kittag here'));