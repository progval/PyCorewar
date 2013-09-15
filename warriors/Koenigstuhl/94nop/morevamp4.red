;redcode-94
;name MoreVamp v4
;author Franz
;start vampire
;assert (CORESIZE%5)==0

step equ 5
detect equ 200
        org vamp

;lets start at 2000 since that should be covered with the pit
ccp     dat pit,fang-detect-20
        dat 0,0
gate    dat 0,0
        dat 0,0
fang    jmp pit-100, #100
        dat 0,0

;i'll ad self splitting to enhance the durability
;
vamp    spl #-step, #step

incr    add.f vamp, fang
        mov.i fang, @fang

;this will give us not only detection of our fangs
;coming in but also of imps! and the clear is fairly anti imp
;not the best but worth the effort:)
        jmz.f incr, fang-detect
        mov.i gate,>kill
;standard spl/dat coreclear
cc      spl #sec-ccp, #60
        mov *ccp, >ccp
        jmp -1,>gate


;lets put the pit on the bottom so we can have it carpet bomb
;and to optimize a bit we'll put the stepsize on the first spl
;to avoid the dat

for 50
dat 0,0
rof

pit     spl #cc-ccp,>2000
sec     spl #2, #30
        mov -1,<2000
kill    jmp -3, >gate

        end

