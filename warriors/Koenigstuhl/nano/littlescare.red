;redcode-imt2
;name   Little scare
;author Beppe Bezzi
;strategy Blu Funk like stone
;assert CORESIZE==80

step    EQU    36

start   spl     #-step, <step
stone   mov     >-step, step-1
	add     start,  stone
	djn.f   stone,  <start-5

end start

