# Parser.py - Test cases for Corewar.Parser
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

import sys
import os.path
import hashlib
import unittest
import Corewar

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Redcode.Parser."""

    def setUp(self):
        self.parser_94nop = Corewar.Parser(standard=Corewar.STANDARD_94_NOP)
        self.parser_88 = Corewar.Parser(standard=Corewar.STANDARD_88)
        self.parser_tiny = Corewar.Parser(coresize=800, maxprocesses=800,
                                          maxcycles=8000, maxlength=20,
                                          mindistance=20, pspacesize=50,
                                          standard=Corewar.STANDARD_94)
        self.parser_nano = Corewar.Parser(coresize=80, maxprocesses=80,
                                          maxcycles=800, maxlength=5,
                                          mindistance=5, pspacesize=5,
                                          standard=Corewar.STANDARD_94)
        self.parser_lp = Corewar.Parser(coresize=8000, maxprocesses=8,
                                        maxcycles=80000, maxlength=200,
                                        mindistance=200, pspacesize=500,
                                        standard=Corewar.STANDARD_94)

    def test_warrior_attributed(self):
        """Test parsing of warrior attributes"""

        try:
            w = self.parser_94nop.parse_file('warriors/Test/parser_001.red')
        except:
            self.fail('Probably a parser bug (file: parser_001.red)')

        self.assertEqual(w.name, 'Test Warrior')
        self.assertEqual(w.author, 'James A. Test')
        self.assertEqual(w.strategy, 'Just a test warrior.')
        self.assertEqual(w.date, 'Jan 1, 2006')
        self.assertEqual(w.version, '1.0')

    def test_start_instruction(self):
        """Test parsing of start instruction"""

        try:
            w = self.parser_94nop.parse_file('warriors/Test/parser_002.red')
        except:
            self.fail('Probably a parser bug (file: parser_002.red)')

        self.assertEqual(w.start, 1)

    def test_assert(self):
        """Test parsing and checking of assertions"""

        try:
            w = self.parser_94nop.parse_file('warriors/Test/parser_003.red')
        except:
            self.fail('Probably a parser bug (file: parser_003.red)')

        self.assertEqual(len(self.parser_94nop.warnings), 1)
        warning = self.parser_94nop.warnings[0]
        self.assertEqual(warning, 'Missing \';assert\'. Warrior may not work '\
                                  'with the current settings')

        try:
            w = self.parser_94nop.parse_file('warriors/Test/parser_004.red')
        except:
            self.fail('Probably a parser bug (file: parser_004.red)')

        self.assertEqual(len(self.parser_94nop.warnings), 0)

    def test_88(self):
        """Parsing of 552 warriors according to '88 rules"""

        if not os.path.exists('Test/expected/parse_88.results'):
            self.fail('File \'parse_88.results\' not found.')
        resFile = open('Test/expected/parse_88.results', 'r')

        for line in resFile:
            expectedMD, fname = line.strip().split(' ')
            fname = 'warriors/Koenigstuhl/88/' + fname
            try:
                warrior = self.parser_88.parse_file(fname)
            except Exception as e:
                print(e)
                self.fail('Could not parse file %s' % fname)

            warrior_str = str(warrior)
            if sys.version_info[0] >= 3:
                warrior_str = warrior_str.encode('ISO-8859-1')
            md = hashlib.sha1(warrior_str)
            self.assertEqual(md.hexdigest(), expectedMD)

        resFile.close()

    def test_tiny(self):
        """Parsing of 284 warriors according to '94 rules (tiny hill)"""

        if not os.path.exists('Test/expected/parse_tiny.results'):
            self.fail('File \'parse_tiny.results\' not found.')
        resFile = open('Test/expected/parse_tiny.results', 'r')

        for line in resFile:
            expectedMD, fname = line.strip().split(' ')
            fname = 'warriors/Koenigstuhl/tiny/' + fname
            try:
                warrior = self.parser_tiny.parse_file(fname)
            except Exception as e:
                print(e)
                self.fail('Could not parse file %s' % fname)

            warrior_str = str(warrior)
            if sys.version_info[0] >= 3:
                warrior_str = warrior_str.encode('ISO-8859-1')
            md = hashlib.sha1(warrior_str)
            self.assertEqual(md.hexdigest(), expectedMD)

        resFile.close()

    def test_nano(self):
        """Parsing of 137 warriors according to '94 rules (nano hill)"""

        if not os.path.exists('Test/expected/parse_nano.results'):
            self.fail('File \'parse_nano.results\' not found.')
        resFile = open('Test/expected/parse_nano.results', 'r')

        for line in resFile:
            expectedMD, fname = line.strip().split(' ')
            fname = 'warriors/Koenigstuhl/nano/' + fname
            try:
                warrior = self.parser_nano.parse_file(fname)
            except Exception as e:
                print(e)
                self.fail('Could not parse file %s' % fname)

            warrior_str = str(warrior)
            if sys.version_info[0] >= 3:
                warrior_str = warrior_str.encode('ISO-8859-1')
            md = hashlib.sha1(warrior_str)
            self.assertEqual(md.hexdigest(), expectedMD)

        resFile.close()

    def test_94nop(self):
        """Parsing of 891 warriors according to '94nop rules (94nop hill)"""

        if not os.path.exists('Test/expected/parse_94nop.results'):
            self.fail('File \'parse_94nop.results\' not found.')
        resFile = open('Test/expected/parse_94nop.results', 'r')

        for line in resFile:
            expectedMD, fname = line.strip().split(' ')
            fname = 'warriors/Koenigstuhl/94nop/' + fname
            try:
                warrior = self.parser_94nop.parse_file(fname)
            except Exception as e:
                print(e)
                self.fail('Could not parse file %s' % fname)

            warrior_str = str(warrior)
            if sys.version_info[0] >= 3:
                warrior_str = warrior_str.encode('ISO-8859-1')
            md = hashlib.sha1(warrior_str)
            self.assertEqual(md.hexdigest(), expectedMD)

        resFile.close()

    def test_lp(self):
        """Parsing of 108 warriors according to '94 rules (LP hill)"""

        if not os.path.exists('Test/expected/parse_lp.results'):
            self.fail('File \'parse_lp.results\' not found.')
        resFile = open('Test/expected/parse_lp.results', 'r')

        for line in resFile:
            expectedMD, fname = line.strip().split(' ')
            fname = 'warriors/Koenigstuhl/lp/' + fname
            try:
                warrior = self.parser_lp.parse_file(fname)
            except Exception as e:
                print(e)
                self.fail('Could not parse file %s' % fname)

            warrior_str = str(warrior)
            if sys.version_info[0] >= 3:
                warrior_str = warrior_str.encode('ISO-8859-1')
            md = hashlib.sha1(warrior_str)
            self.assertEqual(md.hexdigest(), expectedMD)

        resFile.close()
