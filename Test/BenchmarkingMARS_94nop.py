# BenchmarkingMARS_94nop - Test cases for Corewar.Benchmarking.MARS_94nop
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
    """Test cases for Corewar.Benchmarking.MARS_94nop"""

    def test_default_values(self):
        """Default values of the Corewar.Benchmarking.MARS_94nop"""

        mars = Corewar.Benchmarking.MARS_94nop()
        self.assertEqual(mars.coresize, 8000)
        self.assertEqual(mars.maxprocesses, 8000)
        self.assertEqual(mars.maxcycles, 80000)
        self.assertEqual(mars.mindistance, 100)
        self.assertEqual(mars.maxlength, 100)

    def test_values(self):
        """Setting parameters for Corwar.Benchmarkng.MARS_94nop"""

        mars = Corewar.Benchmarking.MARS_94nop(coresize=80, maxprocesses=80,\
                                               maxcycles=800, mindistance=5,\
                                               maxlength=5)
        self.assertEqual(mars.coresize, 80)
        self.assertEqual(mars.maxprocesses, 80)
        self.assertEqual(mars.maxcycles, 800)
        self.assertEqual(mars.mindistance, 5)
        self.assertEqual(mars.maxlength, 5)

    def test_fight_01(self):
        """Son of Vain vs. Harmless Fluffy Bunny (100 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/sonofvain.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/hfb.red')
        result = mars.run((w1, w2), 100, 6666)
        self.assertEqual(result, [[17, 28, 55], [28, 17, 55]])

    def test_fight_02(self):
        """Arrow vs. nPaper II (100 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/arrow.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/npaper2.red')
        result = mars.run((w1, w2), 100, 932487)
        self.assertEqual(result, [[41, 43, 16], [43, 41, 16]])

    def test_fight_03(self):
        """Muskrat vs. Digital Swarm (1000 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop(coresize=800, maxprocesses=800,
                                               maxcycles=8000, maxlength=20,
                                               mindistance=20)
        parser = Corewar.Parser(coresize=800, maxprocesses=800, maxcycles=8000,
                                mindistance=20, maxlength=20, pspacesize=50,
                                standard=Corewar.STANDARD_94)
        w1 = parser.parse_file('warriors/Koenigstuhl/tiny/muskrat.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/tiny/digitalswarm.red')
        result = mars.run((w1, w2), 1000, 8765)
        self.assertEqual(result, [[127, 702, 171], [702, 127, 171]])

    def test_fight_04(self):
        """Blacken vs. Willow (100 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/blacken.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/willow.red')
        result = mars.run((w1, w2), 100, 131415)
        self.assertEqual(result, [[59, 25, 16], [25, 59, 16]])

    def test_fight_05(self):
        """Hazy Lazy ... vs. TimeScape (1.0) (100 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/hazylazy.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/timescape10.red')
        result = mars.run((w1, w2), 100, 102165)
        self.assertEqual(result, [[47, 34, 19], [34, 47, 19]])

    def test_fight_06(self):
        """Hullabaloo vs. SilKing (100 rounds)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/hullabaloo.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/silking.red')
        result = mars.run((w1, w2), 100, 1110001)
        self.assertEqual(result, [[18, 13, 69], [13, 18, 69]])

    def test_fight_07(self):
        """Digital Swarm vs. White Noise (RBv1.5r10) (all permutations)"""
        mars = Corewar.Benchmarking.MARS_94nop(coresize = 800,
                                               maxprocesses = 800,
                                               maxcycles = 8000,
                                               maxlength = 20,
                                               mindistance = 20)
        parser = Corewar.Parser(coresize = 800, maxprocesses = 800,
                                maxcycles = 800, maxlength = 20,
                                mindistance = 20,
                                standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/tiny/digitalswarm.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/tiny/whitenoise.red')
        result = mars.p_run((w1, w2))
        self.assertEqual(result, [[480, 369, 673], [369, 480, 673]])

    def test_fight_08(self):
        """Tinyshot vs. Hired Sword (all permutations)"""

        mars = Corewar.Benchmarking.MARS_94nop(coresize = 800,
                                               maxprocesses = 800,
                                               maxcycles = 8000,
                                               maxlength = 20,
                                               mindistance = 20)
        parser = Corewar.Parser(coresize = 800, maxprocesses = 800,
                                maxcycles = 800, maxlength = 20,
                                mindistance = 20,
                                standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/tiny/tinyshot.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/tiny/hired.red')
        result = mars.p_run((w1, w2))
        self.assertEqual(result, [[643, 779, 100], [779, 643, 100]])

    def test_fight_09(self):
        """Taking Over Nano IX vs. toy soldier (all permutations)"""

        mars = Corewar.Benchmarking.MARS_94nop(coresize = 80,
                                               maxprocesses = 80,
                                               maxcycles = 800,
                                               maxlength = 5,
                                               mindistance = 5)
        parser = Corewar.Parser(coresize = 80, maxprocesses = 80,
                                maxcycles = 80, maxlength = 5,
                                mindistance = 5,
                                standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/nano/tonano9.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/nano/toysoldier.red')
        result = mars.p_run((w1, w2))
        self.assertEqual(result, [[60, 70, 12], [70, 60, 12]])

    def test_fight_10(self):
        """Arrow vs. TimeScape (1.0) vs. Porch Swing (100 rounds, mw-fight)"""

        mars = Corewar.Benchmarking.MARS_94nop()
        parser = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        w1 = parser.parse_file('warriors/Koenigstuhl/94nop/arrow.red')
        w2 = parser.parse_file('warriors/Koenigstuhl/94nop/timescape10.red')
        w3 = parser.parse_file('warriors/Koenigstuhl/94nop/porchswing.red')
        result = mars.mw_run((w1, w2, w3), rounds=100, seed=2006)
        self.assertEqual(result, [[23, 21, 9, 47], [15, 31, 9, 45],\
                                  [22, 10, 9, 59]])
