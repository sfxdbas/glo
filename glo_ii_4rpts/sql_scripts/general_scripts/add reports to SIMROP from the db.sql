
insert into page_
	select hibernate_sequence.nextval,
	true,
	now(),
	false,
	now(),
	null,
	'/birt/frameset?__report=report/IncentiveManagement.rptdesign',
	null,
	'Incentive Management',
	'BIRM',
	10, 
	1016,
	1000,
	990
;




--insert into page_
	select hibernate_sequence.nextval,
	true,
	now(),
	false,
	now(),
	null,
	null,
	null,
	'Devices and their Registration Report',
	'BIRM',
	8, 
	1016,
	1000,
	null
;
