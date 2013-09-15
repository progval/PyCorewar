# Instruction88.py - Test cases for Corewar.Redcode.Instruction88
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
    """Test cases for Corewar.Redcode.Instruction88"""

    def test_default_values(self):
        """Test default values of instruction (ICWS '88)."""

        insn = Instruction88()
        
        self.assertEqual(insn.opcode, OPCODE_DAT)
        self.assertEqual(insn.amode, MODE_DIRECT)
        self.assertEqual(insn.afield, 0)
        self.assertEqual(insn.bmode, MODE_DIRECT)
        self.assertEqual(insn.bfield, 0)
        self.assertEqual(str(insn), 'DAT    $     0, $     0')

    def test_reinitialization(self):
        """Test reinitialization of an instruction (ICWS '88)."""

        insn = Instruction88()
        insn.opcode = OPCODE_SPL
        insn.reinit()

        self.assertEqual(insn.opcode, OPCODE_DAT)
        self.assertEqual(insn.amode, MODE_DIRECT)
        self.assertEqual(insn.afield, 0)
        self.assertEqual(insn.bmode, MODE_DIRECT)
        self.assertEqual(insn.bfield, 0)

    def test_values(self):
        """Test getting/setting values of an instruction (ICWS '88)."""

        insn = Instruction88()
        random.seed(13821503)

        for opcode in (OPCODE_DAT, OPCODE_MOV, OPCODE_ADD, OPCODE_SUB,\
                       OPCODE_JMP, OPCODE_JMZ, OPCODE_JMN, OPCODE_DJN,\
                       OPCODE_CMP, OPCODE_SPL, OPCODE_SLT):
            for amode in (MODE_DIRECT, MODE_IMMEDIATE, MODE_INDIRECT,\
                          MODE_PREDECREMENT):
                for bmode in (MODE_DIRECT, MODE_IMMEDIATE, MODE_INDIRECT,\
                              MODE_PREDECREMENT):
                    afield = random.randint(0, 7999)
                    bfield = random.randint(0, 7999)

                    insn.opcode = opcode
                    insn.amode = amode
                    insn.afield = afield
                    insn.bmode = bmode
                    insn.bfield = bfield

                    self.assertEqual(insn.opcode, opcode)
                    self.assertEqual(insn.amode, amode)
                    self.assertEqual(insn.afield, afield)
                    self.assertEqual(insn.bmode, bmode)
                    self.assertEqual(insn.bfield, bfield)
                    
    def test_comparison(self):
        """Test comparison of instructions (ICWS '88)."""

        i1 = Instruction88()
        i2 = Instruction88()

        self.assertEqual(i1 == i2, True)
        i2.afield = 1
        self.assertEqual(i1 == i2, False)

    def test_bugfix_0001(self):
        """Test bugfix: Side effect of setting modes of an instruction."""

        insn = Instruction88()
        insn.opcode = OPCODE_MOV
        insn.amode = MODE_DIRECT
        insn.afield = 0
        insn.bmode = MODE_DIRECT
        insn.bfield = 1
        self.assertEqual(str(insn), "MOV    $     0, $     1")
