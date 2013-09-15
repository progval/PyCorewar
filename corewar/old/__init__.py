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

import re, types

"""Corewar

A collection of modules for debugging and benchmarking Redcode program.

Subpackages:

  Redcode -- Redcode instructions according to various standards
  Debugging -- Classes for debugging warriors

Classes:

  Warrior -- A class for representing a Core War program
  Calculator -- FIXME
  Parser -- Class for parsing warriors
"""

__all__ = ['Redcode', 'Parser', 'Debugging', 'Benchmarking', 'Warrior',
           'Calculator']
__version__ = '0.1.1'

# PyCorewar version
version = '0.1.1'
version_info = (0, 1, 1)

# Constants for the supported standards.
STANDARD_88 = 0
STANDARD_94_NOP = 1
STANDARD_94 = 2

class Warrior(object):
    """Represents information about one warrior."""

    instructions = []

    def __init__(self, coresize = 8000):
        """Initializes an instance, using the following default values:
        
        name='Unknown'
        author='Anonymous'
        start=0
        instructions=[]
        coresize=8000
        strategy='(unknown)'
        version=''
        date=''
        """
        
        if coresize < 1:
            raise ValueError, 'Corsize must be greater than zero.'
        self.__coresize = coresize 
        self.__name = 'Unknown'
        self.__author = 'Anonymous'
        self.__start = 0
        self.__strategy = ''
        self.__version = ''
        self.__date=''
        self.instructions = []

    def __repr__(self):
        """Return string representation of warrior"""

        s  = ';redcode\n'
        s += ';name %s\n' % self.__name
        s += ';author %s\n' % self.__author
        s += ';assert CORESIZE == %d\n\n' % self.__coresize

        insnNum = 0
        for insn in self.instructions:
            if insnNum == self.__start:
                s += 'START'
            s += '\t%s\n' % insn
            insnNum += 1
        s += '\n\tEND\tSTART'

        return s

    def __getName(self):
        """Return the name of the warrior."""

        return self.__name

    def __setName(self, name):
        """Set name of the warrior."""

        self.__name = name

    def __getAuthor(self):
        """Return the author of the warrior."""

        return self.__author

    def __setAuthor(self, author):
        """Set the author of the warrior."""

        if author == '':
            self.__author = 'Anonymous'
        else:
            self.__author = author

    def __getStart(self):
        """Return the start position."""

        return self.__start

    def __setStart(self, start):
        """Set the start position."""

        if start < 0:
            raise ValueError, 'Invalid start position.'
        if start >= len(self.instructions):
            raise ValueError, 'Start position must be inside the warrior.'
            
        self.__start = start

    def __getLength(self):
        """Return the length (number of instructions) of warrior."""

        return len(self.instructions)

    def __getStrategy(self):
        """Return the strategy of warrior."""

        return self.__strategy

    def __setStrategy(self, strategy):
        """Set strategy of warrior."""

        self.__strategy = strategy

    def __getVersion(self):
        """Return the version of warrior."""

        return self.__version

    def __setVersion(self, version):
        """Set version of warrior."""

        self.__version = version

    def __getDate(self):
        """Return date of warrior."""

        return self.__date

    def __setDate(self, date):
        """Set date of warrior."""

        self.__date = date

    name = property(__getName, __setName)
    author = property(__getAuthor, __setAuthor)
    length = property(__getLength, None)
    start = property(__getStart, __setStart)
    strategy = property(__getStrategy, __setStrategy)
    version = property(__getVersion, __setVersion)
    date = property(__getDate, __setDate)

class WarriorParseError(Exception):
    """Exception for indicating problems while parsing warriors."""

    pass

