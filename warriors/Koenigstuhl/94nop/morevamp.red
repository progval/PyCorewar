;redcode-94
;name MoreVamp
;author Franz
;strategy vampire
;assert (CORESIZE%5)==0

        org incr

;lets start at 2000 since that should be covered with the pit
ccp     dat cc,2000
        dat 0,0
gate    dat 0,0
        dat 0,0
        dat 0,0

;i'll ad self splitting to enhance the durability
;
vamp    spl #0,>gate

incr    add.f pit, fang
        mov.i fang, @fang

;this will give us not only detection of our fangs 
;coming in but also of imps! and the clear is fairly anti imp
;not the best but worth the effort:)
        jmz.f incr, fang-100

;standard spl/dat coreclear
cc      spl #2, #30
        mov *ccp, >ccp
        jmp -1,>gate

fang    jmp pit-100, #100

;lets put the pit on the bottom so we can have it carpet bomb
;and to optimize a bit we'll put the stepsize on the first spl
;to avoid the dat

pit     spl #-5, #5
        mov -1,<2000
        spl -1, >gate
        jmp -3, >gate

        end

