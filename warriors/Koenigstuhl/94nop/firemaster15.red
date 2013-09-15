;redcode-94
;name Fire Master v1.5
;author JS Pulido
;strategy  JMZ Scan MOV/SPL bomb -> DJN/DAT coreclear
;strategy  1.5  boot bug fixed
;assert CORESIZE==8000

INC     EQU     (2365) ; 2365 m5
DES     EQU     ( 1)
BOOTPTR EQU     (1998)


boot            mov.i       bomb3,          {copy     ;*
                mov.i       bomb2,          {copy
                mov.i       bomb,           {copy
                mov.i       cl+2,           {copy
                mov.i       cl+1,           {copy   ;*
                mov.i       cl,             {copy
                mov.i       cl-1,           {copy
                mov.i       eye,            {copy
                mov.i       eye-1,          {copy ;*
                mov.i       start,          {copy
                mov.i       start-1,        {copy
copy            spl         BOOTPTR
                mov.i   1,      -1      ;*
                dat     1,      1
                dat     1,      1
                dat     1,      1
                dat     1,      1
DAT 0,0
                add.ab      #INC,           3
        start   jmz.f       -1,             @eye
                mov.i       bomb2-2,        @eye
        clptr
        eye     mov.i       bomb-2,         *DES    ;gate
DAT 0,0
                jmn.b       start,          -1      ;hit
        cl      mov.i       bomb3-1,        }clptr+1
                djn.f       -1,             <clptr+1
                jmp         cl,             }clptr+1
DAT 0,0
        bomb    mov.i       1,              >1
        bomb2   spl         -1,             #1
        bomb3   dat         12,             -1
DAT 1,1
DAT 0,0

DECOY   FOR     (MAXLENGTH-CURLINE)/5

A       FOR     4
            DAT     #bomb3-(DECOY*A),   #bomb3+(DECOY*A)
        ROF
            DAT 0,0
        ROF
        END boot
