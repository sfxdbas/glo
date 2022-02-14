"legacy_biometrics"         "left_index"
"legacy_biometrics"         "left_thumb"
"legacy_biometrics"         "passport"
"legacy_biometrics"         "right_index"
"legacy_biometrics"         "right_thumb"

select * from pg_largeobject where loid in (select left_index from legacy_biometrics ); -- in progress --> 176
select * from pg_largeobject where loid in (select left_thumb from legacy_biometrics ); -- in progress --> 177 
select * from pg_largeobject where loid in (select passport from legacy_biometrics );
select * from pg_largeobject where loid in (select right_index from legacy_biometrics ); -- in progress --> 178
select * from pg_largeobject where loid in (select right_thumb from legacy_biometrics ); -- in progress --> 186 



