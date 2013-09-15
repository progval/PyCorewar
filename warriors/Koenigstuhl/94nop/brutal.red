;redcode-94
;name Brutal
;author Tomek Czajka
; <tczajka@mimuw.edu.pl>
;strategy catch&kill
;assert 1

a0 equ 7
a1 equ 13
a2 equ 29
a3 equ 73
a4 equ 157

capture equ MAXPROCESSES

org start
pocz:  
       dat #-a0,#a0
       dat #-a1,#a1
       dat #-a2,#a2
       dat #-a3,#a3
dx:    dat #-a4,#a4
     
       dat #0,(CORESIZE-(theend-pocz)-3)/a0
       dat #0,(CORESIZE-(theend-pocz)-3)/a1
       dat #0,(CORESIZE-(theend-pocz)-3)/a2
       dat #0,(CORESIZE-(theend-pocz)-3)/a3
count: dat #count,(CORESIZE-(theend-pocz)-3)/a4 ; A jest wskaznikiem

origcel: dat #pocz-1-cel,#theend-cel
cel:   dat #0,#0

start: mov.f $origcel, $cel
petla: 
       seq.i *cel,@cel
dxptr: jmp $found,$dx   ; B is dxptr
return: add.f @dxptr,$cel
       djn.b $petla,*count
      
       add.ab #-1,$dxptr
       add.a #-1,$count
       djn.b $start,#5
       
fill:  
       sne.ab #theend-filla,$filla
       mov.ab #fill-filla,$filla
       mov.i $minus1,<filla
filla: jmp $fill,#fill
minus1: dat #-1,#-1

found: 
       sne.i $theend,*cel
       jmp $found2
       mov.a #enter-cel,$bomb
       sub.a $cel,$bomb
       mov.i $bomb,*cel
       
found2: sne.i $theend,@cel
       jmp $return
       mov.a #enter-cel,$bomb
       sub.ba $cel,$bomb
       mov.i $bomb,@cel
       jmp $return
       
bomb:  jmp $0,$0

licznik: dat #capture,#capture%(CORESIZE-1)
enter:
       sne.ab #-1,$licznik
       sub.ab #1,$licznik
       add.f $minus1,$licznik
       jmz.f $killall,$licznik
       
kibel: spl $enter,#0
       jmp $kibel,#0
       
killall: mov.i $minus1,$kibel
       
theend: end

