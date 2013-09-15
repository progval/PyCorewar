/* BenchPositioning.c
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

#include <stdlib.h>
#include <stdio.h>
#include <MyTypes.h>
#include <BenchPositioning.h>

/* RNG for setting positions of warriors. Might be replaced by a better
 * version in future releases! pmars-0.9.2/pos.c - CACM, 31:10 (1988)
 * return 1 <= value <= 2^31-2, cycles: 2^32
 */
u32_t
rng(u32_t seed)
{
	s32_t tmp = seed;

  	tmp = 16807 * (tmp % 127773) - 2836 * (tmp / 127773);
	if (tmp < 0) {
		tmp += 2147483647;
	}

	return tmp;
}

/* Warrior positions algorithms. */

#define RETRIES1 20 /* How many times to try to generate one position. */
#define RETRIES2  4 /* How many times to start backtracking. */

/* Warrior positioning algorithm for multiwarrior fights. Warrior 0 is always
 * positioned at 0. Return 0 on success (i.e. valid setup found), return 1
 * on error. The value of the seed is changed in order to have a different
 * setup the next round.
 */
u32_t
calc_pos(u32_t *positions, u32_t numwarriors, u32_t coresize,
	 u32_t mindistance, s32_t *seed)
{
	u32_t pos = 1; /* Current warrior to find position for. */
	u32_t i;
	/* Free available space for all warriors, but the first. */
	u32_t space = (coresize - 2 * mindistance + 1);
	s32_t diff;
	u32_t retries1 = RETRIES1;
	u32_t retries2 = RETRIES2;

	do {
		/* Set "random" position for current warrior. */
		*seed = rng(*seed);
		positions[pos] = mindistance + (*seed % space);

		/* Test, if new position leads to overlapping. */
		for (i = 1; i < pos; ++i) {
			diff = (s32_t) positions[pos] - positions[i];
			if (diff < 0) {
				diff = -diff;
			}
			if ((u32_t) diff < mindistance) {
				break; /* Overlap! */
			}
		}

		if (i == pos) {
			++pos; /* No overlap, calculate next postion. */
		} else {
			if (!retries2) {
				return 1; /* Backtracking did not succeed.
					   * Give up :-( */
			}
			if (!retries1) {
				/* Start backtracking. */
				pos = i;
				--retries2;
				retries1 = RETRIES1;
			} else {
				/* Try again. */
				--retries1;
			}
		}
		
	} while (pos < numwarriors);

	return 0; /* Valid setup found. */
}

/* Backup warrior positioning algorithm. */
void
calc_pos_backup(u32_t *positions, u32_t numwarriors, u32_t coresize,
	        u32_t mindistance, s32_t *seed)
{
	u32_t i;
	u32_t j;
	u32_t space = coresize - numwarriors * mindistance + 1;
	u32_t tmp;

	/* Choose numwarriors-1 positions from available space. */
	for (i = 1; i < numwarriors; i++) {
		*seed = rng(*seed);
		tmp = *seed % space;
		for (j = i - 1; j > 0; j--) {
			if (tmp > positions[j]) {
				break;
			}
			positions[j+1] = positions[j];
		}
		positions[j+1] = tmp;
	}

	/* Separate the positions by mindistance instructions. */
	tmp = mindistance;
	for (i = 1; i < numwarriors; i++) {
		positions[i] += tmp;
		tmp += mindistance;
	}

	/* Generate a "random" permutation of the positions. */
	for (i = 1; i < numwarriors; i++) {
		*seed = rng(*seed);
		j = *seed % (numwarriors - 1) + i;
		tmp = positions[j];
		positions[j] = positions[i];
		positions[i] = tmp;
	}
}
