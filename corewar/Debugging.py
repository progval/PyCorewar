# Debugging.py - Package for debugging warriors
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

"""Debugging - Package for debugging warriors

Classes:

  ProcessQueue --
  Core --
  MARS88 - MARS according to the rules of ICWS '88
"""

from Corewar._Debugging import *
from Corewar.Redcode import *

class MARS88(object):
    """Memory Array Redcode Simulator for ICWS '88"""
    
    def __init__(self, coresize=8000, maxprocesses=8000, maxcycles=80000):
        """Set up the MARS.

        Keyword arguments:
        coresize -- size of the core (default 8000 instructions)
        maxprocesses -- max. number of processes per warrior (default 8000)
        maxcycles -- max. number of cycles before tie (default 80000)
        """
        
        # plausibility checks
        if coresize < 1:
            raise ValueError("Coresize must be greater than zero.")
        if maxprocesses < 1:
            raise ValueError("Maximal number of processes must be "\
                              "greater than zero.")
        if maxcycles < 1:
            raise ValueError("Maximal number of cycles must be greater "\
                              "than zero.")

        self.__maxprocesses = maxprocesses
        self.__maxcycles = maxcycles
        self.core = Core(coresize)
        self.pqueues = []

        # number (id) of currently executing warrior
        self.warrior = 0
        self.numWarriors = 0
        self.cycle = 0

        # location of executed instruction
        self.__execLoc = 0

        # string representation of executed instruction
        self.__execInsn = ''

        # list of decremented core locations
        self.__decLoc = set()

        # list of incremented core location
        # ICWS'88 doesn't have any increment operators
        # self.__incLoc = []

        # list of core locations written to
        self.__writeLoc = set()

        # list of compared or read core locations
        self.__readLoc = set()

    def load(self, warrior, location):
        """Load the warrior's code into the core with the given position
        and initialize its process queue."""

        # FIXME: plausibility checks

        # copy warrior into core
        for offset in range(0, warrior.length):
            self.core[location+offset] = warrior.instructions[offset].copy()

        # create warrior's process queue
        startPos = (location+warrior.start) % self.coresize
        pqueue = ProcessQueue(startPos, self.maxprocesses)
        self.pqueues.append(pqueue)
        self.numWarriors += 1

    def step(self):
        """Execute the current instruction and update all information about
        the execution."""

        # read current program counter and remove from queue
        pc = self.pqueues[self.warrior].get()
        self.__execLoc = pc

        # copy current instruction from core
        insn = self.core[pc].copy()
        self.__execInsn = str(insn)

        # reset information about execution process
        self.__decLoc.clear()
        self.__writeLoc.clear()
        self.__readLoc.clear()

        # A
        if insn.amode == MODE_IMMEDIATE:
            aAddress = pc
        elif insn.amode == MODE_DIRECT:
            aAddress = pc + insn.afield
        elif insn.amode == MODE_INDIRECT:
            aAddress = pc + insn.afield
            aAddress += self.core[aAddress].bfield
        else: # MODE_PREDECREMENT
            aAddress = pc + insn.afield
            self.core[aAddress].bfield -= 1
            aAddress += self.core[aAddress].bfield
            self.__decLoc.add(aAddress)

        # copy instruction, referred to by A-field
        aInsn = self.core[aAddress].copy()

        # B
        if insn.bmode == MODE_IMMEDIATE:
            bAddress = pc
        elif insn.bmode == MODE_DIRECT:
            bAddress = pc + insn.bfield
        elif insn.bmode == MODE_INDIRECT:
            bAddress  = pc + insn.bfield
            bAddress += self.core[bAddress].bfield
        else: # MODE_PREDECREMENT
            bAddress  = pc + insn.bfield
            self.core[bAddress].bfield -= 1
            bAddress += self.core[bAddress].bfield
            self.__decLoc.add(bAddress)

        # copy instruction, referred to by B-field
        bInsn = self.core[bAddress].copy()

        # execute instruction
        if insn.opcode == OPCODE_DAT:
            pass # do nothing, current process dies
        elif insn.opcode == OPCODE_MOV:
            if insn.amode == MODE_IMMEDIATE:
                self.core[bAddress].bfield = aInsn.afield
            else:
                self.core[bAddress] = aInsn
            self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_ADD:
            if insn.amode == MODE_IMMEDIATE:
                self.core[bAddress].bfield += aInsn.afield
            else:
                self.core[bAddress].afield += aInsn.afield
                self.core[bAddress].bfield += aInsn.bfield
            self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_SUB:
            if insn.amode == MODE_IMMEDIATE:
                self.core[bAddress].bfield -= aInsn.afield
            else:
                self.core[bAddress].afield -= aInsn.afield
                self.core[bAddress].bfield -= aInsn.bfield
            self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_JMP:
            # append jump destination to process queue
            self.pqueues[self.warrior].append(aAddress % self.coresize)
        elif insn.opcode == OPCODE_JMZ:
            if bInsn.bfield == 0:
                # append jump destination to process queue
                self.pqueues[self.warrior].append(aAddress % self.coresize)
            else:
                self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_JMN:
            if not bInsn.bfield == 0:
                # append jump destination to process queue
                self.pqueues[self.warrior].append(aAddress % self.coresize)
            else:
                self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_CMP:
            if insn.amode == MODE_IMMEDIATE:
                if aInsn.afield == bInsn.bfield:
                    # skip next instruction
                    self.pqueues[self.warrior].append((pc + 2) % self.coresize)
                else:
                    self.pqueues[self.warrior].append((pc + 1) % self.coresize)
            else:
                if aInsn == bInsn:
                    # skip next instruction
                    self.pqueues[self.warrior].append((pc + 2) % self.coresize)
                else:
                    self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_SLT:
            if insn.amode == MODE_IMMEDIATE:
                if aInsn.afield < bInsn.bfield:
                    # skip next instruction
                    self.pqueues[self.warrior].append((pc + 2) % self.coresize)
                else:
                    self.pqueues[self.warrior].append((pc + 1) % self.coresize)
            else:
                if aInsn.bfield < bInsn.bfield:
                    # skip next instruction
                    self.pqueues[self.warrior].append((pc + 2) % self.coresize)
                else:
                    self.pqueues[self.warrior].append((pc + 1) % self.coresize)
        elif insn.opcode == OPCODE_DJN:
            if insn.bmode == MODE_IMMEDIATE:
                value = (insn.bfield - 1) % self.coresize
                self.core[pc].bfield = value
            else:
                value = (bInsn.bfield - 1) % self.coresize
                self.core[bAddress].bfield = value
            if value == 0:
                self.pqueues[self.warrior].append((pc + 1) % self.coresize)
            else:
                self.pqueues[self.warrior].append(aAddress % self.coresize)
        elif insn.opcode == OPCODE_SPL:
            self.pqueues[self.warrior].append((pc + 1) % self.coresize)
            self.pqueues[self.warrior].append(aAddress % self.coresize)

    def run(self):
        """Run a complete fight. Handle one-on-one and multiwarrior fights."""

        if self.numWarriors == 1:
            while self.cycle < self.maxcycles:
                if len(self.pqueues[0]) == 0: # Is warrior dead?
                    break
                self.step()
                self.cycle += 1
        else:
            while self.cycle < self.maxcycles:
                numAlive = 0
                for warrior in range(0, self.numWarriors):
                    if len(self.pqueues[warrior]) > 0:
                        numAlive += 1
                if numAlive <= 1:
                    break

                for warrior in range(0, self.numWarriors):
                    if len(self.pqueues[warrior]) > 0:
                        self.warrior = warrior
                        self.step()
                self.cycle += 1

        # FIXME: return result

    def reinit(self):
        """Reinitializes everything."""

        self.pqueues = []
        self.warrior = 0
        self.numWarriors = 0
        self.cycle = 0
        self.core.reinit()

    #
    # read only properties
    #

    def __getCoresize(self):
        """Return size of core."""

        return len(self.core)

    coresize = property(__getCoresize)

    def __getMaxprocesses(self):
        """Return the maximal number of processes per warrior."""

        return self.__maxprocesses

    maxprocesses = property(__getMaxprocesses)

    def __getMaxcycles(self):
        """Return the maximal number of cycles before a tie is declared."""

        return self.__maxcycles

    maxcycles = property(__getMaxcycles)

    def __getExecutedLocation(self):
        """Return the location of the executed instruction."""

        return self.__execLoc

    executedLocation = property(__getExecutedLocation)

    def __getExecutedInstruction(self):
        """Return string represenation of executed instruction."""

        return self.__execInsn

    executedInstruction = property(__getExecutedInstruction)

    def __getDecrementedLocations(self):
        """Return a list of all decremented locations."""

        return list(self.__decLoc)

    decrementedLocations = property(__getDecrementedLocations)

    def __getIncrementedLocations(self):
        """Return a list of all incremented locations. For compatibility
        with other MARS implementations."""

        # ICWS'88 doesn't have any increment operators
        return []

    incrementedLocations = property(__getIncrementedLocations)

    def __getWrittenLocations(self):
        """Return a list of all written to locations."""

        return list(self.__writeLoc)

    writtenLocations = property(__getWrittenLocations)

    def __getReadLocations(self):
        """Return a list of all read (and compared) locations."""

        return list(self.__readLoc)

    readLocations = property(__getReadLocations)
