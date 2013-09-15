/* BenchWarrior.c
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
#include <MyTypes.h>
#include <Instruction.h>
#include <BenchMacros.h>
#include <BenchWarrior.h>

/* Free memory of list of warriors. No error checking is performed. */
void
free_warriors(warrior_t *wlist, u32_t numwarriors)
{
	u32_t i;

	for (i = 0; i < numwarriors; i++) {
		free(wlist[i].insns);
	}
	free(wlist);
}

/* Load warrior onto the give position in the core (without checking,
 * whether it overwrites another warrior). */
void
load_warrior(insn_t *core, warrior_t *warrior, u32_t position, u32_t coresize)
{
	u32_t i;

	for (i = 0; i < warrior->length; i++) {
		core[position].insn = warrior->insns[i].insn;
		core[position].a = warrior->insns[i].a;
		core[position].b = warrior->insns[i].b;
		INCMOD(position);
	}
}
