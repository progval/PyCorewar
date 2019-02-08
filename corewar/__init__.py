# Corewar/__init__.py
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

import re
import sys
import types
from Corewar.Redcode import *

__doc__ = """Corewar

A collection of modules for debugging and benchmarking Redcode programs.

Subpackages:

  Redcode -- Redcode instructions according to various standards
  Debugging -- Classes for debugging warriors

Classes:

  Warrior -- A class for representing a Core War program
  Parser -- Class for parsing warriors
  Calculator -- A class for evaluating expressions
"""

__all__ = ['Redcode', 'Parser', 'Debugging', 'Benchmarking', 'Warrior',
           'Calculator']
__version__ = '0.2.0'

# PyCorewar version
version = '0.2.0'
version_info = (0, 2, 0)

# Constants for the supported standards.
STANDARD_88 = 0
STANDARD_94_NOP = 1
STANDARD_94 = 2

class Warrior(object):
    """Represents information about one warrior."""

    def __init__(self, coresize = 8000, standard = STANDARD_88):
        """Initializes an instance, using the following default values:
        
        coresize=8000
        standard=STANDARD_88
        instructions=[]
        name='Unknown'
        author='Anonymous'
        start=0
        strategy=''
        version=None
        date=None
        pin=None
        hillkey=None
        """
        
        if coresize < 1:
            raise ValueError('Corsize must be greater than zero.')
        self.coresize = coresize
        self.standard = standard
        self.instructions = []
        self.name = 'Unknown'
        self.author = 'Anonymous'
        self.start = 0
        self.strategy = ''
        self.version = None
        self.date = None
        self.pin = None
        self.hillkey = None

    def __repr__(self):
        """Return string representation of warrior"""
        s = ''

        s += ';redcode-%s\n'
        s += ';name %s\n'
        s += ';author %s\n'
        s += ';assert 1\n'

        if not self.standard == STANDARD_88:
            s += '       ORG      START\n'

        insnNum = 0
        for insn in self.instructions:
            if insnNum == self.start:
                s += 'START  %s\n' % insn
            else: 
                s += '       %s\n' % insn
            insnNum += 1

        if self.standard == STANDARD_88:
            s += '       END      START\n'

        return s

    # FIXME: Remove this after Corewar.Benchmarking has been changed not
    # to use it.
    def __get_length(self):
        return len(self.instructions)

    length = property(__get_length, None)

class WarriorParseError(Exception):
    """Exception for indicating problems while parsing warriors."""

    msg = ''
    line = 0

    def __init__(self, msg, line):
        """Set attributes of Exception."""

        self.msg = msg
        self.line = line

    def __str__(self):
        return 'Parse error in line %d: %s' % (self.line, self.msg)

