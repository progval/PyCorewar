;redcode 
;name Brazen hussy
;strategy Medusa clone. 
;author Steve Gunnell
;assert 1 

CDIST equ 16 
IVAL equ 29 
OFFSET equ 6474 
FIRST equ (scan-OFFSET+IVAL) 
n equ 4 
LEN equ (data-comp+1+CDIST+1+n) 

redo mov #CDIST+n ,count 
scan add data ,@split 
comp cmp FIRST-CDIST ,FIRST 
slt #LEN ,@split 
djn scan ,<FIRST+163 
mov jump ,@comp 
split mov bomb ,<comp 
count djn split ,#CDIST+n 
add #CDIST+n ,@split 
jmz redo ,redo-2 
bomb spl 0 ,<incr-IVAL 
incr mov data ,<count 
jump jmp incr ,<incr-IVAL 
data DAT <0-IVAL ,<0-IVAL 

end comp 

