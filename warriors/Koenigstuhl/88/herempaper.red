;redcode
;name HeremPaper v0.9
;author Anders Ivner
;contact d91andiv@und.ida.liu.se
;strategy Herem stone + 8 process anti-imp paper.
; Beats both "FlyPaper" and "ImpsAre...". I expect that James noticed
; my tests on the hill, but the fact that I've used Leprechaun until
; now will hopefully restrain him from using a scanner.
; So much for reverse psychology... :-)
; This program still needs some fixing. And a better name.
;assert 1
step    equ     926
first   equ     5337
away    equ     5020

boot    mov     gate,   gate+away+21
dpt     spl     1,      c+away+1
        mov     <spt,   <dpt
        mov     <spt,   <dpt
        mov     <spt,   <dpt
        spl     1
        spl     1
spt     spl     @dpt,   c+1

papers  spl     l100
        spl     l010
        spl     l001

        mov     #8,     0
        mov     <-1,    <1
        spl     @0,     5300
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l001    mov     #8,     0
        mov     <-1,    <1
        spl     @0,     5700
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l010    spl     l011
        mov     #8,     0
        mov     <-1,    <1
        spl     @0,     5900
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l011    mov     #8,     0
        mov     <-1,    <1
        spl     @0,     6100
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l100    spl     l110
        spl     l101

        mov     #8,     0
        mov     <-1,    <1
        spl     @0,     6300
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l101    mov     #8,     0
        mov     <-1,    <1
        spl     @0,     6700
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l110    spl     l111

        mov     #8,     0
        mov     <-1,    <1
        spl     @0,     6900
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

l111    mov     #8,     0
        mov     <-1,    <1
        spl     @0,     7100
        mov     3,      <-1
        mov     3,      <-2
        jmz     -5,     -5
        dat     <2667,  #1
        mov     0,      <1

herem   spl     0,      <-10
        sub     c,      pt
pt      mov     <100,   @herem+first
        mov     gate+21,@pt
c       djn     -3,     <-step

gate    dat     <-11,   <2666

        end     boot
