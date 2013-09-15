# BenchmarkingMARS88 - Test cases for Corewar.Benchmarking.MARS_88
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
import Corewar
import Corewar.Benchmarking

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Benchmarking.MARS_88."""

    def setUp(self):
        """Set up test case."""

        self.parser = Corewar.Parser(standard=Corewar.STANDARD_88)

    def test_default_values(self):
        """Test default values of the Corewar.Benchmarking.MARS_88."""

        mars88 = Corewar.Benchmarking.MARS_88()
        self.assertEqual(mars88.coresize, 8000)
        self.assertEqual(mars88.maxprocesses, 8000)
        self.assertEqual(mars88.maxcycles, 80000)
        self.assertEqual(mars88.mindistance, 100)
        self.assertEqual(mars88.maxlength, 100)

    def test_values(self):
        """Test values of Corwar.Benchmarkng.MARS_88."""

        mars88 = Corewar.Benchmarking.MARS_88(coresize=80, maxprocesses=80,\
                                             maxcycles=800, mindistance=5,\
                                             maxlength=5)
        self.assertEqual(mars88.coresize, 80)
        self.assertEqual(mars88.maxprocesses, 80)
        self.assertEqual(mars88.maxcycles, 800)
        self.assertEqual(mars88.mindistance, 5)
        self.assertEqual(mars88.maxlength, 5)

    def test_validation_suite(self):
        """Run validation program (Corewar.Benchmarking.MARS_88)."""

        mars88 = Corewar.Benchmarking.MARS_88(maxcycles=1000)
        w1 = self.parser.parse_file('warriors/88/simplified/Validate88.red')
        w2 = self.parser.parse_file('warriors/88/simplified/Wait.red')
        result = mars88.run((w1, w2), 1, 4000)
        self.assertEqual(result, [[0, 0, 1], [0, 0, 1]])

    def test_fight_01(self):
        """Imp vs. Dwarf (100 rounds, '88)"""

        mars88 = Corewar.Benchmarking.MARS_88()
        w1 = self.parser.parse_file('warriors/88/simplified/Imp.red')
        w2 = self.parser.parse_file('warriors/88/simplified/Dwarf.red')
        result = mars88.run((w1, w2), 100, 3000)
        self.assertEqual(result, [[0, 27, 73], [27, 0, 73]])

    def test_fight_02(self):
        """Vala vs. The Seed (100 rounds, '88)"""

        mars88 = Corewar.Benchmarking.MARS_88()
        w1 = self.parser.parse_file('warriors/88/simplified/Vala.red')
        w2 = self.parser.parse_file('warriors/88/simplified/The_Seed.red')
        result = mars88.run((w1, w2), 100, 4377)
        self.assertEqual(result, [[23, 27, 50],[27, 23, 50]])

    def test_fight_03(self):
        """Cannonade vs. Agony 5.1 (100 rounds, '88)"""

        mars88 = Corewar.Benchmarking.MARS_88()
        w1 = self.parser.parse_file('warriors/88/simplified/Cannonade.red')
        w2 = self.parser.parse_file('warriors/88/simplified/Agony_5.1.red')
        result = mars88.run((w1, w2), 100, 6667)
        self.assertEqual(result, [[63, 33, 4], [33, 63, 4]])

    def test_fight_04(self):
        """PacMan vs. Scan the Can (100 rounds, '88)"""

        mars88 = Corewar.Benchmarking.MARS_88()
        w1 = self.parser.parse_file('warriors/88/simplified/PacMan.red')
        w2 = self.parser.parse_file('warriors/88/simplified/Scan_the_Can.red')
        result = mars88.run((w1, w2), 100, 1001)
        self.assertEqual(result, [[39, 40, 21], [40, 39, 21]])

    def test_fight_05(self):
        """PacMan vs. PacMan (100 rounds, '88)"""

        mars88 = Corewar.Benchmarking.MARS_88()
        w1 = self.parser.parse_file('warriors/88/simplified/PacMan.red')
        w2 = self.parser.parse_file('warriors/88/simplified/PacMan.red')
        result = mars88.run((w1, w2), 100, 1099)
        self.assertEqual(result, [[38, 45, 17], [45, 38, 17]])
