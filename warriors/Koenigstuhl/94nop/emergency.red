;redcode-94b
;name v.1b This is a test of The EBS...
;v.1b This is a test of The Emergency Broadcasting System...
;author Justin Kao
;strategy trying lots of things: testing a scanner.
;strategy By Wilkies, it seems to do equally bad
;strategy against everything.  :-(
;assert CORESIZE == 8000

step    equ     3045
;step    equ     2376
offset  equ     -10

        org     loop

;pointers and bombs
split   spl     #100,   1
found   dat     #100,   -1
split2  spl     #10,    2
        dat     #10,    2

;scanning loop
loop    add     #step,  scan
scan    jmz.a   loop,   {offset

;scan falls through, save position, and split back to loop
        mov.ba  scan,   found
        spl     loop

;original process begins spl clear starting at "found"
        mov     @found, }found
;        djn     -1,     <split-10
        jmp     -1

        end
