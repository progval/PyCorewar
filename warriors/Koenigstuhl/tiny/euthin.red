;redcode-94x
;name Euthin
;author Philip Thorne
;strategy Nuthin with splits. i.e. stupid quick bomb/clear
;strategy John Metcalf 2002 Tournament Round 1, Warrior 1
;assert CORESIZE==800

OFFSET  EQU MAXLENGTH
STEP    EQU     (800-(2*MAXLENGTH))/16

start   spl 0,          <start-10-10
n       for     8
                mov.i bomb,     <OFFSET-(STEP*n)
        rof

                spl 0,      <start+MAXLENGTH+10+10
n       for     8
                mov.i bomb,     <OFFSET-(STEP*(n+8))
        rof

        dat     <start-10,      <start+MAXLENGTH+10

bomb    dat <-1,        <-1

end start
