;redcode-94
;name evoltmp
;author John K W
;assert CORESIZE == 8000

;I think I'll use the impfinity launch I like, combined with
;just the right stone...  This should be fairly tough to beat.
;I remember my first exposure to Corewars was reading the commentary
;lines of warriors in a player v player elimination tournament.  I
;always thought it was neat to read what each player expected...

;strategy Gotta love those stone/imps, right?

;Beats stones and scanners, hopefully tie papers, and beats other common
;imp/stones.  A score of 130/110 or better vs Rosebud and blue candle
;should be typical of just about any "modern" stone/imp this sees.
;Also beats Memories, Eggbeater, Harmony II and probe...

;The biggest enemy to this style imp/stone would be something along the
;lines of Kline's p-clear.  But such a warrior would be highly vulnerable
;to many other warriors, especially papers, so I doubt I'll come up against
;it... given my tendancy in recent months towards heavy papers. :-)
;I'm most wary of a core-trashing silk, though.

;'Course, I could always use a Jedimp, with a 13-point spiral...
;Justin would need a heavy scanner to beat it.  But I suspect he might
;expect a heavy paper-imp, so I'm gonna gonna stick with this.

;By the way, I was looking at the code for Impfinity 4g1's imp
;launcher... closely, really for the first time...  and, I couldn't
;understand why Planar was letting all those processes just fall off
;the end of the launcher.  My changes are an improvement vs most
;warriors, and even allow me to beat Blur 2... which I was having
;trouble with otherwise.  Woohoo!

org EvolCap

BOOT_DIST equ (2626+24*66)
S       equ 24

jclr:   dat     >2667,     S+10

evol
EvolCap mov.i   jclr,   evol+BOOT_DIST+S+4

for 6
        mov.i   {pptr,  <pptr
rof
        spl     @pptr

istep   equ     5091
impoff  equ     (Z+1137)
point equ     (pump-pmpof+impoff)
pmpof   equ     (impoff-100)

Z

j FOR 4
        mov.i   {psrc, <pdst
ROF
        mov.i   instr, impoff
        jmp     @pdst, >-500-15-1*2

for 72/4
spl #1, *1
spl #1, @1
spl #1, #1
spl #1, 1
rof

psrc
pdst  dat     pend, pmpof+pend-pump

pump  spl     #0, 0
      add.a   #istep+1, ptr
prime mov.i   point, point-1
ptr   jmp     pump-pmpof+impoff-(istep+1)*3, >prime

;pump  spl     #1, >prime
;ptr   spl     pump-pmpof+impoff-istep-1, {335+1
;      add.f   #istep+1, ptr
;prime mov.i   point, point-2

pend
instr mov.i   #istep, *0

p       spl     #0,     {-S+1
        add.f   3,      1
        mov     }S-2,   -S+1
        djn.f   -2,     <-1160
        mov     S,      >-S
        djn.f   -1,     >-S-1

pptr:   nop     0,      evol+BOOT_DIST+6
