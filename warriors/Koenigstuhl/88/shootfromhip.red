;redcode
;assert (CORESIZE==8000)
;name Shoot from the hip
;author WolfWings
;strategy One-shot CMP/MOV Scan
;strategy N	FOR	48
;strategy	CMP	bomb+(N*1840)%3840,	bomb+((N*1840)%3840)+4000
;strategy	MOV	bomb,	bomb+(N*1840)%3840
;strategy	ROF

;strategy Night Crawler Stone
;strategy NCS:	SPL	0,	<-1001
;strategy	MOV	<21,	1+2234
;strategy	SUB	1,	-1
;strategy	DJN	-2,	<-2234
;strategy bomb:	END	START

START:
N	FOR	48
	CMP	bomb+(N*1840)%3840,	bomb+((N*1840)%3840)+4000
	MOV	bomb,	bomb+(N*1840)%3840
	ROF

NCS:	SPL	0,	<-1001
	MOV	<21,	1+2234
	SUB	1,	-1
	DJN	-2,	<-2234
bomb:	END	START
