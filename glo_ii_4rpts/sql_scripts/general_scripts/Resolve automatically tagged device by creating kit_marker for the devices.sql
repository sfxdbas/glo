insert into kit_marker
select hibernate_sequence.nextval,1.1, now(), device_id, e.mac_address, code, 990
from enrollment_ref  e, node n 
where e.id = n.enrollment_ref
and  code in 
('GLO-DH-082T',
'GLO-DH-244G',
'GLO-DN-981N',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DH-573Q',
'GLO-DH-082T',
'GLO-FR-397N',
'GLO-DH-394Q',
'GLO-DH-394Q',
'GLO-DH-922I',
'GLO-DH-619J',
'GLO-DH-621J',
'GLO-DH-860U',
'GLO-DH-136W',
'GLO-DH-610P',
'GLO-DN-605S',
'GLO-DN-065Q',
'GLO-DH-878M',
'GLO-DN-611S',
'GLO-DH-667S',
'GLO-FR-277M',
'GLO-DN-619W',
'GLO-DH-688V',
'GLO-DH-684V',
'GLO-FR-397N',
'GLO-FR-397N',
'GLO-FR-019N',
'GLO-DN-663U',
'GLO-DN-249N',
'GLO-DN-082T',
'GLO-FR-019 ',
'GLO-DH-676O',
'GLO-DN-008O',
'GLO-DH-214I',
'GLO-DN-611S',
'GLO-FR-279M',
'GLO-FR-394Q',
'GLO-DH-178I',
'GLO-FR-017N',
'GLO-DN-113S',
'GLO-DN-850K',
'GLO-DH-394Q',
'GLO-DH-394Q',
'GLO-FR-279M',
'GLO-DH-9221',
'GLO-DH-142R',
'GLO-FR-579M',
'GLO-DN-611S',
'GLO-DH-559W',
'GLO-FR-529N',
'GLO-DH-394Q',
'GLO-DN-719U',
'GLO-DN-719U',
'GLO-FR-676O',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DN-611S',
'GLO-DN-113S',
'GLO-DH-200O',
'GLO-DN-940O',
'GLO-DH-786H',
'GLO-DH-608G',
'GLO-FR-397N',
'GLO-DH-472R',
'GLO-DH-142R',
'GLO-DH-611S',
'GLO-DH-142R',
'GLO-FR-7660',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DH-142R',
'GLO-DN-611S',
'GLO-DH-146R',
'GLO-DN-611S',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DN-927O',
'GLO-DH-667S',
'GLO-DH-667S',
'GLO-DH-693G',
'GLO-NB-122R',
'GLO-DH-394Q',
'GLO-DN-611S',
'GLO-DN-398Q',
'GLO-FR-279M',
'GLO-FR-311S',
'GLO-DH-922I',
'GLO-FR-848J',
'GLO-DN-113S',
'GLO-DN-347V',
'GLO-DH-142R',
'GLO-DH-142R',
'GLO-DN-113S',
'GLO-DN-719U',
'GLO-DH-244G',
'GLO-DN-113S',
'GLO-FR-279M',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-766O',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DH-683O',
'GLO-DN-482Q',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DH-142R',
'GLO-DN-611S',
'GLO-DH-142R',
'GLO-DH-142R',
'GLO-DN-917X',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-DH-082T',
'GLO-FR-706F',
'GLO-DH-244G',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-DN-611S',
'GLO-DN-347V',
'GLO-DN-347V',
'GLO-DN-347V',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-DN-611S',
'GLO-DN-347V',
'GLO-DN-347V',
'GLO-DN-347V',
'GLO-DN-663U',
'GLO-DN-249N',
'GLO-DN-082T',
'GLO-DH-082T',
'GLO-FR-706F',
'GLO-DH-244G',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DN-663U',
'GLO-DH-244G',
'GLO-DN-619W',
'GLO-DH-688V',
'GLO-DH-684V',
'GLO-DH-136W',
'GLO-DN-719U',
'GLO-DN-719U',
'GLO-FR-397N',
'GLO-FR-397N',
'GLO-DN-867R',
'GLO-DN-561Y',
'GLO-FR-397N',
'GLO-FR-397N',
'GLO-DH-244G',
'GLO-FR-279M',
'GLO-DH-641W',
'GLO-DH-634J',
'GLO-DH-637J',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DN-927O',
'GLO-DH-394Q',
'GLO-DN-611S',
'GLO-DN-398Q',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-FR-279M',
'GLO-DH-684V',
'GLO-FR-311S',
'GLO-DH-922I',
'GLO-FR-848J',
'GLO-DN-113S',
'GLO-DH-142R',
'GLO-DN-113S',
'GLO-FR-848J',
'GLO-DN-611S',
'GLO-DN-611S',
'GLO-DH-412L',
'GLO-DH-410M',
'GLO-FR-311S',
'GLO-DH-922I',
'GLO-FR-848J',
'GLO-DN-113S',
'GLO-DH-142R',
'GLO-DN-113S',
'GLO-FR-305J',
'GLO-FR-265N',
'GLO-DH-082T'
)