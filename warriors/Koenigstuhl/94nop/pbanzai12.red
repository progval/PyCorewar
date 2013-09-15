;redcode-b
;assert CORESIZE==8000
;name P_Banzai_v1.2
;author Calvin Loh
;strategy: Paper( different step size ) and Banzai_v1.3
start   spl     1
        spl     1
        spl     1
;generate 8 parallel processes
silk    spl.a   @0,     800    
        mov.i   }silk,  >silk  
        spl.a   silk,   {silk
banzai  spl     0,      100     
        mov     bomb,   <banzai
        mul.ab  #3,     banzai
        jmp     banzai
bomb    dat     #100,   #100
end     start
