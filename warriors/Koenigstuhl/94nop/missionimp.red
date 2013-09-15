From spredan@public.srce.hr Thu Jun 11 13:28:27 1998
Return-Path: <spredan@jagor.srce.hr>
Received: from ociw.edu by andromeda.ociw.edu (SMI-8.6/SMI-SVR4)
	id NAA08813; Thu, 11 Jun 1998 13:28:26 -0700
Received: from osprey.ociw.edu by ociw.edu (SMI-8.6/1.34.5)
	id NAA10602; Thu, 11 Jun 1998 13:28:24 -0700
Received: from jagor.srce.hr by osprey.ociw.edu (4.1/1.34.d4)
	id AA16930; Thu, 11 Jun 98 13:28:18 PDT
Received: from localhost (spredan@localhost)
	by jagor.srce.hr (8.8.8/8.8.6) with SMTP id WAA20493
	for <birk@ociw.edu>; Thu, 11 Jun 1998 22:28:15 +0200 (MET DST)
Date: Thu, 11 Jun 1998 22:28:15 +0200 (MET DST)
From: Stipe Predanic <spredan@public.srce.hr>
To: birk@ociw.edu
Subject: Koenigstuhl entry
Message-Id: <Pine.SOL.3.95.980611222522.20135A-100000@jagor.srce.hr>
Mime-Version: 1.0
X-Lines: 33
Status: RO
Content-Type: TEXT/PLAIN; charset="US-ASCII"
Content-Length: 708

;redcode-b
;name Mission IMPossible: First Contact
;author Stipe Predanic
;strategy 7-point imp spiral  (binary lounch)
; I'm a begginer so I was searching for something easy to understand
; and yet powerful at the same time. Found Planars introduction
; to imp-spirals in Corewarrior no.4, and after studying that 
; (especially Impfinity v1) I made this. And IT even works :))
;assert CORESIZE==8000
step equ  1143
runner spl runner
a   spl c,}h
b   spl e,}i
d   spl i,}j
h   jmp imp-3,}h
i   jmp imp+step-2,}i
e   spl k,}k
j   jmp imp+2*step-1,}j
k   jmp imp+3*step-1,}k
c   spl g,}l
f   spl m,}m
l   jmp imp+4*step-2,}l
m   jmp imp+5*step-1,}m
g   nop }n  
n   jmp imp+6*step-1,}n

imp  mov 0,step







