# Instruction.py - Test cases for Corewar.Redcode.Instruction
#
# Copyright (C) 2005 Jens Gutzeit <jens@jgutzeit.de>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

import unittest, random
from Corewar.Redcode import * 

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Redcode.Instruction"""

    def test_default_values(self):
        """Test default values of an instruction."""

        insn = Instruction()
        
        self.assertEqual(insn.opcode, OPCODE_DAT)
        self.assertEqual(insn.modifier, MODIFIER_F)
        self.assertEqual(insn.amode, MODE_DIRECT)
        self.assertEqual(insn.afield, 0)
        self.assertEqual(insn.bmode, MODE_DIRECT)
        self.assertEqual(insn.bfield, 0)
        self.assertEqual(str(insn), 'DAT.F  $     0, $     0')

    def test_values(self):
        """Test getting/setting values of an instruction."""

        insn = Instruction()
        random.seed(13821503)

        for opcode in (OPCODE_DAT, OPCODE_MOV, OPCODE_ADD, OPCODE_SUB,\
                       OPCODE_JMP, OPCODE_JMZ, OPCODE_JMN, OPCODE_DJN,\
                       OPCODE_SEQ, OPCODE_SPL, OPCODE_SLT, OPCODE_MUL,\
                       OPCODE_DIV, OPCODE_MOD, OPCODE_SNE, OPCODE_NOP,\
                       OPCODE_STP, OPCODE_LDP):
            for modifier in (MODIFIER_A, MODIFIER_B, MODIFIER_F, MODIFIER_I,\
                             MODIFIER_X, MODIFIER_AB, MODIFIER_BA):
                for amode in (MODE_IMMEDIATE, MODE_DIRECT, MODE_B_INDIRECT,\
                              MODE_B_PREDECREMENT, MODE_B_POSTINCREMENT,\
                              MODE_A_INDIRECT, MODE_A_PREDECREMENT,\
                              MODE_A_POSTINCREMENT):
                    for bmode in (MODE_IMMEDIATE, MODE_DIRECT,\
                                  MODE_B_INDIRECT, MODE_B_PREDECREMENT,\
                                  MODE_B_POSTINCREMENT, MODE_A_INDIRECT,\
                                  MODE_A_PREDECREMENT, MODE_A_POSTINCREMENT):
                        afield = random.randint(0, 7999)
                        bfield = random.randint(0, 7999)

                        insn.opcode = opcode
                        insn.modifier = modifier
                        insn.amode = amode
                        insn.afield = afield
                        insn.bmode = bmode
                        insn.bfield = bfield

                        self.assertEqual(insn.opcode, opcode)
                        self.assertEqual(insn.modifier, modifier)
                        self.assertEqual(insn.amode, amode)
                        self.assertEqual(insn.afield, afield)
                        self.assertEqual(insn.bmode, bmode)
                        self.assertEqual(insn.bfield, bfield)

    def test_reinitialization(self):
        """Test reinitialization of an instruction."""

        insn = Instruction()
        insn.opcode = OPCODE_SPL
        insn.modifier = MODIFIER_X
        insn.amode = MODE_IMMEDIATE
        insn.afield = 42
        insn.bmode = MODE_A_POSTINCREMENT
        insn.bfield = 171
        insn.reinit()

        self.assertEqual(insn.opcode, OPCODE_DAT)
        self.assertEqual(insn.modifier, MODIFIER_F)
        self.assertEqual(insn.amode, MODE_DIRECT)
        self.assertEqual(insn.afield, 0)
        self.assertEqual(insn.bmode, MODE_DIRECT)
        self.assertEqual(insn.bfield, 0)
        
    def test_comparison(self):
        """Test comparison of instructions."""

        i1 = Instruction()
        i2 = Instruction()

        self.assertEqual(i1 == i2, True)
        i2.afield = 1
        self.assertEqual(i1 == i2, False)
