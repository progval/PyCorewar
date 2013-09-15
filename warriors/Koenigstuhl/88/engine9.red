;redcode
;name EngineNumber9
;author Kline
;strategy pure paper
;assert 1
start   mov <copyf1,<copyt1
        mov @copyf1,<copyt2
        mov <copyf2,<copyt3
        mov @copyf2,<copyt4
        mov <copyf1,<copyt1
        mov @copyf1,<copyt2
        mov <copyf2,<copyt3
        mov @copyf2,<copyt4
        djn start,#8
copyt1  spl @0,1000
copyt2  spl @0,2100
copyt3  spl @0,3300
copyt4  spl @0,5600
        spl p2
p1      spl new,0
        spl 1,<100
        spl 1,<200
        spl 1,<300
        spl 1,<p1

engine  mov <p1,<new
        mov 0,<1
        mov ender+1,<-1200
clutch  jmz engine,p1

dork    mov 1,<1
bomb    dat #-1

control add #311,new
        mov #16,p1
new     spl @new,2313
again   jmz control,p1

ender   mov bomb,<0
copyf1  dat #0

p2      spl new2,0
        spl 1,<100
        spl 1,<200
        spl 1,<300
        spl 1,<p2

engine2 mov <p2,<new2
        mov bomb,<1
        mov ender2+1,<-1100
clutch2 jmz engine2,p2

dork2   mov 1,<1
bomb2   dat #-1

contro2 add #311,new2
        mov #16,p2
new2    spl @new2,1313
again2  jmz contro2,p2

ender2  mov bomb2,<0
copyf2  dat #0
        end start