class Parser(object):
    """Class for parsing warriors under different standards."""

    coresize = 8000
    maxprocesses = 8000
    maxcycles = 80000
    mindistance = 100
    maxlength = 100
    pspacesize = 500
    rounds = 1
    standard = STANDARD_94

    # List of valid opcodes.
    __OPCODES = ('dat', 'mov', 'add', 'sub', 'jmp', 'jmz', 'jmn', 'djn',\
                 'cmp', 'spl', 'slt', 'mul', 'div', 'mod', 'seq', 'sne',\
                 'nop', 'ldp', 'stp')

    # List of valid opcodes and pseudoopcodes.
    __PSEUDOOPCODES = ('dat', 'mov', 'add', 'sub', 'jmp', 'jmz', 'jmn',\
                       'djn', 'cmp', 'spl', 'slt', 'mul', 'div', 'mod',\
                       'seq', 'sne', 'nop', 'ldp', 'stp', 'org', 'end',\
                       'pin', 'for', 'rof', 'equ')

    # List of valid opcode modifiers.
    __MODIFIERS = ('a', 'b', 'f', 'i', 'x', 'ab', 'ba')

    # List of valid addressing modes.
    __MODES = ('#', '$', '@', '<', '>', '*', '{', '}')
    
    # List of predefined variables.
    __PREDEFINED = ('CORESIZE', 'MAXPROCESSES', 'MAXCYCLES', 'MINDISTANCE',
                    'MAXLENGTH', 'PSPACESIZE', 'ROUNDS', 'CURLINE', 'VERSION',
                    'WARRIORS')

    __STATE_LABEL = 0
    __STATE_OPCODE = 1
    __STATE_MODIFIER = 2
    __STATE_EXPR = 3

    def __init__(self, coresize=8000, maxprocesses=8000, maxcycles=80000,
                 mindistance=100, maxlength=100, pspacesize = 500, rounds = 1,
                 standard=STANDARD_94):
        """Set up the parser and initialize all predefined constants."""
        
        # Run plausibility checks.
        if standard not in (STANDARD_88, STANDARD_94_NOP, STANDARD_94):
            raise ValueError, "Unknown or unsupported standard."
        if coresize < 1:
            raise ValueError, "Invalid size of core."
        if maxprocesses < 1:
            raise ValueError, "Invalid maximal number of processes."
        if maxcycles < 1:
            raise ValueError, "Invalid maximal number of cycles before tie."
        if mindistance < 1:
            raise ValueError, "Invalid minimal distance between warriors."
        if maxlength < 1:
            raise ValueError, "Invalid maximal length of warrior."
        if rounds < 1:
            raise ValueError, "Invalid number of rounds."
        if standard == STANDARD_94:
            if pspacesize < 1:
                raise ValueError, "Invalid size of p-space."
        if mindistance < maxlength:
            raise ValueError, "Minimal distance between warriors is lower "\
                              "than maximal length of a warrior."
        if coresize < maxlength:
            raise ValueError, "Warrior does not fit into core."
        
        # Set values.
        self.coresize = coresize
        self.maxprocesses = maxprocesses
        self.maxcycles = maxcycles
        self.mindistance = mindistance
        self.maxlength = maxlength
        self.pspacesize = pspacesize
        self.standard = standard
        self.rounds = rounds

        self.__constants = {'CORESIZE': str(coresize),
                            'MAXPROCESSES': str(maxprocesses),
                            'MAXCYCLES': str(maxcycles),
                            'MINDISTANCE': str(mindistance),
                            'MAXLENGTH': str(maxlength),
                            'ROUNDS': str(rounds),
                            'VERSION': '092',}
        if standard == STANDARD_94:
            self.__constants['PSPACESIZE'] = str(pspacesize)

        self.__calculator = Calculator()

    def parseFile(self, fname, debug=False):
        """Parse warrior from file."""

        f = open(fname, 'r')
        data = f.read()
        f.close()

        return self.parse(data, debug)

    def parse(self, s, debug=False):
        """parse(s) -> warnings, warrior
    
        Parse a warrior from string. Return two values: a list of all
        generated warnings and the warrior itself. In case of an parse error
        an exception (WarriorParseError) is thrown."""

        warrior = Warrior(self.coresize)
        self.__warnings = []

        # Set up the parser.
        lineNum = 0 # Current line of source.
        redcodeFound = False
        endFound = False
        assertFound = False
        lines = s.split('\n')

        # Run initial pass:
        #   - parse directives
        #   - remove all comments and empty lines
        self.__pass0 = []
        for line in lines:
            lineNum += 1
            line = line.strip()

            # Replace whitespaces with one space only.
            line = re.sub(r'\s+', r' ', line) 

            # Ignore everything until the first ;redcode appears.
            if line.startswith(';redcode'):
                redcodeFound = True
            if not redcodeFound:
                continue

            # Ignore everything after the first END or next ';redcode'.
            if endFound:
                continue
            if line.startswith(';redocde') or line.lower().startswith('end'):
                endFound = True
                if line.lower().startswith('end'):
                    self.__pass0.append([lineNum, line])
                continue

            # Parse name, author, version and strategy.
            if line.startswith(';name'):
                warrior.name = line[5:].strip()
            if line.startswith(';author'):
                warrior.author = line[7:].strip()
            if line.startswith(';version'):
                warrior.version = line[8:].strip()
            if line.startswith(';date'):
                warrior.date = line[:5].strip()
            # FIXME: handle multiline strategies correctly.
            if line.startswith(';strategy'):
                warrior.strategy += line[9:]

            # Handle ;assert.
            if line.startswith(';assert'):
                self.__pass0.append([lineNum, line])
                continue
            
            # Remove all comments.
            pos = line.find(';')
            if pos >= 0:
                line = line[:pos]

            # Ignore empty lines.
            if line == '':
                continue
                
            self.__pass0.append([lineNum, line])

        # Show debug output for pass 0.
        print 'After pass 0\nInstruction (physical line, instr):\n'
        for item in self.__pass0:
            print '(%5d) %s' % (item[0], item[1])
        print '\n*** END OF PASS 0 ***\n'

        # Run first pass:
        #   - collect all labels and EQUs
        #   - expand all FOR/ROF-loops
        self.__pass1 = []
        self.__labels = {}
        self.__equs = {}
        self.__insnNum = 0
        self.__tmpLabels = [] # Temporary list of labels until consumed by
                              # following EQU or instruction.
        self.__srcLine = 0
        while self.__srcLine < len(self.__pass0):
            self.__run_pass1_label(0)
            self.__srcLine += 1

        # Run second and last pass:
        #   - expand all expression
        #   - add instructions to warrior
        for item in self.__pass1:
            print item

        return self.__warnings, warrior

    def __run_pass1_label(self, pos):
        """Handle (possible) label(s) at start of line and pass on the
        rest of the line to the appropriate methods."""

        lineNum, line = self.__pass0[self.__srcLine]
        if line[pos].lower() in 'abcdefghijklmnopqrstuvwxyz_':
            # Find end of label.
            first = pos
            while line[pos].lower() in 'abcdefghijklmnopqrstuvwxyz_0123456789':
                pos += 1
                if pos >= len(line):
                    break
            label = line[first:pos]

            # Plausbility checks.
            if not pos == len(line):
                if not line[pos] in (' ', '.'):
                    raise WarriorParseError, 'Invalid character \'%s\' in '\
                                             'line %d' % (line[pos], lineNum)

            # Distinguish between labels and (pseudo)opcodes.
            if label.lower() in self.__PSEUDOOPCODES:
                if label.lower() in self.__OPCODES:
                    self.__run_pass1_instruction(first)
                else:
                    self.__run_pass1_pseudoopcode(first)
            else:
                # Do we already know the label?
                if label in self.__tmpLabels or self.__labels.has_key(label):
                    warning = 'Ignoring duplicate label \'%s\' in line %d' %\
                              (label, lineNum)
                    self.__warnings.append(warning)
                else:
                    if self.__equs.has_key(label):
                        raise WarriorParseError, 'Invalid label \'%s\' in '\
                                                 'line %d' %\
                                                 (label, lineNum)
                    self.__tmpLabels.append(label)
                
                if pos < len(line):
                    # Skip over space.
                    if line[pos] == ' ':
                        pos += 1
                    else:
                        raise WarriorParseError, 'Invalid character \'%s\' in'\
                                                 ' line %d' %\
                                                 (line[pos], lineNum)
                    # Go on with rest of line.
                    self.__run_pass1_label(pos)
        else:
            raise WarriorParseError, 'Invalid character \'%s\' in line %d' %\
                                     (line[pos], lineNum)

    def __run_pass1_instruction(self, pos):
        """Handle one instruction."""

        lineNum, line = self.__pass0[self.__srcLine]
        # Check, whether it is really an opcode. This test should always
        # succeed!
        if pos + 4 >= len(line):
            raise WarriorParseError, 'Missing opcode in line %d at position '\
                                     '%d' % (lineNum, pos)
        if line[pos+3] not in (' ', '.'):
            raise WarriorParseError, 'Missing or incomplete opcode in line '\
                                     '%d at position %d' % (lineNum, pos)
        opcode = line[pos:pos+3].lower()
        if opcode not in self.__OPCODES:
            raise WarriorParseError, 'Unknown opcode in line %d at position '\
                                     '%d' % (lineNum, pos)

        # Convert all temporary labels into labels.
        for label in self.__tmpLabels:
            self.__labels[label] = self.__insnNum
        self.__tmpLabels = []

        # Handle modifiers.
        pos +=3
        modifier = ''
        if line[pos] == '.':
            pos += 1
            if pos >= len(line):
                raise WarriorParseError, 'Missing modifier in line %d' %\
                                         lineNum
            modifier = line[pos:pos+2].strip().lower()
            if modifier not in self.__MODIFIERS:
                raise WarriorParseError, 'Unknown modifier \'.%s\' in line %s'\
                                         % (modifier, lineNum)

        # Check for space after opcode(.modifier).
        pos += len(modifier)
        if pos >= len(line):
            raise WarriorParseError, 'Incomplete instruction in line %s' %\
                                     lineNum
        if not line[pos] == ' ':
            raise WarriorParseError, 'Missing space after opcode(.modifier) '\
                                     'in line %d' % lineNum
        pos += 1

        # Handle (possible) A-mode
        amode = '$'
        if line[pos] in self.__MODES:
            amode = line[pos]
            pos += 1

        if pos >= len(line):
            raise WarriorParseError, 'Incomplete instruction in line %s' %\
                                     lineNum

        # Handle A-field.
        last = line.find(',')
        if last < 0:
           last = len(line)
        aexpr = ''
        for i in xrange(pos, last):
            if line[i] == ' ':
                continue
            if line[i].lower() in 'abcdefghijklmnopqrstuvwxyz_0123456789'\
                                  '()+-*/%!=<>&|':
                aexpr += line[i]
            else:
                raise WarriorParseError, 'Invalid character \'%s\' in line %d'\
                                         % (line[i], lineNum)

        # Handle (possible) B-mode
        pos = last
        while line[pos] in (' ', ','):
            pos += 1
            if pos >= len(line):
                break
        bmode = '$'
        if pos < len(line):
            if line[pos] in self.__MODES:
                bmode = line[pos]
                pos += 1

        # Handle (possible) B-field
        bexpr = ''
        for i in xrange(pos, len(line)):
            if line[i] == ' ':
                continue
            if line[i].lower() in 'abcdefghijklmnopqrstuvwxyz_0123456789'\
                                  '()+-*/%!=<>&|':
                bexpr += line[i]
            else:
                raise WarriorParseError, 'Invalid character \'%s\' in line %d'\
                                         % (line[i], lineNum)
        
        # Append instruction.
        self.__pass1.append([lineNum, opcode, modifier, amode, aexpr,\
                             bmode, bexpr])
        self.__insnNum += 1

    def __run_pass1_pseudoopcode(self, pos):
        """Handle ORG/END, EQU and expand FOR/ROF-loops."""

        lineNum, line = self.__pass0[self.__srcLine]
        pseudoopcode = line[pos:pos+3].lower()
        
        # ORG/END
        if pseudoopcode in ('org', 'end'):
            if pos + 3 == len(line):
                self.__pass1.append([lineNum, pseudoopcode, ''])
            else:
                pos += 3
                if not line[pos] == ' ':
                    raise WarriorParseExpression, 'Missing space after \'%s\''\
                                                  ' in line %s' %\
                                                  (pseudoopcode, lineNum)
                pos += 1
                startExpr = ''
                for i in xrange(pos, len(line)):
                    if line[i] == ' ':
                        continue
                    if line[i].lower() in 'abcdefghijklmnopqrstuvwxyz_'\
                                          '0123456789()+-*/%!=<>&|':
                        startExpr += line[i]
                    else:
                        raise WarriorParseError, 'Invalid character \'%s\' in'\
                                                 ' line %d' %\
                                                 (line[i], lineNum)
                self.__pass1.append([lineNum, pseudoopcode, startExpr])
        # EQU
        elif pseudoopcode == 'equ':
            pos += 3
            if pos >= len(line):
                raise WarriorParseException, 'Incomplete EQU in line %d'\
                                             % lineNum
            if len(self.__tmpLabels) == 0:
                raise WarriorParseException, 'Missing label for EQU in '\
                                             'line %s' % lineNum

            # Get EQU expression.
            equExpr = ''
            for i in xrange(pos, len(line)):
                if line[i] == ' ':
                    continue
                if line[i].lower() in 'abcdefghijklmnopqrstuvwxyz_'\
                                      '0123456789()+-*/%!=<>&|':
                    equExpr += line[i]
                else:
                    raise WarriorParseError, 'Invalid character \'%s\' in'\
                                             ' line %d' % (line[i], lineNum)
            if len(equExpr) == 0:
                raise WarriorParseException, 'Incomplte EQU in line %d'\
                                             % lineNum

            # Convert all "temporary" labels into EQUs.
            for label in self.__tmpLabels:
                if self.__equs.has_key(label):
                    raise WarriorParseError, 'Attempt to redefine EQU \'%s\''\
                                             ' in line %d' % (label, lineNum)
                self.__equs[label] = equExpr
            self.__tmpLabels = []
        # FOR/ROF
        elif pseudoopcode == 'for':
            # Set the loop variable.
            var = ''
            if len(self.__tmpLabels):
                var = self.__tmpLabels.pop()

            # Find length of loop.
            loopLines = 0


