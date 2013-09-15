;redcode-88
;name Rusty Old Scissors v4
;author Ryan Coleman
;strategy booted jmz scanner -- drops spl 0/jmp -1 bombs
;strategy becomes backward cc after 1 pass at mod4
;assert 1

;let's see... many reasons for submitting early
;   AI report due in a month
;   Can't seem to move above 6th place
;   Never done 88 before



;------------scissor here-------------
start   mov     #-101,       ptr-5084
look    add     # 5084,      ptr
look2   jmz       look,    @ ptr
ptr     mov       stun2,     ptr
	mov       stun1,   < ptr
	add     # 5084+1,    ptr
	jmn       look2,     ptr
	jmp       1
halt    mov       bomb,    < bptr
	jmp       halt
stun1   spl                  0
stun2   jmp      -1
bomb    dat                  #halt-bptr
bptr    dat                  #look

;------funky boot routine----------------
boot    spl      saveself
	mov      -15,        4015
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015  
	mov      -15,        4015
	jmp      4001,       <2
	dat      #0,       #0
saveself jmp    @ 0,        0     ;ok, this may seem funky,      
				;basically hoping if my boot gets hit
				;a paper will land on me and i can compete
				;or a simple stone w/o cc can't find me
;-----decoy that i don't scan---        
	
	dat      <1,      <1        
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @1,      <1
	spl      4000,       <-100
	jmp      0,       <-5300
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @1,      <1
	spl      4000,       <-100
	jmp      0,       <-5300
	dat      #0,      #0   ;scanned
	spl      @0,      <1
	spl      1,       <-100
	jmp      1,       <-5000
	
	dat      #0,      #0   ;scanned
	spl      @1,      <1
	
	

	
	
	
	end       boot
