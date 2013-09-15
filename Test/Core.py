# Core.py - Test cases for Corewar.Debugging.Core
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
    """Test cases for Corewar.Debugging.Core."""
    
    def setUp(self):
        """Set up the test."""
        
        self.core88 = Corewar.Debugging.Core()

    def test_coresize(self):
        """Test default size of core."""

        self.assertEqual(len(self.core88), 8000)

    def test_wrap_around(self):
        """Test, that core wraps around."""

        self.core88.reinit()
        self.core88[10].afield = 42
        self.assertEqual(self.core88[-7990].afield, 42)

        self.core88[-4001].bfield = 17
        self.assertEqual(self.core88[3999].bfield, 17)
