/* SQL Windows Functions */

-- SQL default frame;
range between unbounded preceding and CURRENT row;

-- first_value
select first_value(column_name) over
 (PARTITION by column_name order by column_name);
 
-- LAST_VALUE
select last_value(column_name) over
 (PARTITION by column_name order by column_name
 range between unbounded preceding 
 and unbounded following 
 /*rows between unbounded preceding 
 and unbounded following*/
 );
 
 
-- Alternate way to write windows functions 
select *, 
first_value(column_name) over w ,
last_value(column_name) over w ,
from table_name
window w as (PARTITION by column_name 
order by column_name range between unbounded preceding 
 and unbounded following)
;
-->

-- nth_value; used to get the position of a particular 
	-- partition
select nth_value(column_name,2) over
 (PARTITION by column_name order by column_name)
from table_name
;

--> last_value and nth_value require the frame clause


--NTILE
select NTILE(3) over (order by column_name) 
;

--cume_dist (cummulative distribution)
-- eg. fetch 1st-30% data distribution
select cume_dist() over (order by column_name) 
from table_name;


-- percent_rank
select percent_rank() over (order by column_name)
from table_name;





