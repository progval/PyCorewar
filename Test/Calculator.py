# Calculator.py - Test Cases for Corewar.Calculator
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

import unittest
import Corewar 

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Calculator"""

    def setUp(self):
        """Set up the test."""

        self.calculator = Corewar.Calculator()

    def test_simple_evals(self):
        """Test simple calculations."""

        self.assertEqual(self.calculator.eval('1+2'), 3)
        self.assertEqual(self.calculator.eval('10-17'), -7)
        self.assertEqual(self.calculator.eval('17*3'), 51)
        self.assertEqual(self.calculator.eval('51/10'), 5)
        self.assertEqual(self.calculator.eval('83 % 8'), 3)
        self.assertEqual(self.calculator.eval('-5 % 2'), 1)
        self.assertEqual(self.calculator.eval('3 == 3'), 1)
        self.assertEqual(self.calculator.eval('3 == 4'), 0)
        self.assertEqual(self.calculator.eval('3 != 4'), 1)
        self.assertEqual(self.calculator.eval('3 < 4'), 1)
        self.assertEqual(self.calculator.eval('3 <= 4'), 1)
        self.assertEqual(self.calculator.eval('33 > 43'), 0)
        self.assertEqual(self.calculator.eval('3 >= 4'), 0)
        self.assertEqual(self.calculator.eval('3 && 4'), 1)
        self.assertEqual(self.calculator.eval('3 || 0'), 1)
        self.assertEqual(self.calculator.eval('!0'), 1)

    def test_precedence(self):
        """Test precedence of operators."""

        self.assertEqual(self.calculator.eval('7+3*5'), 22)
        self.assertEqual(self.calculator.eval('(7+3)*5'), 50)

