;redcode
;Name           Scanner Y
;Author         Stig Hemmer
;(stig@lise.unit.no)
;assert 1
;strategy       This program is based on an idea of Arne H. Juul.
;Strategy       Scan memory for programs and bomb them. It scans for
;Strategy       non-zero B-fields. Scanning and bombing are independant
;Strategy       processes, SPLit off at the start.

start           SPL bomb,#0
loop            ADD #3055, w
                JMZ loop, @w
                MOV w,w2
                JMP loop
d               DAT #0
                DAT #0
                DAT #0
                DAT #0
w               DAT #d2
d2              DAT #0
bomb            MOV d, <w2
                JMN bomb,w2
                MOV #start-w2, w2
                JMP bomb
d3              DAT #0
w2              DAT #start
