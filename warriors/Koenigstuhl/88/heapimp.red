;redcode
;name Heap-imp
;author James Jesensky
;<JJJ101@PSUVM.PSU.EDU>
;assert 1
start    jmp 2
code     dat #0
         mov #13, code
         add where1, where1
cloop1   mov @code, <where1
         djn cloop1, code
         spl @where1
         mov #13, code
         add where2, where2
cloop2   mov @code, <where2
         djn cloop2, code
         spl @where2
         mov 0, 1
where1   dat #30
where2   dat #80
