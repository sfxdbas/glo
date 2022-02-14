   --delete duplicate from setting 
   
   with t1 as (
   select id,  name, rank() over (partition by name order by id )
   from setting 
   group by 1 
  -- having count(1) > 1
  order by 2,3
  )
  select * from t1 where rank != 1
  ;
  
  delete from setting where id in ();