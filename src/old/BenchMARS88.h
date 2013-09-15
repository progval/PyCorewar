/* BenchMARS88.h 
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

#ifndef COREWAR_BENCHMARKING_MARS88__H
#define COREWAR_BENCHMARKING_MARS88__H

typedef struct {
	u32_t start;
	u32_t length;
	insn_t *insns;
} warrior_t;

typedef struct _pqueue_info_t {
	insn_t **head;		/* Next processes to run. */
	insn_t **tail;		/* Next free location for queueing a new
				 * process. */
	u32_t numprocesses;	/* Number of processes for this warrior. */

	struct _pqueue_info_t *next; /* Pointer to process queue of next
					living warrior. */
	struct _pqueue_info_t *prev; /* Pointer to process queue of previous
					living warrior. */
} pqueue_info_t;

void free_warriors(warrior_t *wlist, u32_t numwarriors);
u32_t *run(insn_t *core, warrior_t *warriors, u32_t coresize,
	   u32_t maxprocesses, u32_t maxcycles, u32_t mindistance,
	   u32_t numrounds, u32_t seed);
u32_t *p_run(insn_t *core, warrior_t *warriors, u32_t coresize,
	     u32_t maxprocesses, u32_t maxcycles, u32_t mindistance);
u32_t *mw_run(insn_t *core, u32_t numwarriors, warrior_t *warriors,
	      u32_t coresize, u32_t maxprocesses, u32_t maxcycles,
	      u32_t mindistance, u32_t numrounds, u32_t seed);

#endif /* COREWAR_BENCHMARKING_MARS88_H */
