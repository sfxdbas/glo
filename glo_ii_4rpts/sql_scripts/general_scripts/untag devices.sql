    
            
  select * from device_tag_request
--  delete from device_tag_request
-- update device_tag_request set requested_device_id = null  
where enrollment_ref_fk in (
 select id -- ,  code , device_id
 from enrollment_ref
-- update enrollment_ref set device_id = null
where code in 
(


'GLO-FR-677J',
'GLO-DN-616W',
'GLO-DH-671L',
'GLO-DH-591K',
'GLO-DH-446M',
'GLO-DH-446M',
'GLO-DN-736P',
'GLO-DH-723M',
'GlO-DN-399S',
'GLO-DH-477K',
'GLO-DH-398S',
'GLO-FR-083N',
'GLO-DH-999I',
'GLO-FR-395V',
'GLO-DH-637M',
'GLO-FR-688H',
'GLO-FR-815J',
'GLO-FR-425A',
'GLO-FR-947L',
'GLO-DN-307S',
'GLO-DH-476R',
'GLO-FR-574K',
'GLO-FR-838J',
'GLO-DH-832I',
'GLO-FR-555C',
'GLO-DH-142R',
'GLO-DH-652N',
'GLO-FR-436M',
'GLO-FR-524P',
'GLO-FR-305N',
'GLO-DH-748G',
'GLO-DH-749G',
'GLO-DH-077L',
'GLO-DH-889K',
'GLO-DN-312K',
'GLO-DH-040Q',
'GLO-DN-134N',
'GLO-FR-160L',
'GLO-DH-979U',
'GLO-DH-798U',
'GLO-DH-799U',
'GLO-DN-134N',
'GLO-DH-045Q',
'GLO-DH-539J',
'GLO-DN-795Q',
'GLO-DH-707Q',
'GLO-FR-115O',
'GLO-DN-632O',
'GLO-DN-457R',
'GLO-DN-008Y',
'GLO-DH-536J',
'GLO-FR-276H',
'GLO-DN-975Z',
'GLO-DN-605S',
'GLO-FR-153N',
'GLO-DN-764X',
'GLO-FR-799C',
'GLO-DH-042M',
'GLO-FR-170N',
'GLO-DH-871J',
'GLO-DH-982M',
'GLO-DH-096J',
'GLO-DN-028T',
'GLO-DN-038T',
'GLO-DH-786L',
'GLO-DH-785L',
'GLO-DH-784L',
'GLO-FR-605K',
'GLO-FR-546N',
'GLO-FR-674F',
'GLO-DH-633O',
'GLO-FR-568N',
'GLO-FR-605K',
'GLO-DN-246N',
'GLO-FR-124O',
'GLO-DH-310W'



)
 )
--  order by kit_tag
-- order by code 
;
