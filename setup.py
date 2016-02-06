#!/usr/bin/env python
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
#
# Usage: python setup.py install

from distutils import core
from distutils.core import Extension
import sys

# General information about PyCorewar.
NAME = 'Corewar'
VERSION = '0.2.0'
DESCRIPTION = 'A fast MARS (Memory Array Redcode Simulator) for debugging '\
              'and benchmarking'
AUTHOR_NAME = 'Jens Gutzeit'
AUTHOR_EMAIL = 'jens@jgutzeit.de'
HOMEPAGE = 'http://corewars.jgutzeit.de/pycorewar/index.en.html'
DOWNLOAD = 'http://corewars.jgutzeit.de/pycorewar/download/'\
           'PyCorwar-%s.tar.bz2' % VERSION
CLASSIFIERS = ['Development Status :: 3 - Alpha',
               'Environment :: Console',
               'License :: OSI Approved :: GNU General Public License (GPL)',
               'Intended Audience :: Developers',
               'Operating System :: Unix',
               'Topic :: Simulation',
               'Programming Language :: C',
               'Programming Language :: Python']
PLATFORMS = 'Python 2.6 and later.'

# FIXME: extra compiler arguments
# EXTRA_COMPILE_ARGS = ['-O6', '-funroll-all-loops']
EXTRA_COMPILE_ARGS = []

# Check Python version
if sys.version_info < (2, 6):
    raise RuntimeError('PyCorewar requires at least Python 2.6 to build.')

core.setup(
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    author=AUTHOR_NAME,
    author_email=AUTHOR_EMAIL,
    url=HOMEPAGE,
    download_url=DOWNLOAD,
    classifiers=CLASSIFIERS,
    platforms=PLATFORMS,
    packages=['Corewar', ],
    package_dir={'Corewar': 'corewar'},
    py_modules=['Corewar.Debugging', ],
    ext_modules=[Extension('Corewar.Redcode',
                           include_dirs=['src/'],
                           sources=['src/Redcodemodule.c',],
                           extra_compile_args=EXTRA_COMPILE_ARGS),
                 Extension('Corewar._Debugging',
                           include_dirs=['src/'],
                           sources=['src/ProcessQueue.c',
                                    'src/Core.c',
                                    'src/_Debuggingmodule.c'],
                           extra_compile_args=EXTRA_COMPILE_ARGS),
                 Extension('Corewar.Benchmarking',
                           include_dirs=['src/'],
                           sources=['src/BenchWarrior.c',
                                    'src/BenchPositioning.c',
                                    'src/BenchMARS88.c',
                                    'src/BenchMARS94nop.c',
                                    'src/Benchmarkingmodule.c'],
                           extra_compile_args=EXTRA_COMPILE_ARGS)
                ],
      )