class EvalError(Exception):
    pass

class Calculator(object):
    """Class for evaluating expressions."""

    # Operator precedences for all operators, except unary.
    PRECEDENCE = {'*': 5, '/': 5, '%': 5, '+': 4, '-': 4, '>': 3, '<': 3,
                  '==': 3, '!=': 3, '<=': 3, '>=': 3, '&&': 2, '||': 1,
                  '=': 0}

    def __init__(self):
        """Set up calculator."""

        pass

    def eval(self, expression):
        """Evaluate an expression."""

        tokens = self.__tokenize(expression)
        if len(tokens) == 0:
            raise EvalError, 'Cannot evaluate empty expression.'

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
            raise EvalError, 'Missing opening parenthesis.'
        elif num_parentheses > 0:
            raise EvalError, 'Missing closing parenthesis.'

        # FIXME: Check first token.
        # FIXME: Check last token.

        while len(tokens) > 1:
            # Find first deepest nested pair of parentheses.
            pos1 = 0
            pos2 = len(tokens) - 1
            for pos in xrange(len(tokens)):
                if tokens[pos] == '(':
                    pos1 = pos
                elif tokens[pos] == ')':
                    pos2 = pos
                    break

            # Evaluate expression inside this pair of prentheses.
            while not pos2 == pos1 + 2:
                # Find first operator with highest precedence.
                op_pos = pos2
                op_prec = -1
                for pos in xrange(pos1 + 1, pos2):
                    if self.__is_op(tokens[pos]):
                        # Check if it is unary operator.
                        if tokens[pos-1] == '(' or self.__is_op(tokens[pos-1]):
                            if tokens[pos] in '!-+':
                                op_prec = 7
                                op_pos = pos
                        if self.PRECEDENCE[tokens[pos]] > op_prec:
                            op_prec = self.PRECEDENCE[tokens[pos]]
                            op_pos = pos
                            
                op = tokens[op_pos]
                val1 = tokens[op_pos-1]
                val2 = tokens[op_pos+1]
                
                # Unary operator?
                if op_prec == 7:
                    # Check for value after operator.
                    if not type(val2) == types.IntType:
                        raise EvalError, 'Bad expression.'

                    # result = op val2
                    if op == '-':
                        result = -val2
                    elif op == '!':
                        if val2 == 0:
                            result = 0
                        else:
                            result = 1
                    elif op == '+':
                        result = val2

                    # Replace (op, val2) with result.
                    tokens[op_pos] = result
                    tokens = tokens[:op_pos+1] + tokens[op_pos+2:]
                    pos2 -= 1
                else:
                    # Check for values in front and after operator.
                    if not type(val1) == types.IntType:
                        raise EvalError, 'Bad expression.'
                    if not type(val2) == types.IntType:
                        raise EvalError, 'Bad expression.'
                
                    # result = val1 op val2
                    if op == '+':
                        result = val1 + val2
                    elif op == '-':
                        result = val1 - val2
                    elif op == '*':
                        result = val1 * val2
                    elif op == '/':
                        result = val1 / val2
                    elif op == '%':
                        result = val1 % val2
                        if val1 < 0:
                            result = -result
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
                if type(tokens[pos1+1]) is not types.IntType:
                    raise EvalError, 'Bad expression.'
                tokens = tokens[:pos1] + [tokens[pos1+1],] + tokens[pos2+1:]

        if type(tokens[0]) is types.IntType:
            return tokens[0]
        else:
            raise EvalError, 'Bad expression.'

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
                        raise EvalError, 'Unknown operator at position %d'\
                                         % pos
                else:
                    raise EvalError, 'Unknown operator at position %d' % pos
            elif c == '|':
                if pos+1 < len(expr):
                    if expr[pos+1] == '|':
                        tokens.append('||')
                        pos += 2
                    else:
                        raise EvalError, 'Unknown operator at position %d'\
                                         % pos
                else:
                    raise EvalError, 'Unknown operator at position %d' % pos
            elif c.isspace():
                # Ignore whitespaces.
                pos += 1
            else:
                raise EvalError, 'Unknown character at position %d.' % pos

        return tokens
