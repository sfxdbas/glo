BACKUP DDL ->

pg_dump -h localhost -p 5444 -s biocapture_staging > D:\Documents\Work\d2b_07122021.sql

pg_dump -h 10.152.89.180 -p 5445 -U seamfix -s biocapture > C:\Users\ragbojo\Downloads\d2b_new.sql

pg_dump -h 10.152.89.168 -p 5445 -U seamfix -s biocapture > C:\Users\ragbojo\Downloads\POC_d2b_new.sql

pg_dump -h 13.56.69.207 -p 5445 -U seamfix -s biocapture > C:\Users\ragbojo\Downloads\POC_d2b_15102021.sql

pg_dump -h 10.152.89.222 -p 9999 -U seamfix -s biocapture > C:\Users\ragbojo\Downloads\POC_d2b_new.sql

VGh62mdHPv46ju5M
W3lcomeB10sm@t2019#


RESTORE DDL ->

psql -d biocapture_prod -h localhost -p 5444 < D:\Documents\Work\d2b.sql

psql -d biocapture -h 10.152.89.222 -p 9999 -U seamfix < C:\Users\ragbojo\Downloads\d2b_new.sql

psql -d biocapture -h 10.152.89.177 -p 5445 -U seamfix < C:\Users\ragbojo\Downloads\POC_d2b_new.sql

psql -d biocapture -h 10.152.89.231 -p 5444 -U seamfix < C:\Users\ragbojo\Downloads\POC_d2b_new.sql




BACKUP DB & DATA ->

pg_dump -h 10.152.89.168 -p 5445 -U seamfix -W -F t biocapture > E:\biocapture.tar

pg_dump -h 10.152.89.177 -p 5445 -U seamfix -W -F t biocapture > E:\biocapture_15102021.tar


RESTORE DB & DATA ->

pg_restore -d biocapture_new -h 10.152.89.177 -p 5445 E:\biocapture_15102021.tar -c -U seamfix



BACKUP DB & DATA WITH LARGEOBJECTS ->

pg_dump -h localhost -p 5444 -U enterprisedb -Ft -b biocapture_staging > "D:\Documents\Work\db.tar"


RESTORE DB & DATA WITH LARGEOBJECTS ->

pg_restore -h localhost -p 5444 -U enterprisedb -d restore_db_test "D:\Documents\Work\db.tar"



BACKUP WITH PG BASE ->


