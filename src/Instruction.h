/* Instruction.h
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

#ifndef COREWAR_INSTRUCTION_H
#define COREWAR_INSTRUCTION_H

#include <string.h>
#include <MyTypes.h>

/* Max. supported coresize. */
#define MAX_CORESIZE    1000000000

/*
 * opcodes
 */

/* ICWS '88 */

#define	DAT		0x00		/* must be zero! */
#define MOV             0x01
#define ADD             0x02
#define SUB             0x03
#define JMP             0x04
#define JMZ             0x05
#define JMN             0x06
#define DJN             0x07
#define CMP             0x08
#define SPL             0x09
#define SLT             0x0a

/* ICWS '94 draft without p-space */

#define MUL             0x0b
#define DIV             0x0c
#define MOD             0x0d
#define SEQ             CMP
#define SNE             0x0e
#define NOP             0x0f

/* ICWS '94 draft */

#define LDP		0x10
#define STP		0x11		

/*
 * addressing modes
 */

/* ICWS '88 */

#define DIRECT		0x00		/* Must be zero! */
#define IMMEDIATE	0x01
#define INDIRECT	0x02
#define PREDECREMENT	0x03

/* ICWS '94 draft */

#define B_INDIRECT	INDIRECT
#define B_PREDECREMENT	PREDECREMENT
#define B_POSTINCREMENT	0x04
#define A_INDIRECT	0x05
#define A_PREDECREMENT	0x06
#define A_POSTINCREMENT	0x07

/*
 * modifier
 */

/* ICWS '94 */

#define MODIFIER_F	0x00		/* Must be zero! */
#define MODIFIER_A	0x01
#define MODIFIER_B	0x02
#define MODIFIER_AB	0x03
#define MODIFIER_BA	0x04
#define MODIFIER_X	0x05
#define MODIFIER_I	0x06

/*
 * data types
 */

typedef struct {
	u32_t		insn;	/* opcode, (modifier), A-mode, B-mode */
	field_t		a;	/* A-field */
	field_t		b;	/* B-field */
} insn_t;

/*
 * common operations
 */

/* Create insn-field from opcode, A-mode and B-mode (ICWS '88). */
#define INSN88(op,am,bm)	(((op) << 4) | ((am) << 2) | (bm))

/* Create insn-field from opcode, addressing mode, A-mode and B-mode
 * (ICWS '94 draft) */
#define INSN(op,mod,am,bm)	(((op) << 9) | ((mod) << 6) | \
				 ((am) << 3) | (bm))

#define OP_MOD(op,mod)		(((op) << 3) | (mod))
#define GET_OP_MOD(insn)	((insn) >> 6)

#define GET_MODES(insn)		((insn) & 0x003f)
#define MODES(am, bm)		(((am) << 3) | (bm))

/* Return opcode of insn-field (ICWS '88). */
#define OPCODE88(insn)		((insn) >> 4)

/* Return opcode of insn-field (ICWS '94 draft). */
#define OPCODE(insn)		((insn) >> 9)

/* Set opcode of insn-field (replacing old opcode, ICWS '88). */
#define SETOPCODE88(insn,op)	(((insn) & 0x0f) | ((op) << 4))

/* Set opcode of insn-field (replacing old opcode, ICWS '94 draft). */
#define SETOPCODE(insn,op)	(((insn) & 0x01ff) | ((op) << 9))

/* Return modifier of insn-field (ICWS '94 draft). */
#define MODIFIER(insn)		(((insn) >> 6) & 0x0007)

/* Set modifier of insn-field (replacing old addressing mode,
 * ICWS '94 draft). */
#define SETMODIFIER(insn,mod)	(((insn) & 0x3e3f) | ((mod) << 6))

/* Return A-mode of insn-field (ICWS '88). */
#define AMODE88(insn)		(((insn) & 0x0c) >>  2)

/* Return A-mode of insn-field (ICWS '94 draft). */
#define AMODE(insn)		(((insn) >> 3) & 0x0007)

/* Set A-mode of insn-field (replacing old A-mode, ICWS '88). */
#define SETAMODE88(insn,am)	(((insn) & 0xf3) | ((am) <<  2))

/* Set A-mode of insn-field (replacing old A-mode, ICWS '94 draft). */
#define SETAMODE(insn,am)	(((insn) & 0x3fc7) | ((am) << 3))

/* Return B-mode of insn-field (ICWS '88). */
#define BMODE88(insn)		((insn) & 0x03)

/* Return B-mode of insn-field (ICWS '88). */
#define BMODE(insn)		((insn) & 0x0007)

/* Set B-mode of insn-field (replacing old B-mode, ICWS '88). */
#define SETBMODE88(insn,bm)	((insn & 0xfc) | (bm))

/* Set B-mode of insn-field (replacing old B-mode, ICWS '94 draft). */
#define SETBMODE(insn,bm)	((insn & 0x3ff8) | (bm))

#endif /* COREWAR_INSTRUCTION_H */
