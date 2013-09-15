;redcode
;name MrNasty
;author K. Werle & S. Beitzel
;<wet!sbeitzel@uunet.UU.NET>
;strategy Mr. Nasty is a stationary vampiric bomber.
;strategy He drops fangs all over memory, and uses the captured
;strategy processes to clear the core.
;strategy He is vulnerable to fast scanners, but anything slow is
;strategy history.  He is robust, and hashes up core beautifully.
;strategy He is strong against other bombers and against replicating
;strategy and relocating warriors.
;assert 1
target     jmp -1, #(thisisit)      ; A-arg points to "here", B-arg
;                                       points to ground zero
thrtarg    dat #0,#-1               ; "zero" bombing pointer
tar        jmp -1, #(tplus)         ; used to reset "target" after pass
binc       dat #-26,#26             ; used to increment "target"
start      mov target, @target      ; drop a bomb
           add binc, target         ; increment pointer
           mov target, @target      ; drop a bomb
           add binc, target         ; increment pointer
           slt #-63, target         ; prevents Mr. Nasty from bombing
;                                       himself
           jmp start
update     mov tar, target          ; reset bomb pointer
           jmz bomb0, <offsetno     ; decrement offset pointer & if all
;                                       passes are done, go to "zero"
;                                       bombing routine
           add @offsetno, target
           jmp start
five       dat #0, #-1              ; this is the "zero" bomb -- actually
;                                       it's -1, to change the jump pointer
bomb0      mov five, <thrtarg       ; this drops a "zero" bomb
           jmp @jumploc             ; jumps to bomb0 until core is zapped
jumploc    dat #0,#-2               ; jump pointer for the end of the world
incoming   spl 1                    ; prisoner parthenogenesis!
           mov five, <thrtarg       ; prisoner "zero" bombing
           jmp -2                   ; make more inmates & make 'em work!
offsetno   dat #0,#7
           dat #-23, #23
           dat #-12, #12
           dat #-4, #4
           dat #-20, #20
           dat #-8, #8
           dat #-16, #16
here       jmp incoming             ; where the soon-to-be-jailed get
;                                       processed
thisisit   dat #0,#0                ; first bomb location
           dat #0,#0                ; place holder
tplus      dat #0,#0                ; reference for length of code, used
;                                       by "tar"
end start
