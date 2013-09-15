;redcode verbose
;name Binary Tree
;author Ray Cromwell
;strategy Spawn off two copies of itself at
;strategy dest+epsilon and dest-epsilon, then epsilon=epsilon/2
;strategy as a result, the distribution through the core is maximized.
;assert 1

dest1   dat #0,#0
dest2   dat #0,#0
size    dat #tbl-dest1,#tbl-dest1	;size of prog

start   mov #0,dest1			;zero dest1,dest2
        mov #0,dest2
        add @ptr,dest1			;dest1+offset
        sub @ptr,dest2			;dest2-offset
        djn 1,ptr			;decrement ptr to offset table
        mov size,dest1-1		;move copy size
        djn 1,size			;decrement size
        mov @dest1-1,<dest1		;copy program
        mov @dest1-1,<dest2		; to both branches on the tree
        djn -2,dest1-1			
        add #3,dest1			;
        add #3,dest2			; advance dest point to start of code
        spl @dest1			; exec code
        spl @dest2
					;die
ptr     dat #tbl,#tbl			;ptr into table		
        dat #0031,#0031			;subdivide table
        dat #0062,#0062		
        dat #0125,#0125
        dat #0250,#0250
        dat #0500,#0500
        dat #1000,#1000
tbl     dat #2000,#2000			

        end start
