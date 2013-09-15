;redcode-94
;name Piesack
;author Skaldrom Y. Sarg
; <corewars@blutrausch.ch>
;strategy Scans and sends disruptors
;Wilkinson Score: 65
;assert 1

dest    dat #0
loc:	dat #0
src:    dat #0

start:  sub #2584, loc
        jmz start, @loc
        mov loc, dest
        mov #12, src
        spl copier
        jmp start

bomb:   dat #0,#0

copier:  
        mov <src, <dest
        jmn copier, src  
        add #1, dest
        jmp @dest

	end start

