/* BenchProcessQueue.h 
 *
 * Copyright (C) 2006 Jens Gutzeit <jens@jgutzeit.de>
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

#ifndef COREWAR_BENCH_PROCESS_QUEUE__H
#define COREWAR_BENCH_PROCESS_QUEUE__H

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

/* Append a process to the processes queue without checking the size of
 * the queue. */
#define PQUEUE_APPEND(x)	do { *pqinfo->tail++ = (x);               \
				     if (pqinfo->tail == pqueue_end)      \
				             pqinfo->tail = pqueue;       \
				} while (0)
/* #define PQUEUE_APPEND(x)	*pqinfo->tail++ = (x) */

/* Return the next process and remove it from the process queue. */
#define PQUEUE_NEXT()		*pqinfo->head++; \
				if (pqinfo->head == pqueue_end) \
					pqinfo->head = pqueue
/* #define PQUEUE_NEXT()		*pqinfo->head++; */

#endif /* COREWAR_BENCH_PROCESS_QUEUE_H */
