;redcode
;name Xerox II
;author Franz
;strategy simple paper (runs in '88)
;assert CORESIZE>4000
                
                
init            SPL 1
                MOV -1,0
                SPL 1

src             MOV #1,from

                MOV <from,<dst
dst             SPL @0,#1222
                ADD #12,dst
from            JMP src,0

                END init
