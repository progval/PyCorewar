# Parser.py - Corewar.Parser
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

import os.path
from Corewar.Redcode import *
from Corewar import Warrior

"""Parser - Package for parsing warriors.

Classes:

  InstructionParseError --
  Simple88Parser -- Parser for simplified warrior files (ICWS '88)
  
"""

class InstructionParseError(Exception):
    """Exception for indicating problems while parsing
    Redcode instructions."""

    pass

class WarriorParseError(Exception):
    """Exception for indicating problems while parsing warriors."""

    pass

class Simple88Parser(object):
    """Parser for simplified warrior files (ICWS '88)."""

    # valid opcodes and modes under ICWS '88 rules
    OPCODES = {'DAT': OPCODE_DAT, 'MOV': OPCODE_MOV, 'ADD': OPCODE_ADD,
               'SUB': OPCODE_SUB, 'JMP': OPCODE_JMP, 'JMZ': OPCODE_JMZ,
               'JMN': OPCODE_JMN, 'DJN': OPCODE_DJN, 'CMP': OPCODE_CMP,
               'SPL': OPCODE_SPL, 'SLT': OPCODE_SLT}
    MODES = {'#': MODE_IMMEDIATE, '$': MODE_DIRECT, '@': MODE_INDIRECT,
             '<': MODE_PREDECREMENT}

    def parseFile(self, fname, coresize=8000):
        """parseFile(fname) -> Corwar.Warrior
        
        Parse warrior from file. Use 8000 as the default size of the core."""

        f = open(fname, 'r')
        data = f.read()
        f.close()

        return self.parse(data, coresize)

    def parse(self, s, coresize=8000):
        """parse(s, coresize) -> Corewar.Warrior

        Parse warrior from string. Use 8000 as the default size of the core."""

        warrior = Warrior(coresize)

        # set up parser
        start = 0 # start position
        lineNum = 0
        lines = s.split('\n')
        redcodeFound = False
        endFound = False
        startFound = False

        for line in lines:
            lineNum += 1
            line = line.strip()

            # Ignore everything until the first ;redcode appears.
            if line.lower().startswith(';redcode'):
                redcodeFound = True
            if not redcodeFound:
                continue

            # Ignore empty lines.
            if line == '':
                continue

            # Ignore everything after the first END.
            if line.lower().startswith('end'):
                endFound = True
            if endFound:
                continue

            # Parse name and author.
            if line.lower().startswith(';name'):
                warrior.name = line[5:].strip()
            if line.lower().startswith(';author'):
                warrior.author = line[7:].strip()

            # Ignore all comments.
            if line.startswith(';'):
                continue
            
            line = line.lower()
            # Remove start label and set start position.
            if line.startswith('start'):
                if startFound:
                    raise WarriorParseError, \
                          "Found second start label in line %d." % lineNum
                startFound = True
                start = warrior.length
                line = line[5:].strip()

            # Remove possible comments and parse instruction.
            commentPos = line.find(';')
            if not commentPos == -1:
                line = line[:commentPos]
            try:
                insn = self.parseInstruction(line, coresize)
            except InstructionParseError, e:
                raise WarriorParseError, \
                      "Line %d: %s" % (lineNum, str(e))
            warrior.instructions.append(insn)
                                             
        warrior.start = start

        return warrior

    def parseInstruction(self, s, coresize=8000):
        """parseInstruction(s, coresize) -> Corewar.Redcode.Instruction88
        
        Try to parse a string according to the rules of ICWS '88. Use 8000
        as the default size of the core. A- and B-field are adjusted to
        0 <= field < coresize."""

        insn = Instruction88(coresize)

        # remove all whitespaces and convert to upper case
        s = s.replace(' ', '').replace('\t', '').strip().upper()

        # opcode
        if s == '':
            raise InstructionParseError, "Instruction is empty."
        opcode = s[:3]
        if not self.OPCODES.has_key(opcode):
            raise InstructionParseError, "Invalid opcode: %s" % opcode
        insn.opcode = self.OPCODES[opcode]
        s = s[3:]
        
        # A-mode
        if s == '':
            raise InstructionParseError, "Incomplete instruction."
        if self.MODES.has_key(s[0]):
            insn.amode = self.MODES[s[0]]
            s = s[1:].strip()
        elif s[0] not in '-+0123456789':
            raise InstructionParseError, "Invalid A-mode."

        # parse A-field
        if s == '':
            raise InstructionParseError, "Incomplete instruction."
        sign = 1
        if s[0] in '-+':
            if s[0] == '-':
                sign = -1
            s = s[1:]
        fieldEnd = 0
        while fieldEnd < len(s) and s[fieldEnd].isdigit():
            fieldEnd += 1
        if fieldEnd == 0:
            raise InstructionParseError, "Missing A-field."
        insn.afield = sign * int(s[:fieldEnd])
        s = s[fieldEnd:]

        # check "short" instructions like dat # 0, jmp 7, ...
        if s == '':
            if insn.opcode == OPCODE_DAT:
                # DAT 42 --> DAT # 0, $ 42
                insn.bmode, insn.bfield = insn.amode, insn.afield
                insn.amode, insn.afield = MODE_IMMEDIATE, 0
            elif insn.opcode not in (OPCODE_JMP, OPCODE_SPL):
                raise InstructionParseError, "Incomplete instruction."
            return insn

        if not s[0] == ',':
            raise InstructionParseError, "Missing colon between fields."
        s = s[1:]

        # B-mode
        if s == '':
            raise InstructionParseError, "Incomplete instruction."
        if self.MODES.has_key(s[0]):
            insn.bmode = self.MODES[s[0]]
            s = s[1:]
        elif s[0] not in '+-0123456789':
            raise InstructionParseError, "Invalid B-mode."
            
        # B-field
        if s == '':
            raise InstructionParseError, "Missing B-field."
        try:
            insn.bfield = int(s)
        except:
            raise InstructionParseError, "Invalid B-field."

        # check instruction according to ICWS '88 rules
        if insn.opcode == OPCODE_DAT:
            if insn.amode not in (MODE_IMMEDIATE, MODE_PREDECREMENT) or \
               insn.bmode not in (MODE_IMMEDIATE, MODE_PREDECREMENT):
                raise InstructionParseError, \
                      "Invalid instruction. Proper format: DAT [#<], [#<]."
        elif insn.opcode in (OPCODE_MOV, OPCODE_ADD, OPCODE_SUB, OPCODE_CMP,
                             OPCODE_SLT):
            if insn.bmode == MODE_IMMEDIATE:
                raise InstructionParseError, \
                      "Invalid instruction. No immediate B-mode possible."
        elif insn.opcode in (OPCODE_JMP, OPCODE_JMZ, OPCODE_JMN, OPCODE_DJN,
                             OPCODE_SPL):
            if insn.amode == MODE_IMMEDIATE:
                raise InstructionParseError, \
                      "Invalid instruction. No immediate A-mode possible."
        else:
            raise InstructionParseError, "The parser got itself in trouble."

        return insn 
