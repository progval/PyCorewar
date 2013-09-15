# MARSTest.py - Test cases for Corewar.Debugging.MARS88
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
import Corewar.Debugging

class TestCase(unittest.TestCase):

    def test_validation_program(self):
        """Run validation program for ICWS '88 (Corewar.Debugging.MARS88)."""

        mars = Corewar.Debugging.MARS88()

        # load validation program
        parser = Corewar.Parser()
        warrior = parser.parseFile('warriors/88/simplified/Validate88.red')
        mars.load(warrior, 0)

        # open file with exepected results
        f = open('warriors/88/results/Validate88.log')
        
        # execute program (only the first 100 instructions) and compare
        for i in xrange(0, 100):
            mars.step()
            output = '%s   %s' % (str(mars.executedLocation).zfill(5),
                                  mars.executedInstruction)
            expected = f.readline().strip()
            self.assertEqual(output, expected)

        f.close()

    def test_max_processes(self):
        """Test maximal number of processes per warrior in a fight."""

        mars = Corewar.Debugging.MARS88(coresize=8000, maxprocesses=20,
                                        maxcycles=80000)

        # load validation program
        parser = Corewar.Parser.Simple88Parser()
        warrior = parser.parseFile('warriors/88/simplified/MaxProcess.red')
        mars.load(warrior, 0)

        # open file with exepected results
        f = open('warriors/88/results/MaxProcess.log')

        # execute program (only the first 500 instructions) and compare
        for i in xrange(0, 499):
            mars.step()
            output = '%s   %s' % (str(mars.executedLocation).zfill(5),
                                  mars.executedInstruction)
            expected = f.readline().strip()
            self.assertEqual(output, expected)

        f.close()
