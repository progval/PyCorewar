/* BenchPositioning.h
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

#ifndef BENCH_POSITONING__H
#define BENCH_POSTIONING__H

u32_t rng(u32_t seed);
u32_t calc_pos(u32_t *positions, u32_t numwarriors, u32_t coresize,
	       u32_t mindistance, u32_t *seed);
void calc_pos_backup(u32_t *positions, u32_t numwarriors, u32_t coresize,
 	             u32_t mindistance, u32_t *seed);

#endif /* BENCH_POSITIONING__H */
