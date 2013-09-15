;redcode-94
;name Time Lag
;author Ilmari Karonen
;strategy self-splitting scanner
;history 1c Works!
;history 1g Back to 1c, new switch method, mod-5
;history 1h mod-6/4 (predecrement makes it ~mod-5)
;date March 14, 1997
;planar scan, stun, clear, gate
;assert CORESIZE == 8000

; This is my attempt at writing a self-splitting scanner. It uses 2 add
; instructions to keep track of the number of processes in the loop. Since
; the first add is executed more often than the second one, the find
; pointer lags behind the scan pointers. In fact, the first add is executed
; once more than the second one every time the number of processes 'on' it
; increases. Since the number of processes on that instruction determines
; how many times the scan pointers will be incremented before a scanned
; location will be 'found', any processes skipping to find will, on the
; next iteration of the process queue, have the same pointer there than
; they had when they executed scan.

; Surprisingly enough, this actually works perfectly without having to use
; any 'magic numbers' to tune the delay, as long as the order of the
; process queue doesn't change. The loop in this version is effectively 5
; instructions long, making this a 0.4c scanner, with a 0.2c stun attack.
; Of course, these are only approximations, as is the case with all
; self-splitting programs.

; The greatest problem has been making this one switch to the clear well.
; Since there are many processes in the loop, it's not enough to get one of
; them to fall through. Another related problem has been resistance to
; self-hitting, especially with the clear.
                                                            
        org     bomb

step    equ     3030                    ; mod-10
sorg    equ     (stun-step)             ; scan origin
cptr    equ     (bomb-1)
cend    equ     (cbmb+1)

; *** Time Lag

kill    dat     0, 4000

        dat     0, 0
bomb    spl     0, -4

stun    mov.i   bomb, >kill             ; .2c clear (a-decr triggers switch)
loop    add.f   next, scan              ; move scan location
        add.a   next, find              ; *** stay in phase ***
scan    sne.i   {sorg, <sorg+4          ; .4c scan
        jmn.b   stun, *stun             ; (b-decr)
find    mov.ab  #sorg-1-kill, kill      ; redirect clear
        jmn.b   loop, *stun             ; skip stun to maintaing process order

next    spl     #step, #step
clear   mov.i   cbmb, >cptr             ; d-clear
        djn.f   clear, >cptr

cbmb    dat     >5335+1, cend-kill      ; (a-decr)

        dat     0, 0
        dat     0, 0
        dat     0, 0
        dat     0, 5335-3               ; avoid self-hit?

        end
