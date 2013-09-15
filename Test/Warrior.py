# Warrior.py - Test cases for Corewar.Warrior
#
# Copyright (C) 2006 Jens Gutzeit <jens@jgutzeit.de>
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
from Corewar import *
from Corewar.Redcode import *

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Redcode.Warrior."""

    def test_default_values(self):
        """Test default values of an warrior."""

        w = Warrior()
        self.assertEqual(w.author, 'Anonymous')
        self.assertEqual(w.name, 'Unknown')
        self.assertEqual(w.start, 0)
        self.assertEqual(w.instructions, [])

    def test_values(self):
        """Test getting/setting values of an warrior."""

        w = Warrior()

        w.author = 'John Doe'
        self.assertEqual(w.author, 'John Doe')

        w.name = 'Testing the Test'
        self.assertEqual(w.name, 'Testing the Test')

        i = Instruction88()
        w.instructions.append(i)
        w.instructions.append(i.copy())
        w.instructions.append(i.copy())

        try:
            w.start = 1
        except:
            self.fail('Setting valid start position failed.')
