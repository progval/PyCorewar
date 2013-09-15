;redcode-94
;name       Scanny Boy
;author     David van Dam
;date       4 april 1996
;strategy   0.66c scanner
;strategy   spl/spl/dat core clear with djn-stream
;strategy   scores 158,0 Wilkies & 151.8 Wilbez (2000 fights)
;assert     CORESIZE == 8000

            org     scanner

disp        equ     4
range       equ     15
step        equ     30
offset      equ     (scanner+disp-range)


scanner     add.f   incr    ,   cnt
cnt         sne     offset  ,   offset+range
            djn.f   scanner ,   -step+1         ;Djn used as gate

incr        spl.f   #-step  ,   >-step		;>-step used as gate

cc          mov.i   @bombp  ,   }cnt           
            djn.f   cc      ,   <cnt           
                                                
bombp       dat     #8      ,   #1		;After 2 Spl passes the
            spl     #7      ,   #-85            ; Djn-stream will overwrite
                                                ; the bombp and the @bombp
                                                ; will points to the Dat

for MAXLENGTH-CURLINE
            dat     0       ,   0
rof

            end
