/* BenchMARS88.c
 *
 * Copyright (C) 2005 Jens Gutzeit <jens@jgutzeit.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <MyTypes.h>
#include <Instruction.h>
#include <BenchWarrior.h>
#include <BenchProcessQueue.h>
#include <BenchPositioning.h>
#include <BenchMacros.h>
#include <BenchMARS88.h>

/* Run a two warrior fight. Parameters are NOT checked for plausibility!
 * Return the result after the fights or NULL on error. */
u32_t *
run_88(insn_t *core, warrior_t *warriors, u32_t coresize, u32_t maxprocesses,
       u32_t maxcycles, u32_t mindistance, u32_t numrounds, u32_t seed)
{
	u32_t round; /* Number of the current round. */
	u32_t *results; /* List with the results, format: w l t. */
	u32_t pos2; /* Position of second warrior in the core. */
	/* Available space in the core for second warrior. */
	u32_t const space = coresize - 2 * mindistance + 1; 
	u32_t cycle; /* Number of current cycle. */
	pqueue_info_t pqueue_info1; /* Information about processes queue of
				       first warrior. */
	pqueue_info_t pqueue_info2; /* Information about processes queue of
				       second warrior. */
	pqueue_info_t *pqinfo;
	insn_t **pqueue; /* Memory for the process queues. */
	insn_t **pqueue_end;

	insn_t *core_end = core + coresize;

	
	/* Allocate memory for the process queues. */
	pqueue = calloc(2 * maxprocesses + 2, sizeof(insn_t *));
	if (pqueue == NULL) {
		return NULL;
	}
	pqueue_end = pqueue + 2 * maxprocesses + 2;
	
	/* Allocate and initialize memory for results. */
	results = calloc(3, sizeof(u32_t));
	if (results == NULL) {
		free (pqueue);
		return NULL;
	}
	memset(results, 0, 3 * sizeof(u32_t));

	/* Adjust seed to make the second warrior be at position seed in
	 * the first round. */
	seed -= mindistance;

	/* No need to use field 'prev'. */
	pqueue_info1.next = &pqueue_info2;
	pqueue_info2.next = &pqueue_info1;
	for (round = 0; round < numrounds; round++) {
		/* Calculate position of second warrior. */
		pos2 = mindistance + seed % space;
		seed = rng(seed);
		
		/* Set up core and load warriors. */
		memset(core, 0, coresize * sizeof(insn_t));
		load_warrior(core, &warriors[0], 0, coresize);
		load_warrior(core, &warriors[1], pos2, coresize);

		/* Set up process queues. */
		pqueue[0] = core + warriors[0].start;
		pqueue_info1.head = pqueue;
		pqueue_info1.tail = pqueue + 1;
		pqueue_info1.numprocesses = 1;

		pqueue[maxprocesses + 1] = core + pos2 + warriors[1].start;
		pqueue_info2.head = pqueue + maxprocesses + 1;
		pqueue_info2.tail = pqueue + maxprocesses + 2;

		pqueue_info2.numprocesses = 1;

		/* Set execution order of warriors. */
		if (round % 2 == 0) {
			pqinfo = &pqueue_info1;
		} else {
			pqinfo = &pqueue_info2;
		}

		/* Run one round. */
		cycle = 2 * maxcycles;
		do {
			insn_t *ip;    /* Pointer to the currently executed
				        * instruction. */
			u32_t ra_b;    /* A register value */
			u32_t rb_b;    /* B register value */
			insn_t *aAddr; /* Pointer to address specified by
					* A operand. */
			insn_t *bAddr; /* Pointer to address specified by
					* B operand. */

#define in_a ra_a
#define in_b rb_b

			/* Get current instruction pointer and remove it
			 * from the queue. The number of processes isn't
			 * changed, because it usually doesn't, but see the
			 * special cases SPL and DAT! */
			ip = PQUEUE_NEXT();

			/* Switch on opcode/amode/bmode. */
			switch (ip->insn) {
			/*
	 		 * MOV
	 		 */
			case INSN88(MOV, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, DIRECT):
				in_b = ip->b; /* Save value, because it might
					       * be changed by A operand. */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);	

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);	
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);	

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
	 		 * SPL
	 		 */
			case INSN88(SPL, DIRECT, IMMEDIATE):
			case INSN88(SPL, DIRECT, DIRECT):
			case INSN88(SPL, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);	

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, IMMEDIATE):
			case INSN88(SPL, INDIRECT, DIRECT):
			case INSN88(SPL, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, IMMEDIATE):
			case INSN88(SPL, PREDECREMENT, DIRECT):
			case INSN88(SPL, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
		
				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * DAT
			 */
			case INSN88(DAT, IMMEDIATE, IMMEDIATE):
				/* Current process dies. Finish this
				 * round, if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, DIRECT, DIRECT):
				/* DAT $ x, $ y isn't a valid instruction,
				 * but can be executed nonetheless! */

				/* Current process dies. Finish this						 * round, if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, IMMEDIATE, PREDECREMENT):
				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, PREDECREMENT, IMMEDIATE):
				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			/*
			 * JMP
			 */
			case INSN88(JMP, DIRECT, IMMEDIATE):
			case INSN88(JMP, DIRECT, DIRECT):
			case INSN88(JMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* No need to evaluate B operand. */
	
				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, IMMEDIATE):
			case INSN88(JMP, INDIRECT, DIRECT):
			case INSN88(JMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, IMMEDIATE):
			case INSN88(JMP, PREDECREMENT, DIRECT):
			case INSN88(JMP, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			/*
			 * DJN
			 */
			case INSN88(DJN, DIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * ADD
			 */
			case INSN88(ADD, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SUB
			 */
			case INSN88(SUB, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * JMZ
			 */
			case INSN88(JMZ, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * JMN
			 */
			case INSN88(JMN, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * CMP
			 */
			case INSN88(CMP, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
		   		    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */


				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SLT
			 */
			case INSN88(SLT, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			default:
				/* This shouldn't happen. */
				printf("Invalid instruction found. "\
				       "You have a problem!\n");
			}

			pqinfo = pqinfo->next; /* Switch to next warrior. */
		} while (--cycle);

		/* Accumulate results. */
		if (pqueue_info1.numprocesses == 0) {
			results[1]++; /* First warrior has lost. */
		} else if (pqueue_info2.numprocesses == 0) {
			results[0]++; /* First warrior has won. */
		} else {
			results[2]++; /* Tie. */
		}
	}

	/* Clean up. */
	free(pqueue);

	return results;
}

/* Run a two warrior fight with all possible start positions. Parameters are
 * NOT checked for plausibility! Return the result after the fights or NULL
 * on error. */
u32_t *
p_run_88(insn_t *core, warrior_t *warriors, u32_t coresize, u32_t maxprocesses,
         u32_t maxcycles, u32_t mindistance)
{
	u32_t round; /* Number of the current round. */
	u32_t *results; /* List with the results, format: w l t. */
	u32_t cycle; /* Number of current cycle. */
	u32_t pos2; /* Position of second warrior in core. */
	pqueue_info_t pqueue_info1; /* Information about processes queue of
				       first warrior. */
	pqueue_info_t pqueue_info2; /* Information about processes queue of
				       second warrior. */
	pqueue_info_t *pqinfo;
	insn_t **pqueue; /* Memory for the process queues. */
	insn_t **pqueue_end;

	insn_t *core_end = core + coresize;
	
	/* Allocate memory for the process queues. */
	pqueue = calloc(2 * maxprocesses + 2, sizeof(insn_t *));
	if (pqueue == NULL) {
		return NULL;
	}
	pqueue_end = pqueue + 2 * maxprocesses + 2;
	
	/* Allocate and initialize memory for results. */
	results = calloc(3, sizeof(u32_t));
	if (results == NULL) {
		free (pqueue);
		return NULL;
	}
	memset(results, 0, 3 * sizeof(u32_t));

	/* No need to use field 'prev'. */
	pqueue_info1.next = &pqueue_info2;
	pqueue_info2.next = &pqueue_info1;
	for (round = 0; round < 2 * (coresize - 2*mindistance + 1); round++) {
		pos2 = mindistance + round/2;
		
		/* Set up core and load warriors. */
		memset(core, 0, coresize * sizeof(insn_t));
		load_warrior(core, &warriors[0], 0, coresize);
		load_warrior(core, &warriors[1], pos2, coresize);

		/* Set up process queues. */
		pqueue[0] = core + warriors[0].start;
		pqueue_info1.head = pqueue;
		pqueue_info1.tail = pqueue + 1;
		pqueue_info1.numprocesses = 1;

		pqueue[maxprocesses + 1] = core + pos2 + warriors[1].start;
		pqueue_info2.head = pqueue + maxprocesses + 1;
		pqueue_info2.tail = pqueue + maxprocesses + 2;
		pqueue_info2.numprocesses = 1;

		/* Set execution order of warriors. */
		if (round % 2 == 0) {
			pqinfo = &pqueue_info1;
		} else {
			pqinfo = &pqueue_info2;
		}

		/* Run one round. */
		cycle = 2 * maxcycles;
		do {
			insn_t *ip;    /* Pointer to the currently executed
				        * instruction. */
			u32_t ra_b;    /* A register value */
			u32_t rb_b;    /* B register value */
			insn_t *aAddr; /* Pointer to address specified by
					* A operand. */
			insn_t *bAddr; /* Pointer to address specified by
					* B operand. */

#define in_a ra_a
#define in_b rb_b

			/* Get current instruction pointer and remove it
			 * from the queue. The number of processes isn't
			 * changed, because it usually doesn't, but see the
			 * special cases SPL and DAT! */
			ip = *pqinfo->head++;
			if (pqinfo->head == pqueue_end) pqinfo->head = pqueue;

			/* Switch on opcode/amode/bmode. */
			switch (ip->insn) {
			/*
	 		 * MOV
	 		 */
			case INSN88(MOV, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, DIRECT):
				in_b = ip->b; /* Save value, because it might
					       * be changed by A operand. */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);	

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);	
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);	

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
	 		 * SPL
	 		 */
			case INSN88(SPL, DIRECT, IMMEDIATE):
			case INSN88(SPL, DIRECT, DIRECT):
			case INSN88(SPL, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);	

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, IMMEDIATE):
			case INSN88(SPL, INDIRECT, DIRECT):
			case INSN88(SPL, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, IMMEDIATE):
			case INSN88(SPL, PREDECREMENT, DIRECT):
			case INSN88(SPL, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
		
				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * DAT
			 */
			case INSN88(DAT, IMMEDIATE, IMMEDIATE):
				/* Current process dies. Finish this
				 * round, if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, DIRECT, DIRECT):
				/* DAT $ x, $ y isn't a valid instruction,
				 * but can be executed nonetheless! */

				/* Current process dies. Finish this						 * round, if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, IMMEDIATE, PREDECREMENT):
				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, PREDECREMENT, IMMEDIATE):
				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			case INSN88(DAT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) cycle = 1;
				break;
			/*
			 * JMP
			 */
			case INSN88(JMP, DIRECT, IMMEDIATE):
			case INSN88(JMP, DIRECT, DIRECT):
			case INSN88(JMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* No need to evaluate B operand. */
	
				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, IMMEDIATE):
			case INSN88(JMP, INDIRECT, DIRECT):
			case INSN88(JMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, IMMEDIATE):
			case INSN88(JMP, PREDECREMENT, DIRECT):
			case INSN88(JMP, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			/*
			 * DJN
			 */
			case INSN88(DJN, DIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * ADD
			 */
			case INSN88(ADD, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SUB
			 */
			case INSN88(SUB, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * JMZ
			 */
			case INSN88(JMZ, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * JMN
			 */
			case INSN88(JMN, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * CMP
			 */
			case INSN88(CMP, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
		   		    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */


				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SLT
			 */
			case INSN88(SLT, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			default:
				/* This shouldn't happen. */
				printf("Invalid instruction found. "\
				       "You have a problem!\n");
			}
	
			pqinfo = pqinfo->next; /* Switch to next warrior. */
		} while (--cycle);

		/* Accumulate results. */
		if (pqueue_info1.numprocesses == 0) {
			results[1]++; /* First warrior has lost. */
		} else if (pqueue_info2.numprocesses == 0) {
			results[0]++; /* First warrior has won. */
		} else {
			results[2]++; /* Tie. */
		}
	}

	/* Clean up. */
	free(pqueue);
	
	return results;
}

/* Run a multiwarrior fight. Parameters are NOT checked for plausibility!
 * Return the result after the fights or NULL on error. */
u32_t *
mw_run_88(insn_t *core, u32_t numwarriors, warrior_t *warriors, u32_t coresize,
          u32_t maxprocesses, u32_t maxcycles, u32_t mindistance,
	  u32_t numrounds, u32_t seed)
{
	u32_t round; /* Number of the current round. */
	u32_t *results; /* List with the results. */
	u32_t *positions; /* List of the positions of all warriors. */
	u32_t cycle; /* Number of current cycle. */
	pqueue_info_t *pqinfos; /* Information about the process queues of
				  all warriors. */
	pqueue_info_t *pqinfo;
	insn_t **pqueue; /* Memory for the process queues. */
	insn_t **pqueue_end;
	insn_t **tmp_pqueue;

	u32_t numalive; /* Number of living warriors for current round. */
	u32_t i;

	insn_t *core_end = core + coresize;
	
	/* Allocate memory for the process queues. */
	pqueue = calloc(numwarriors * (maxprocesses + 1), sizeof(insn_t *));
	if (pqueue == NULL) {
		return NULL;
	}
	pqueue_end = pqueue + numwarriors * (maxprocesses + 1);
	
	/* Allocate memory for the information about the process queues. */
	pqinfos = calloc(numwarriors, sizeof(pqueue_info_t));
	if (pqinfos == NULL) {
		free(pqueue);
		return NULL;
	}
	
	/* Allocate and initialize memory for results. */
	results = calloc(numwarriors * (numwarriors + 1), sizeof(u32_t));
	if (results == NULL) {
		free(pqinfos);
		free(pqueue);
		return NULL;
	}
	memset(results, 0, numwarriors * (numwarriors + 1) * sizeof(u32_t));

	/* Allocate memory for positions of warriors. */
	positions = calloc(numwarriors, sizeof(u32_t));
	if (positions == NULL) {
		free(results);
		free(pqinfos);
		free(pqueue);
		return NULL;
	}
	
	/* Adjust seed to make the second warrior be at position seed in
	 * the first round. */
	seed -= mindistance;

	/* "First" warrior is always at position 0. */
	positions[0] = 0;
	
	for (round = 0; round < numrounds; round++) {
		/* Calculate position of each warrior. */
		if (calc_pos(positions, numwarriors, coresize, mindistance,
			     &seed)) {
			calc_pos_backup(positions, numwarriors, coresize,
					mindistance, &seed);
		}
		
		/* Set up core, load warriors into core and setup all
		 * process queues. */
		memset(core, 0, coresize * sizeof(insn_t));
		tmp_pqueue = pqueue;
		for (i = 0; i < numwarriors; i++) {
			load_warrior(core, &warriors[i], positions[i],
				     coresize);
			
			*tmp_pqueue = core + (positions[i] + 
				      warriors[i].start) % coresize;
			pqinfos[i].head = tmp_pqueue;
			pqinfos[i].tail = tmp_pqueue + 1;
			pqinfos[i].numprocesses = 1;

			pqinfos[i].next = &pqinfos[(i + 1) % numwarriors];
			pqinfos[i].prev = &pqinfos[(i + numwarriors - 1) % 
				                   numwarriors];

			tmp_pqueue += maxprocesses + 1;
		}

		/* Set first warrior to execute. */
		pqinfo = &pqinfos[round % numwarriors];

		/* Run one round. */
		cycle = numwarriors * maxcycles;
		numalive = numwarriors;
		do {
			insn_t *ip;    /* Pointer to the currently executed
				        * instruction. */
			u32_t ra_b;    /* A register value */
			u32_t rb_b;    /* B register value */
			insn_t *aAddr; /* Pointer to address specified by
					* A operand. */
			insn_t *bAddr; /* Pointer to address specified by
					* B operand. */

#define in_a ra_a
#define in_b rb_b

			/* Get current instruction pointer and remove it
			 * from the queue. The number of processes isn't
			 * changed, because it usually doesn't, but see the
			 * special cases SPL and DAT! */
			ip = *pqinfo->head++;
			if (pqinfo->head == pqueue_end) pqinfo->head = pqueue;

			/* Switch on opcode/amode/bmode. */
			switch (ip->insn) {
			/*
	 		 * MOV
	 		 */
			case INSN88(MOV, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, DIRECT):
				in_b = ip->b; /* Save value, because it might
					       * be changed by A operand. */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);	

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);	
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);	

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				/* Copy complete instruction. */
				*bAddr = *aAddr;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b;
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				/* Copy complete instruction. */
				bAddr->insn = aAddr->insn;
				bAddr->a = aAddr->a;
				bAddr->b = ra_b;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(MOV, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);
						
				/* Copy A field to B field. */
				bAddr->b = ip->a;
		
				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
	 		 * SPL
	 		 */
			case INSN88(SPL, DIRECT, IMMEDIATE):
			case INSN88(SPL, DIRECT, DIRECT):
			case INSN88(SPL, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);	

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, IMMEDIATE):
			case INSN88(SPL, INDIRECT, DIRECT):
			case INSN88(SPL, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, IMMEDIATE):
			case INSN88(SPL, PREDECREMENT, DIRECT):
			case INSN88(SPL, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(SPL, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
		
				/* Queue next instruction */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);

				/* Queue new process, if possible. */
				if (pqinfo->numprocesses < maxprocesses) {
					pqinfo->numprocesses++;
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * DAT
			 */
			case INSN88(DAT, IMMEDIATE, IMMEDIATE):
				/* Current process dies. Finish this
				 * round, if warrior is dead. */
				if (--pqinfo->numprocesses == 0) {
					/* Adjust list of living warriors. */
					pqinfo->prev->next = pqinfo->next;
					pqinfo->next->prev = pqinfo->prev;

					/* Adjust number of remaining cycles
					 * for living warriors. */
					cycle = cycle - cycle/numalive;
				
					numalive--;
				}
				break;
			case INSN88(DAT, DIRECT, DIRECT):
				/* DAT $ x, $ y isn't a valid instruction,
				 * but can be executed nonetheless! */
				if (--pqinfo->numprocesses == 0) {
					/* Adjust list of living warriors. */
					pqinfo->prev->next = pqinfo->next;
					pqinfo->next->prev = pqinfo->prev;

					/* Adjust number of remaining cycles
					 * for living warriors. */
					cycle = cycle - cycle/numalive;
				
					numalive--;
				}
				break;
			case INSN88(DAT, IMMEDIATE, PREDECREMENT):
				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) {
					/* Adjust list of living warriors. */
					pqinfo->prev->next = pqinfo->next;
					pqinfo->next->prev = pqinfo->prev;

					/* Adjust number of remaining cycles
					 * for living warriors. */
					cycle = cycle - cycle/numalive;
				
					numalive--;
				}
				break;
			case INSN88(DAT, PREDECREMENT, IMMEDIATE):
				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) {
					/* Adjust list of living warriors. */
					pqinfo->prev->next = pqinfo->next;
					pqinfo->next->prev = pqinfo->prev;

					/* Adjust number of remaining cycles
					 * for living warriors. */
					cycle = cycle - cycle/numalive;
				
					numalive--;
				}
				break;
			case INSN88(DAT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Partially evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);

				/* Partially evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Current process dies. Finish this round,
				 * if warrior is dead. */
				if (--pqinfo->numprocesses == 0) {
					/* Adjust list of living warriors. */
					pqinfo->prev->next = pqinfo->next;
					pqinfo->next->prev = pqinfo->prev;

					/* Adjust number of remaining cycles
					 * for living warriors. */
					cycle = cycle - cycle/numalive;
				
					numalive--;
				}
				break;
			/*
			 * JMP
			 */
			case INSN88(JMP, DIRECT, IMMEDIATE):
			case INSN88(JMP, DIRECT, DIRECT):
			case INSN88(JMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* No need to evaluate B operand. */
	
				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, IMMEDIATE):
			case INSN88(JMP, INDIRECT, DIRECT):
			case INSN88(JMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, IMMEDIATE):
			case INSN88(JMP, PREDECREMENT, DIRECT):
			case INSN88(JMP, PREDECREMENT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* No need to evaluate B operand. */

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			case INSN88(JMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Partially evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);

				/* Queue jump destination. */
				PQUEUE_APPEND(aAddr);
				break;
			/*
			 * DJN
			 */
			case INSN88(DJN, DIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, IMMEDIATE):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				/* Nothing to do. */

				DECMOD(ip->b);
				if (ip->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			case INSN88(DJN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				DECMOD(bAddr->b);
				if (bAddr->b == 0) {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				} else {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				}
				break;
			/*
			 * ADD
			 */
			case INSN88(ADD, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(ADD, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				ADDMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				ADDMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SUB
			 */
			case INSN88(SUB, IMMEDIATE, DIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, INDIRECT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, IMMEDIATE, PREDECREMENT):
				/* Evaluate A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->b, bAddr->b, ip->a, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, DIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, DIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, INDIRECT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, INDIRECT, PREDECREMENT):
				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, aAddr->b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SUB, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evaluate A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				SUBMOD(bAddr->a, bAddr->a, aAddr->a, coresize);
				SUBMOD(bAddr->b, bAddr->b, ra_b, coresize);

				/* Queue next instruction. */
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * JMZ
			 */
			case INSN88(JMZ, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMZ, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b == 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * JMN
			 */
			case INSN88(JMN, DIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, DIRECT, PREDECREMENT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, IMMEDIATE):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				/* Nothing to do. */

				if (ip->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, DIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, INDIRECT):
				/* Evaluate B operand first, because in this
				 * case no harm can be done. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Evalute A operand. */
					ASSIGNADDR(aAddr, ip, ip->a);
					ADDADDR(aAddr, aAddr->b);

					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* No need to evalute A operand. */
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, IMMEDIATE):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				if (ip->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, DIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, INDIRECT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			case INSN88(JMN, PREDECREMENT, PREDECREMENT):
				in_b = ip->b; /* == rb_b !!! */

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (bAddr->b != 0) {
					/* Queue jump destination. */
					PQUEUE_APPEND(aAddr);
				} else {
					/* Queue next instruction. */
					IPINCMOD(ip);
					PQUEUE_APPEND(ip);
				}
				break;
			/*
			 * CMP
			 */
			case INSN88(CMP, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
		   		    aAddr->a    == bAddr->a &&
				    aAddr->b    == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(CMP, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */


				/* Evaluate B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->insn == bAddr->insn &&
				    aAddr->a    == bAddr->a &&
				    ra_b        == bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			/*
			 * SLT
			 */
			case INSN88(SLT, IMMEDIATE, DIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, INDIRECT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, IMMEDIATE, PREDECREMENT):
				/* Evalute A operand. */
				/* Nothing to do. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ip->a < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);
				
				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, DIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, DIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, INDIRECT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, INDIRECT, PREDECREMENT):
				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, ip->b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, DIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);

				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, INDIRECT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				ADDADDR(bAddr, bAddr->b);

				if (aAddr->b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			case INSN88(SLT, PREDECREMENT, PREDECREMENT):
				in_b = ip->b;

				/* Evalute A operand. */
				ASSIGNADDR(aAddr, ip, ip->a);
				DECMOD(aAddr->b);
				ADDADDR(aAddr, aAddr->b);
				ra_b = aAddr->b; /* Save value, because it
						  * might be changed by
						  * B operand. */
		
				/* Evalute B operand. */
				ASSIGNADDR(bAddr, ip, in_b);
				DECMOD(bAddr->b);
				ADDADDR(bAddr, bAddr->b);

				if (ra_b < bAddr->b) {
					/* Skip next instruction. */
					IPINCMOD(ip);
				}
				IPINCMOD(ip);
				PQUEUE_APPEND(ip);
				break;
			default:
				/* This shouldn't happen. */
				printf("Invalid instruction found. "\
				       "You have a problem!\n");
			}

			pqinfo = pqinfo->next; /* Switch to next warrior. */
		} while ((--cycle > 0) & (numalive > 1));

		/* Accumulate results. */
		for (i = 0; i < numwarriors; i++) {
			if (pqinfos[i].numprocesses == 0) {
				/* Warrior died this round. */
				results[i*(numwarriors + 1) + numwarriors]++;
			} else {
				/* Warrior survived/won this round. */
				results[i*(numwarriors + 1) + numalive - 1]++;
			}
		}
	}
	
	/* Clean up. */
	free(positions);
	free(pqinfos);
	free(pqueue);
	
	return results;
}