class Parser(object):
    """Class for parsing warriors under different standards."""

    # Valid characters for the first character of a label.
    __LABEL_FIRST_CHARS = 'abcdefghijklmnopqrstuvwxyz'\
                          'ABCDEFGHIJKLMNOPQRSTUVWXYZ_'

    # Valid characters for a label.
    __LABEL_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_'\
                    '0123456789'

    # Valid characters of an expression.
    __EXPR_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'\
                   '0123456789+-*/%&|=<>()!_'
                   
    # Valid characters for the right side of an EQU.
    __EQU_CHARS = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'\
                  '0123456789+-*/%&|=<>()!_#{}@,. \t'

    # Regular expression for extracting labels.
    __LABEL_RX = re.compile('(?P<label>[a-zA-Z_]\w*)(\s*\:\s*|\s+|$)')

    # Regular expression for replacing loop variables with their values.
    __LOOP_VAR_RX = re.compile('(?P<var>[a-zA-Z_]\w*)') 

    # Regular expression for extraction opcode and modifier.
    __INSN_RX = re.compile('(?P<opcode>dat|mov|add|sub|jmp|jmz|jmn|djn|cmp|'\
                           'spl|slt|mul|div|mod|seq|sne|nop|ldp|stp)'\
                           '(\.(?P<modifier>a|b|f|i|x|ab|ba))?\s+',
                           re.IGNORECASE)

    # List of valid opcodes and pseudoopcodes.
    __VALID_OPCODES = ('dat', 'mov', 'add', 'sub', 'jmp', 'jmz', 'jmn', 'djn',
                       'cmp', 'spl', 'slt', 'mul', 'div', 'mod', 'seq', 'sne',
                       'nop', 'ldp', 'stp', 'org', 'end', 'for', 'rof', 'equ',
                       'pin')

    # Dict for converting strings to opcode values.
    __OPCODES = {'dat': OPCODE_DAT, 'mov': OPCODE_MOV, 'add': OPCODE_ADD,
                 'sub': OPCODE_SUB, 'jmp': OPCODE_JMP, 'jmz': OPCODE_JMZ,
                 'jmn': OPCODE_JMN, 'djn': OPCODE_DJN, 'cmp': OPCODE_CMP,
                 'spl': OPCODE_SPL, 'slt': OPCODE_SLT, 'mul': OPCODE_MUL,
                 'div': OPCODE_DIV, 'mod': OPCODE_MOD, 'seq': OPCODE_SEQ,
                 'sne': OPCODE_SNE, 'nop': OPCODE_NOP, 'ldp': OPCODE_LDP,
                 'stp': OPCODE_STP}
   
    # Dict for converting strings to modifiers.
    __MODIFIERS = {'a': MODIFIER_A, 'b': MODIFIER_B, 'f': MODIFIER_F,
                   'i': MODIFIER_I, 'x': MODIFIER_X, 'ab': MODIFIER_AB,
                   'ba': MODIFIER_BA}
    
    # List of valid pseudoopcodes.
    __VALID_PSEUDOOPCODES = ('org', 'end', 'for', 'rof', 'equ', 'pin')

    # List of valid addressing modes.
    __VALID_MODES = ('#', '$', '@', '<', '>', '*', '{', '}')

    # Dict for converting strings to mode value.
    __MODES = {'#': MODE_IMMEDIATE, '$': MODE_DIRECT, '@': MODE_B_INDIRECT,
               '<': MODE_B_PREDECREMENT, '>': MODE_B_POSTINCREMENT,
               '*': MODE_A_INDIRECT, '{': MODE_A_PREDECREMENT,
               '}': MODE_A_POSTINCREMENT}

    def __init__(self, coresize=8000, maxprocesses=8000, maxcycles=80000,
                 mindistance=100, maxlength=100, pspacesize = 500, rounds = 1,
                 warriors=1, standard=STANDARD_94):
        """Set up the parser and initialize all predefined constants."""
        
        # Plausibility checks.
        if standard not in (STANDARD_88, STANDARD_94_NOP, STANDARD_94):
            raise ValueError("Unknown or unsupported standard.")
        if coresize < 1:
            raise ValueError("Invalid size of core.")
        if maxprocesses < 1:
            raise ValueError("Invalid maximal number of processes.")
        if maxcycles < 1:
            raise ValueError("Invalid maximal number of cycles before tie.")
        if mindistance < 1:
            raise ValueError("Invalid minimal distance between warriors.")
        if maxlength < 1:
            raise ValueError("Invalid maximal length of warrior.")
        if rounds < 1:
            raise ValueError("Invalid number of rounds.")
        if warriors < 1:
            raise ValueError("Invalid number of warriors.")
        if standard == STANDARD_94:
            if pspacesize < 1:
                raise ValueError("Invalid size of p-space.")
        else:
            pspacesize = 0
        if mindistance < maxlength:
            raise ValueError("Minimal distance between warriors is lower "\
                              "than maximal length of a warrior.")
        if coresize < maxlength:
            raise ValueError("Warrior does not fit into core.")
        
        # Set values.
        self.coresize = coresize
        self.maxprocesses = maxprocesses
        self.maxcycles = maxcycles
        self.mindistance = mindistance
        self.maxlength = maxlength
        self.pspacesize = pspacesize
        self.standard = standard
        self.rounds = rounds
        self.warriors = warriors
        self.warnings = []
        self.calc = Calculator()

        self.__predefinedLabels = {'CORESIZE': self.coresize,
                                   'MAXPROCESSES': self.maxprocesses,
                                   'MAXCYCLES': self.maxcycles,
                                   'MINDISTANCE': self.mindistance,
                                   'MAXLENGTH': self.maxlength,
                                   'PSPACESIZE': self.pspacesize,
                                   'ROUNDS': self.rounds,
                                   'WARRIORS':self.warriors,
                                   'CURLINE': 0,
                                   'VERSION': 92} # Emulate pMARS 0.9.2

    def parse_file(self, fname):
        """Parse warrior from file."""

        # FIXME: check max. length of file
        if sys.version_info[0] >= 3:
            f = open(fname, 'r', encoding='ISO-8859-1')
        else:
            f = open(fname, 'r')
        data = f.read()
        f.close()

        return self.parse(data)

    def parse(self, s):
        """parse(s) -> warrior
    
        Parse a warrior from a string. Return the parsed warrior. In
        case of an parse error an exception (WarriorParseError) is thrown.
        All generated warnings are stored in self.warnings."""

        self.calc.reset_registers()

        # Create (empty) warrior and setup up the parser.
        warrior = Warrior(self.coresize, self.standard)
        self.warnings = []

        # Run initial pass:
        #   - parse directives (name, author, strategy, version, date,
        #     hillkey)
        #   - remove all comments and empty lines
        self.__lines = s.split('\n')
        self.__pass0 = self.__run_pass0(warrior)

        # Run pass 1:
        #   - Collect all labels and EQUs.
        #   - Expand all FOR/ROF-loops.
        #   - Replace all stringizations.
        self.__pass1 = []
        self.__labels = {}
        self.__predefinedLabels['CURLINE'] = 0
        self.__equs = {}
        self.__tmpLabels = []
        self.__insnNum = 0
        self.__pass0_line = 0
        # Dependencies for EQUs. It is built during pass 2 and for each EQU
        # it contains the depencencies from other EQUs and the boolean
        # variable, which indicates, whether this EQU has already been
        # (completely) expanded.
        self.__equ_deps = {}
        self.__loopVars = []
        self.__loopLevel = 0
        self.__foundAssert = False

        # Rund pass 1. Stop, if 'END' is found.
        endFound = False
        while self.__pass0_line < len(self.__pass0) and not endFound:
            endFound = self.__run_pass1()
            self.__pass0_line += 1

        #for item in self.__pass1:
        #    print item
        #for label in self.__equs.keys():
        #    print 'equ', label, self.__equs[label]
        #for label in self.__labels.keys():
        #    print 'labels', label, self.__labels[label]
        #print '-----------------------------'

        # Run pass 2:
        #   - Evaluate all remaining expressions (EQUs are expanded, if
        #     necessary).
        #   - Check adherence to ICWS '88, '94 draft or '94 nop.
        #   - Build warrior.
        offset = 0
        start = 0
        self.__predefinedLabels['CURLINE'] = 0
        for (lineNum, opcode, modifier, amode, afield, bmode, bfield) in\
            self.__pass1:

            # Handle ORG and END.
            if opcode in ('org', 'end'):
                if self.standard == STANDARD_88 and opcode == 'org':
                    raise WarriorParseError('Pseudoopcode ORG not allowed '\
                                              'under \'88 rules', lineNum)
                if not afield == '':
                    start = self.__evaluate_expr(afield, lineNum, 0)
                    start %= self.coresize
                continue
            # Handle PIN.
            if opcode == 'pin':
                if self.standard == STANDARD_88:
                    raise WarriorParseError('Pseudoopcode PIN not allowed '\
                                              'under \'88 rules', lineNum)
                elif self.standard == STANDARD_94_NOP:
                    raise WarriorParseError('Pseudoopcode PIN not allowed '\
                                              'under \'94nop rules', lineNum)
                try:
                    pin = int(afield)
                except:
                    raise WarriorParserError('Invalid PIN', lineNum)
                warrior.pin = pin
                continue
            # Check cases, where B-field can be empty and fill it default
            # values. Handle empty B-field for DAT as well.
            if bfield == '':
                if opcode not in ('dat', 'jmp', 'spl', 'nop'):
                    raise WarriorParseError('Missing B-field', lineNum)
                bfield = '0'
                if opcode == 'dat':
                    bfield = afield
                    bmode = amode
                    amode = '#'
                    afield = '0'

            # Evaluate A- and B-field.
            try:
                afield = self.__evaluate_expr(afield, lineNum, offset)
                bfield = self.__evaluate_expr(bfield, lineNum, offset)
            except EvalError as e:
                raise WarriorParseError(str(e), lineNum)

            # Check adherence to specified standard and fill in default
            # opcode modifiers, if they aren't specified.
            if self.standard == STANDARD_88:
                self.__check_icws_88(opcode, modifier, amode, bmode, lineNum)
                insn = Instruction88(self.coresize)
            elif self.standard in (STANDARD_94_NOP, STANDARD_94):
                if self.standard == STANDARD_94_NOP and \
                   opcode in ('stp', 'ldp'):
                    raise WarriorParseError('Opcodes STP and LDP are not '\
                                              'allowed under \'94nop rules',
                                              lineNum)

                # Set default modifier.
                if modifier == '':
                    if opcode in ('dat', 'nop'):
                        modifier = 'f'
                    elif opcode in ('mov', 'seq', 'sne', 'cmp'):
                        if amode == '#':
                            modifier = 'ab'
                        elif bmode == '#':
                            modifier = 'b'
                        else:
                            modifier = 'i'
                    elif opcode in ('add', 'sub', 'mul', 'div', 'mod'):
                        if amode == '#':
                            modifier = 'ab'
                        elif bmode == '#':
                            modifier = 'b'
                        else:
                            modifier = 'f'
                    elif opcode in ('slt', 'ldp', 'stp'):
                        if amode == '#':
                            modifier = 'ab'
                        else:
                            modifier = 'b'
                    elif opcode in ('jmp', 'jmz', 'jmn', 'djn', 'spl'):
                        modifier = 'b'
                    else:
                        raise WarriorParseError('Parser bug found.', lineNum)

                # Create instruction.
                insn = Instruction(self.coresize)
                insn.modifier = self.__MODIFIERS[modifier]
            else:
                raise WarriorParseError('Parser bug found!', lineNum)

            # Set remaining values of instruction.
            insn.opcode = self.__OPCODES[opcode]
            insn.amode = self.__MODES[amode]
            insn.afield = afield
            insn.bmode = self.__MODES[bmode]
            insn.bfield = bfield

            warrior.instructions.append(insn)
            offset -= 1

            self.__predefinedLabels['CURLINE'] += 1

        if not self.__foundAssert:
            self.warnings.append('Missing \';assert\'. Warrior may not work '\
                                 'with the current settings')

        # Check length of warrior.
        if len(warrior.instructions) > self.maxlength:
            diff = len(warrior.instructions) - self.maxlength
            raise WarriorParseError('Too many instructions (about %d '\
                                      'more)' % diff, lineNum)

        # Check for unusual start positions.
        warrior.start = start
        if warrior.start > len(warrior.instructions):
            self.warnings.append('Execution starts outside of program')

        return warrior

    def __run_pass0(self, warrior):
        """Remove all comments and empty lines. Parse all directives
        (name, author, version, date, strategy, hillkey) and store
        values in warrior. Raise exception on missing ;redcode."""

        pass0 = []
        redcodeFound = False
        lineNum = 0
        for line in self.__lines:
            lineNum += 1
            line = line.strip()

            # Ignore everything until the first ;redcode appears.
            # FIXME: store hillkey
            if line.lower().startswith(';redcode'):
                redcodeFound = True
            if not redcodeFound:
                continue

            # Ignore everything after the next ';redcode'.
            if line.startswith(';redocde'):
                break

            # Parse name, author, version, date, strategy and assertions.
            if line[:5].lower() == ';name':
                warrior.name = line[5:].strip()
            if line[:7].lower() == ';author':
                warrior.author = line[7:].strip()
            if line[:8].lower() == ';version':
                warrior.version = line[8:].strip()
            if line[:5].lower() == ';date':
                warrior.date = line[5:].strip()
            # FIXME: handle multiline strategies correctly.
            if line[:9].lower() == ';strategy':
                warrior.strategy += line[9:].strip()
            if line.startswith(';assert'):
                pass0.append([lineNum, line])
                continue
            
            # Remove all comments.
            pos = line.find(';')
            if pos >= 0:
                line = line[:pos]

            # Ignore empty lines.
            if line == '':
                continue

            pass0.append([lineNum, line.strip()])

        if not redcodeFound:
            raise WarriorParseError('No ;redcode found in warrior', lineNum)

        return pass0

    def __run_pass1(self):
        """Collect all labels and EQUs, expand all FOR/ROF-loops
        and replace all stringizations."""
        
        # Get next line.
        (lineNum, line) = self.__pass0[self.__pass0_line]
        pos = 0

        # Replace all currently known EQUs to allow things like:
        # impinsn EQU mov.i $ 0, $ 1
        line = self.__replace_known_equs(line, lineNum)
        
        # Replace all loop variables with their values.
        line = self.__replace_loop_vars(line, lineNum)

        # Handle assertions.
        if line.lower().startswith(';assert'):
            self.__run_pass1_assert(line, lineNum)
            return False

        # Handle labels.
        pos = self.__run_pass1_labels(line, pos, lineNum)
        if pos == len(line):
            return False

        # Handle pseudoopcodes.
        pseudoopcode = line[pos:pos+3].lower()
        if pseudoopcode == 'equ':
            self.__run_pass1_equ(line, pos, lineNum)
            return False
        elif pseudoopcode == 'for':
            # Plausibility check.
            if pos == len(line):
                raise WarriorParseError('Incomplete loop head.', lineNum)

            # Get loop variable.
            if len(self.__tmpLabels) > 0:
                loopVar = self.__tmpLabels.pop()
            else:
                # No loop variable defined.
                loopVar = ''
            self.__save_labels()

            # Get loop expression.
            loopExpr = self.__get_expression(line, pos + 3, self.__EXPR_CHARS,
                                             lineNum)

            # Set CURLINE.
            self.__predefinedLabels['CURLINE'] = self.__insnNum

            # FIXME: Use correct offset!
            offset = 0
            i = self.__evaluate_expr(loopExpr, lineNum, offset)

            # Ignore everything inside a zero-length loop (FOR 0).
            if i == 0:
                while self.__pass0_line < len(self.__pass0):
                    self.__pass0_line += 1
                    (lineNum, line) = self.__pass0[self.__pass0_line]
                    if line[:3].lower() == 'rof':
                        break
                if not line[:3].lower() == 'rof':
                    raise WarriorParseError('Missing ROF for loop', lineNum)
                return False

            # Save information about loop.
            thisLoopLevel = self.__loopLevel + 1
            loopStart = self.__pass0_line

            endFound = False
            for loopRound in range(i):
                self.__loopVars.append((loopVar, loopRound + 1))

                self.__pass0_line = loopStart
                self.__loopLevel += 1
                endFound = False
                while len(self.__loopVars) == thisLoopLevel and not endFound:
                    self.__pass0_line += 1
                    if self.__pass0_line >= len(self.__pass0):
                        raise WarriorParseError('Missing ROF for loop',
                                                  lineNum)
                    endFound = self.__run_pass1()
            return endFound
        elif pseudoopcode == 'rof':
            self.__save_labels()

            # Check, if we are inside loop.
            if len(self.__loopVars) == 0:
                raise WarriorParseError('Missing FOR for this loop', lineNum)

            self.__loopVars.pop()
            self.__loopLevel -= 1 
            return False
        elif pseudoopcode == 'pin':
            self.__run_pass1_pin(line, lineNum)
            return False
        elif pseudoopcode in ('org', 'end'):
            self.__save_labels()

            # Get expression.
            startExpr = self.__get_expression(line, pos + 3, self.__EXPR_CHARS,
                                              lineNum)
            self.__pass1.append((lineNum, pseudoopcode, '', '', startExpr,
                                '', ''))
            if pseudoopcode == 'end':
                return True
            else:
                return False

        # Handle opcode.modifier amode afield, bmode bfield.
        self.__run_pass1_insn(line, pos, lineNum)
        return False

    def __save_labels(self):
        """Assign values to all current temporary labels."""

        for label in self.__tmpLabels:
            self.__labels[label] = self.__insnNum
        self.__tmpLabels = []

    def __get_expression(self, line, pos, validChars, lineNum):
        """Try to extract an expression from line (starting with pos-th
        caracter). Check, that only valid characters are used. Skip all
        whitespaces."""

        expr = ''
        while pos < len(line):
            char = line[pos]
            pos += 1
            if char.isspace():
                continue
            if not char in validChars:
                raise WarriorParseError('Invalid character \'%s\'' % char,
                                          lineNum)
            expr += char
        
        return expr

    def __replace_known_equs(self, line, lineNum):
        """Replace all currently known EQUs."""

        pos = 0
        while pos < len(line):
            char = line[pos]
            if char in self.__LABEL_FIRST_CHARS:
                label = ''
                startPos = pos
                while pos < len(line):
                    char = line[pos]
                    if char in self.__LABEL_CHARS:
                        label += char
                        pos += 1
                    else:
                        break
           
                # Don't replace opcode modifiers.
                prevChar = ''
                if startPos > 0:
                    prevChar = line[startPos-1]
                if prevChar == '.':
                    continue
                    
                # Replace label, if it is a currently known EQU.
                for equVar in self.__equs:
                    if equVar == label:
                        value = self.__equs[equVar]
                        line = line[:startPos] + value + line[pos:]
                        pos = startPos + len(value)
                        break
            else:
                pos += 1

        return line

    def __replace_loop_vars(self, line, lineNum):
        """Replace all loop variables with their values (pass 1)."""

        pos = 0
        while pos < len(line):
            char = line[pos]
            if char in self.__LABEL_FIRST_CHARS:
                label = ''
                startPos = pos
                while pos < len(line):
                    char = line[pos]
                    if char in self.__LABEL_CHARS:
                        label += char
                        pos += 1
                    else:
                        break

                # Replace label, if it is a loop variable.
                for (loopVar, value) in self.__loopVars:
                    if loopVar == label:
                        # [prevChar1][prevChar2][label]
                        prevChar1 = ''
                        prevChar2 = ''
                        if startPos > 0:
                            prevChar2 = line[startPos-1]
                        if startPos > 1:
                            prevChar1 = line[startPos-2]
                            
                        # Replace it.
                        if prevChar2 == '&' and not prevChar1 == '&':
                            value = str(value).zfill(2)
                            line = line[:startPos-1] + value + line[pos:]
                            pos = startPos - 1 + len(value)
                        elif not prevChar2 == '.':
                            line = line[:startPos] + str(value) + line[pos:]
                            pos = startPos + len(str(value))
                        break
            else:
                pos += 1

        return line

    def __run_pass1_labels(self, line, pos, lineNum):
        """Handle labels in pass 1: Mark all found labels as temporary."""

        while 1:
            m = self.__LABEL_RX.match(line, pos)
            if not m:
                break # No more labels found.
            label = m.group('label')
            if label.lower() in self.__VALID_OPCODES:
                break # Seems, that we have found opcode.

            # Check, whether label has already been found.
            if label in self.__tmpLabels or label in self.__labels:
                self.warnings.append('Warnining in line %d: Redefinition of '\
                                     'label \'%s\'' % (lineNum, label))
            elif label in self.__equs:
                raise WarriorParseError('Redefinition of \'%s\'' % label,
                                          lineNum)
            else:
                # Append label to list of temporary labels.
                self.__tmpLabels.append(label)

            # Continue to look for labels after the current one.
            pos = m.end()

        return pos

    def __run_pass1_assert(self, line, lineNum):
        """Handle ';assert' in pass 1: Evaluate and check assertion."""

        expr = self.__get_expression(line, 7, self.__EXPR_CHARS, lineNum)
        if not expr:
            self.warnings.append('Missing parameter for assertion in '\
                                 'line %d' % lineNum)
            return False
        
        # Evaluate expression.
        try:
            result = self.__evaluate_expr(expr, lineNum) % self.coresize
        except:
            raise WarriorParseError('Bad expression for assertion', lineNum)

        self.__foundAssert = True
        if not result == 1:
            raise WarriorParseError('Assertion \'%s\' failed' % expr,
                                      lineNum)

    def __run_pass1_equ(self, line, pos, lineNum):
        """Handle EQU in pass1: Store and check all EQUs."""

        # Check, if at least one label has been found for this EQU.
        if self.__tmpLabels == []:
            raise WarriorParseError('Missing name for EQU', lineNum)

        pos += 3
        if pos == len(line):
            raise WarriorParseError('Missing EQU expression', lineNum)
        if not line[pos].isspace():
            # This should never happen.
            raise WarriorParseError('Parser bug found!', lineNum)
                
        # Get expression.
        equExpr = ''
        while pos < len(line):
            char = line[pos]
            pos += 1
            if not char in self.__EQU_CHARS:
                raise WarriorParseError('Invalid character \'%s\'' % char,
                                          lineNum)
            equExpr += char

        # Save all temporary labels as EQU.
        for label in self.__tmpLabels:
            if label in self.__equs or label in self.__labels:
                raise WarriorParseError('Redefinition of \'%s\'' % label,
                                          lineNum)
            self.__equs[label] = equExpr
            self.__equ_deps[label] = {'deps': set(), 'ready': False,
                                      'line': lineNum}
        self.__tmpLabels = []

    def __run_pass1_pin(self, line, lineNum):
        """Handle 'PIN' in pass 1: Split 'PIN expr' into 'PIN' and 'expr'."""

        self.__save_labels()
        pin = line[3:].strip()
        if not pin:
            raise WarriorParseException('Missing PIN', lineNum)
        self.__pass1.append((lineNum, 'pin', '', '', pin, '', ''))

    def __run_pass1_insn(self, line, pos, lineNum):
        """Handle Redcode instructions in pass1."""
        
        # Handle opcode(.modifier)
        m = self.__INSN_RX.match(line, pos)
        if not m:
            raise WarriorParseError('Missing or invalid opcode', lineNum)
        opcode = m.group('opcode').lower()
        modifier = m.group('modifier')
        if not modifier:
            modifier = ''
        modifier = modifier.lower()
        pos = m.end()

        if pos == len(line):
            raise WarriorParseError('Incomplete instruction', lineNum)

        # Handle possible A-mode.
        amode = line[pos]
        if line[pos] in self.__VALID_MODES:
            pos += 1
        else:
            amode = '$'

        if pos == len(line):
            raise WarriorParseError('Incomplete instruction', lineNum)

        # Handle A-field.
        afield = ''
        while pos < len(line):
            char = line[pos]
            pos += 1
            if char == ',':
                break # Found start of B-field
            # Skip all whitespaces.
            if char.isspace():
                continue
            if not char in self.__EXPR_CHARS: 
                raise WarriorParseError('Invalid character \'%s\'' % char,
                                          lineNum)
            afield += char

        if pos == len(line) and line[-1] == ',':
            raise WarriorParseError('Missing B-operand', lineNum)

        # Skip possible whitespaces.
        while pos < len(line):
            if not line[pos].isspace():
                break
            pos += 1

        # Handle possible B-mode.
        bmode = '$'
        if pos < len(line):
            if line[pos] in self.__VALID_MODES:
                bmode = line[pos]
                pos += 1

        # Handle B-field.
        bfield = self.__get_expression(line, pos, self.__EXPR_CHARS, lineNum)

        self.__save_labels()

        # Append instruction for pass 2.
        self.__pass1.append((lineNum, opcode, modifier, amode, afield,
                            bmode, bfield))
        self.__insnNum += 1

    def __check_icws_88(self, opcode, modifier, amode, bmode, lineNum):
        """Check adherence to ICWS '88 rules and raise exception on
        violation."""
        
        if opcode in ('mul', 'div', 'mod', 'seq', 'sne', 'nop', 'ldp', 'stp'):
            raise WarriorParseError ('Opcode %s not allowed under '\
                                     '\'88 rules' % opcode.upper(), lineNum)
        if modifier:
            raise WarriorParseError('Instruction modifiers are not '\
                                      'allowed under \'88 rules', lineNum)
        if opcode == 'dat':
            if amode not in '#<' or bmode not in '#<':
                raise WarriorParseError('Invalid instruction under '\
                                          '\'88 rules. Proper format:'\
                                          ' DAT [#<], [#<]', lineNum)
        elif opcode in ('mov', 'add', 'sub', 'cmp', 'slt'):
            if amode not in '#$@<' or bmode not in '$@<':
                raise WarriorParseError('Invalid instruction under '\
                                          '\'88 rules. Proper format:'\
                                          ' %s [#$@<], [$@<]' % opcode.upper(),
                                          lineNum)
        elif opcode in ('jmp', 'jmz', 'jmn', 'djn', 'spl'):
            if amode not in '$@<' or bmode not in '#$@<':
                raise WarriorParseError('Invalid instruction under '\
                                          '\'88 rules. Proper format:'\
                                          ' %s [$@<], [#$@<]' % opcode.upper(),
                                          lineNum)
        else:
            raise WarriorParseError('Parser bug found.', lineNum)

    def __expand_EQU(self, label):
        """Expand the given EQU and recurse into other EQU definitions
        until they are resolved or a recursive definition is found."""

        if self.__equ_deps[label]['ready']:
            return

        pos = 0
        expr = self.__equs[label].replace(' ', '').replace('\t', '')
        while pos < len(expr):
            if expr[pos] in '0123456789+-*/%&|=<>()':
                pos += 1
                continue

            # Found label inside expression.
            startPos = pos
            var = ''
            while pos < len(expr):
                if expr[pos] in self.__LABEL_CHARS:
                    pos += 1
                else:
                    break
            var = expr[startPos:pos]
            if var in self.__labels:
                # Do nothing, if it is a simple label.
                continue
            elif var in self.__equs:
                # Append new label (and its dependencies) to dependencies.
                self.__equ_deps[label]['deps'].add(var)
                self.__equ_deps[label]['deps'] |= self.__equ_deps[var]['deps']

                # Check for recursion.
                # ATTENTION! Run recursion check before we recurse or it
                # will NOT work.
                if label in self.__equ_deps[label]['deps']:
                    raise WarriorParseError('Label \'%s\' is recursively '\
                                              'defined' % label,
                                              self.__equ_deps[label]['line'])

                # Expand new label, if necessary.
                if not self.__equ_deps[label]['ready']:
                    self.__expand_EQU(var)

                # Replace label with expanded version.
                expr = expr[:startPos] + self.__equs[var] + expr[pos:]
                pos = startPos + len(self.__equs[var])

        # Save expanded version.
        self.__equs[label] = expr

        # Mark this label as completely expanded.
        self.__equ_deps[label]['ready'] = True

    def __evaluate_expr(self, expr, lineNum, offset = 0):
        """Evaluate the given expression, which might contain labels."""

        # Replace all labels.
        pos = 0
        while pos < len(expr):
            if expr[pos] in '0123456789+-*/%&|=<>()!':
                pos += 1
                continue

            # Found label inside expression.
            startPos = pos
            var = ''
            while pos < len(expr):
                if expr[pos] in self.__LABEL_CHARS:
                    pos += 1
                else:
                    break
            var = expr[startPos:pos]

            if var in self.__labels:
                labelExpr = str(self.__labels[var] + offset)
                expr = expr[:startPos] + labelExpr + expr[pos:]
                pos = startPos + len(labelExpr)
            elif var in self.__predefinedLabels:
                labelExpr = str(self.__predefinedLabels[var])
                expr = expr[:startPos] + labelExpr + expr[pos:]
                pos = startPos + len(labelExpr)
            elif var in self.__equs:
                self.__expand_EQU(var)
                labelExpr = self.__equs[var]
                expr = expr[:startPos] + labelExpr + expr[pos:]
                pos = startPos # The expanded EQU might still contain labels.
            elif var in 'abcdefghijklmnopqrstuvwxyz':
                pass
            else:
                raise WarriorParseError('Label \'%s\' is unknown' % var,
                                          lineNum)

        val = self.calc.eval(expr) % self.coresize
        if val > (self.coresize // 2):
            val = - (self.coresize - val)
        return val

class EvalError(Exception):
    pass

class Calculator(object):
    """Class for evaluating expressions."""

    # Interval registers.
    registers = {'a': 0, 'b': 0, 'c': 0, 'd': 0, 'e': 0, 'f': 0, 'g': 0,
                 'h': 0, 'i': 0, 'j': 0, 'k': 0, 'l': 0, 'm': 0, 'n': 0,
                 'o': 0, 'p': 0, 'q': 0, 'r': 0, 's': 0, 't': 0, 'u': 0,
                 'v': 0, 'w': 0, 'x': 0, 'y': 0, 'z': 0}

    # Operator precedences for all operators, except unary.
    PRECEDENCE = {'*': 5, '/': 5, '%': 5, '+': 4, '-': 4, '>': 3, '<': 3,
                  '==': 3, '!=': 3, '<=': 3, '>=': 3, '&&': 2, '||': 1,
                  '=': 0}

    def reset_registers(self):
        """Reset all internal registers to zero."""

        for register in self.registers:
            self.registers[register] = 0

    def eval(self, expression):
        """Evaluate an expression."""
        
        tokens = self.__tokenize(expression)
        if len(tokens) == 0:
            raise EvalError('Cannot evaluate empty expression.')

        # FIXME: Check first token.
        # FIXME: Check last token.

        # Add an additional pair of parentheses to make things easier.
        tokens = ['(',] + tokens + [')']

        # Check parentheses.
        num_parentheses = 0
        for token in tokens:
            if token == '(':
                num_parentheses += 1
            elif token == ')':
                num_parentheses -= 1
        if num_parentheses < 0:
            raise EvalError('Missing opening parenthesis.')
        elif num_parentheses > 0:
            raise EvalError('Missing closing parenthesis.')

        while len(tokens) > 1:
            # Find first deepest nested pair of parentheses.
            pos1 = 0
            pos2 = len(tokens) - 1
            for pos in range(len(tokens)):
                if tokens[pos] == '(':
                    pos1 = pos
                elif tokens[pos] == ')':
                    pos2 = pos
                    break

            # Evaluate expression inside this pair of prentheses.
            while not pos2 == pos1 + 2:
                # Find operator with highest precedence.
                op_pos = pos2
                op_prec = -1
                for pos in range(pos1 + 1, pos2):
                    if self.__is_op(tokens[pos]):
                        # Check if it is unary operator.
                        if tokens[pos-1] == '(' or self.__is_op(tokens[pos-1]):
                            if tokens[pos] in '!-+':
                                op_prec = 7
                                op_pos = pos
                        elif self.PRECEDENCE[tokens[pos]] > op_prec:
                            op_prec = self.PRECEDENCE[tokens[pos]]
                            op_pos = pos
                            
                op = tokens[op_pos]
                val1 = tokens[op_pos-1]
                val2 = tokens[op_pos+1]
                
                # Unary operator?
                if op_prec == 7:
                    val2 = self.__get_value(val2)

                    # result = op val2
                    if op == '-':
                        result = -val2
                    elif op == '!':
                        if val2 == 0:
                            result = 1
                        else:
                            result = 0
                    elif op == '+':
                        result = val2

                    # Replace (op, val2) with result.
                    tokens[op_pos] = result
                    tokens = tokens[:op_pos+1] + tokens[op_pos+2:]
                    pos2 -= 1
                else:
                    val2 = self.__get_value(val2)
                    if op == '=':
                        if val1 in 'abcdefghijklmnopqrstuvwyxz':
                            self.registers[val1] = val2
                        else:
                            raise EvalError('Bad expression.')
                        result = val2
                    val1 = self.__get_value(val1)

                    # result = val1 op val2
                    if op == '+':
                        result = val1 + val2
                    elif op == '-':
                        result = val1 - val2
                    elif op == '*':
                        result = val1 * val2
                    elif op == '/':
                        # pMARS: -1/2 = 0, Python: -1/2 = -1!
                        result = abs(val1) // val2
                        if val1 < 0:
                            result *= -1
                    elif op == '%':
                        result = val1 % val2
                    elif op == '==':
                        if val1 == val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '!=':
                        if val1 != val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '<':
                        if val1 < val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '>':
                        if val1 > val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '<=':
                        if val1 <= val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '>=':
                        if val1 >= val2:
                            result = 1
                        else:
                            result = 0
                    elif op == '&&':
                        if val1 != 0 and val2 != 0:
                            result = 1
                        else:
                            result = 0
                    elif op == '||':
                        if val1 != 0 or val2 != 0:
                            result = 1
                        else:
                            result = 0

                    # Replace (val1, op, val2) with result.
                    tokens[op_pos-1] = result
                    tokens = tokens[:op_pos] + tokens[op_pos+2:]
                    pos2 -= 2

            # Remove redundant parentheses.
            if tokens[pos1] == '(' and tokens[pos2] == ')':
                tokens[pos1+1] = self.__get_value(tokens[pos1+1])
                tokens = tokens[:pos1] + [tokens[pos1+1],] + tokens[pos2+1:]

        if type(tokens[0]) is int:
            return tokens[0]
        else:
            raise EvalError('Bad expression.')

    def __get_value(self, item):
        """Return value of item (internal register or integer)."""

        if type(item) == int:
            return item
        elif item in 'abcdefghijklmnopqrstuvwxyz':
            return self.registers[item]
        else:
            raise EvalError('Bad expression.')

    def __is_op(self, x):
        """Return True, if the token x is an operator."""

        return x in ('!', '-', '+', '*', '/', '%', '==', '!=', '<', '>',\
                     '<=', '>=', '&&', '||', '=')

    def __tokenize(self, expr):
        """Convert an expression into a list of tokens."""

        tokens = []
        pos = 0 # current position inside expression
        while pos < len(expr):
            c = expr[pos]
            if c.isdigit():
                # Parse and add a number to list of tokens.
                last = pos
                while expr[last].isdigit():
                    last += 1
                    if last >= len(expr):
                        break
                tokens.append(int(expr[pos:last]))
                pos = last
            elif c in '()+-*/%':
                tokens.append(c)
                pos += 1
            elif c == '<':
                if pos+1 < len(expr):
                    if expr[pos+1] == '=':
                        tokens.append('<=')
                        pos += 2
                    else:
                        tokens.append('<')
                        pos += 1
                else:
                    tokens.append(c)
                    pos += 1
            elif c == '>':
                if pos+1 < len(expr):
                    if expr[pos+1] == '=':
                        tokens.append('>=')
                        pos += 2
                    else:
                        tokens.append('>')
                        pos += 1
                else:
                    tokens.append(c)
                    pos += 1
            elif c == '=':
                if pos+1 < len(expr):
                    if expr[pos+1] == '=':
                        tokens.append('==')
                        pos += 2
                    else:
                        tokens.append('=')
                        pos += 1
                else:
                    tokens.append(c)
                    pos += 1
            elif c == '!':
                if pos+1 < len(expr):
                    if expr[pos+1] == '=':
                        tokens.append('!=')
                        pos += 2
                    else:
                        tokens.append('!')
                        pos += 1
                else:
                    tokens.append(c)
                    pos += 1
            elif c == '&':
                if pos+1 < len(expr):
                    if expr[pos+1] == '&':
                        tokens.append('&&')
                        pos += 2
                    else:
                        raise EvalError('Unknown operator at position %d'\
                                         % pos)
                else:
                    raise EvalError('Unknown operator at position %d' % pos)
            elif c == '|':
                if pos+1 < len(expr):
                    if expr[pos+1] == '|':
                        tokens.append('||')
                        pos += 2
                    else:
                        raise EvalError('Unknown operator at position %d'\
                                         % pos)
                else:
                    raise EvalError('Unknown operator at position %d' % pos)
            elif c.isspace():
                # Ignore whitespaces.
                pos += 1
            elif c in 'abcdefghijklmnopqrstuvwxyz':
                # Internal register.
                tokens.append(c)
                pos += 1
            else:
                raise EvalError('Unknown character at position %d.' % pos)

        return tokens
