# ProcessQueue.py - Test cases for Corewar.Debugging.ProcessQueue 
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
from Corewar.Debugging import ProcessQueue

class TestCase(unittest.TestCase):
    """Test cases for Corewar.Debugging.ProcessQueue"""

    def test_default_values(self):
        """Test initializing of process queue."""

        p = ProcessQueue(42)
        self.assertEqual(len(p), 1)
        self.assertEqual(p[0], 42)

    def test_get_append(self):
        """Test adding and removing of processes."""

        p = ProcessQueue(start=1, maxprocess=4)
        self.assertEqual(len(p), 1)
        self.assertEqual(p[0], 1)

        p.append(2)
        p.append(3)
        self.assertEqual(len(p), 3)
        self.assertEqual(p[0], 1)
        self.assertEqual(p[1], 2)
        self.assertEqual(p[2], 3)

        self.assertEqual(p.get(), 1)
        self.assertEqual(p.get(), 2)
        self.assertEqual(len(p), 1)
        self.assertEqual(p[0], 3)

    def test_maxprocess(self):
        """Test maximal number of processes."""

        p = ProcessQueue(start=42, maxprocess=4)
        p.append(43)
        p.append(44)
        p.append(45)
        self.assertEqual(len(p), 4)
        p.append(46)
        self.assertEqual(len(p), 4)
