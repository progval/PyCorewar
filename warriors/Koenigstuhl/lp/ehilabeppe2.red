;redcode-lp
;name Ehila Beppe 2!
;author LAchi
;strategy a faster Ehila Beppe!
;assert CORESIZE % 8 == 0 

step8 equ 88
offset8 equ 2216
next8 equ 1144 

	org tornado8 

;qui verrà calata la bomba
	dat     step8,   step8
;tornado8 modificato, salta al copier8 se e solo se ho processi sufficienti
inizio8
tornado8
	mov.i  $bombd8  , *stone8
	mov.i  $bombd8  , @stone8
stone8
	mov.i  $step8+bombd8, @(2*step8)+bombd8
	add.f  $incr8   , $stone8
	slt.a  #    -25, $orig8
	spl.b  $copier8
	jmp.b  $tornado8
;qui verrà calata la bomba
bombd8
	dat     step8,   step8
;copiatore modificato, 66%c contro 50%c di Ehila Beppe
incr8
	dat.f  $3*step8, $3*step8
dati8
	dat.f  #    -1, #      -1
copier8
	add.ab #offset8 , $dati8
	add.a  #next8   , $copier8
	mov.f  $dati8   , $orig8
	mov.ab #      5, $contatore8
	jmp 2
;qui verrà calata la bomba
	dat step8, step8
copia8
	mov.i  {orig8   , <dest8
	mov.i  {orig8   , <dest8
	mov.i  {orig8   , <dest8
	mov.i  {orig8   , <dest8
	mov.i  {orig8   , <dest8
contatore8
	djn.ab $copia8  , #      5
	jmp.a  @dest8   , {orig8
;qui verrà calata la bomba
	dat     step8,   step8
	dat 0,0
	dat 0,0
orig8
dest8
	dat.f  $      0, $      0
end 

