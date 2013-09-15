;redcode verbose
;name Nevermore 3.2
;author Jeff Raven
;strategy - Version 3.2
;strategy - Scans the core, looking for a non-zero B-field, and then
;strategy - proceeds to bomb the memory around the suspicious address.
;strategy - As for how it bombs .......... the algorithm has finally
;strategy - been fixed, and hopefully it should tie a lot less now.
;assert 1

basis   EQU 4                   ; Basic step size for the search
step    EQU 3044                ; Step size for the search
delta   EQU (point - alpha)     ; Constant used in the bomb exchange
double  EQU (2 * delta)         ; Constant used in the bomb exchange
offset  EQU basis               ; Distance ahead of target to start bombing
correct EQU (basis - 1)         ; Corrective value used after bombing
times   EQU (2 * basis - 1)     ; Number of bombs to place

start   ADD #step, target
target  JMZ start, counter
        ADD @point, point
        SUB #delta, point
        ADD #offset, target
counter MOV #times, counter
kill    MOV @point, <target
        DJN kill, counter
        ADD #correct, target
        JMP start

alpha   SPL alpha, double
point   DAT #alpha

        END start
